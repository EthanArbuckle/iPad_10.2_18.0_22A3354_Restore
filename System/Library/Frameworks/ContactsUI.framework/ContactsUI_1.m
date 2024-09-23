uint64_t sub_18AD42E80(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

id sub_18AD42EE4(uint64_t a1)
{
  char *v1;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  v3 = &v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_scrollDirection] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cardSizeMultiplier] = 0x3FE6666666666666;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_maximumVerticalRevealFraction] = 0x3FD0000000000000;
  v5 = &v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v6 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedSupplementaryFooterAttributes] = v6;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgresses] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete] = v6;
  v7 = &v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_indexPathToMaintainForTransition];
  v8 = sub_18AF4E5B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_mode] = a1;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_18AD43040()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unint64_t *v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, _QWORD);
  uint64_t *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  uint64_t v40;
  char *v41;
  char v42[32];

  v1 = sub_18AF4E5B8();
  v36 = *(_QWORD *)(v1 - 8);
  v37 = v1;
  MEMORY[0x1E0C80A78](v1, v2);
  v41 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_18AF4E54C();
  v35 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v5);
  v34 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18AF4E528();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v39 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v34 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A560);
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4E534();
  v19 = &v18[*(int *)(v15 + 36)];
  v20 = (unint64_t *)(v0
                           + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete);
  v40 = v8;
  v38 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  while (1)
  {
    v38(v14, v19, v7);
    sub_18ACB7AD8(&qword_1EDF9A568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB13A0], MEMORY[0x1E0CB13E0]);
    v21 = v39;
    sub_18AF4FEA8();
    sub_18ACB7AD8(&qword_1EDF9A570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1248], MEMORY[0x1E0CB1260]);
    v22 = sub_18AF4FBD8();
    v23 = *(void (**)(char *, uint64_t))(v40 + 8);
    v23(v21, v7);
    v23(v14, v7);
    if ((v22 & 1) != 0)
      break;
    v24 = (void (*)(char *, _QWORD))sub_18AF4FEC0();
    v26 = *v25;
    v24(v42, 0);
    v27 = v34;
    v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v34, v18, v4);
    sub_18AF4FEB4();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v4);
    MEMORY[0x18D774710](v26, 0);
    swift_beginAccess();
    v29 = *v20;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v20 = v29;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = sub_18AD217CC(0, *(_QWORD *)(v29 + 16) + 1, 1, v29);
      *v20 = v29;
    }
    v32 = *(_QWORD *)(v29 + 16);
    v31 = *(_QWORD *)(v29 + 24);
    if (v32 >= v31 >> 1)
    {
      v29 = sub_18AD217CC(v31 > 1, v32 + 1, 1, v29);
      *v20 = v29;
    }
    *(_QWORD *)(v29 + 16) = v32 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v29+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v32, v41, v37);
    swift_endAccess();
  }
  return sub_18ACCDE68((uint64_t)v18, &qword_1EDF9A560);
}

uint64_t sub_18AD433A4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  BOOL v25;
  uint64_t result;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v30 - v9;
  v11 = sub_18AF4E5B8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v30 - v18;
  sub_18AD46F88(v1 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_indexPathToMaintainForTransition, (uint64_t)v10);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v20(v10, 1, v11) != 1)
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v27(v19, v10, v11);
    v27(a1, v19, v11);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  sub_18ACCDE68((uint64_t)v10, (uint64_t *)&unk_1EDF99400);
  v21 = v1 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v21 + 16))
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v22(v6, 1, 1, v11);
    goto LABEL_9;
  }
  (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v6, *(_QWORD *)v21 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v11);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v22(v6, 0, 1, v11);
  if (v20(v6, 1, v11) == 1)
  {
LABEL_9:
    sub_18ACCDE68((uint64_t)v6, (uint64_t *)&unk_1EDF99400);
    v28 = a1;
    v29 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v22)(v28, v29, 1, v11);
  }
  v23 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v23(v15, v6, v11);
  if ((sub_18AD44820() & 1) != 0)
  {
    v24 = sub_18AF4E5A0();
    v25 = __OFSUB__(v24, 1);
    result = v24 - 1;
    if (v25)
    {
      __break(1u);
      return result;
    }
    MEMORY[0x18D7746F8](result, 0);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  else
  {
    v23(a1, v15, v11);
  }
  v28 = a1;
  v29 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v22)(v28, v29, 1, v11);
}

void sub_18AD43770()
{
  uint64_t v0;
  double ty;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  objc_class *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  double v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  double MinX;
  double tx;
  double v40;
  CGFloat v41;
  double v42;
  void *v43;
  char *v44;
  char **v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  id v54;
  char **v55;
  uint64_t *v56;
  id v57;
  uint64_t v58;
  void *v59;
  double v60;
  char v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  uint64_t v80;
  id v81;
  CGFloat x;
  CGFloat v83;
  CGFloat width;
  CGFloat height;
  double v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  char *v96;
  double v97;
  double v98;
  double v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  uint64_t v109;
  CGFloat v110;
  char *v111;
  char *v112;
  CGFloat y;
  double *v114;
  id v115;
  char *v116;
  char *v117;
  uint64_t v118;
  void *v119;
  double v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  double v125;
  uint64_t v126;
  char *v127;
  double v128;
  CGFloat v129;
  char **v130;
  char *v131;
  uint64_t *v132;
  __int128 v133;
  __int128 v134;
  _OWORD v135[2];
  double v136;
  double v137;
  objc_super v138;
  CGAffineTransform v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;

  v2 = v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18AF4E5B8();
  v8 = *(char ***)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v116 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v109 - v13;
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v109 - v17;
  v19 = (objc_class *)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  v138.receiver = (id)v2;
  v138.super_class = v19;
  objc_msgSendSuper2(&v138, sel_prepareLayout);
  v20 = objc_msgSend((id)v2, sel_collectionView);
  if (v20)
  {
    v111 = v6;
    v112 = v14;
    v115 = v20;
    objc_msgSend(v20, sel_bounds);
    v22 = v21 * 0.7;
    *(double *)&v133 = v23;
    v24 = v23 * 0.7;
    v25 = (double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize);
    *v25 = v21 * 0.7;
    v25[1] = v23 * 0.7;
    v114 = v25;
    *(double *)&v134 = v21;
    v26 = v21 * 0.3;
    v27 = v21 * 0.3 / -3.8;
    if (*(_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_mode) != 1)
      v27 = 0.0;
    v109 = OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing;
    v125 = v27;
    *(double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing) = v27;
    v28 = (uint64_t *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes);
    swift_beginAccess();
    v29 = MEMORY[0x1E0DEE9D8];
    v132 = v28;
    *v28 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    v30 = (_QWORD *)(v2
                   + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedSupplementaryFooterAttributes);
    swift_beginAccess();
    *v30 = v29;
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)(v2
                    + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider);
    if (v31)
    {
      v32 = swift_retain();
      v33 = ((uint64_t (*)(uint64_t))v31)(v32);
      sub_18ACCDD44(v31);
    }
    else
    {
      v33 = sub_18AD4A26C(MEMORY[0x1E0DEE9D8]);
    }
    *(_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgresses) = v33;
    swift_bridgeObjectRelease();
    v34 = v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds;
    *(_QWORD *)v34 = 0;
    *(_QWORD *)(v34 + 8) = 0;
    v35 = *(double *)&v133;
    *(_QWORD *)(v34 + 16) = v134;
    *(double *)(v34 + 24) = v35;
    v36 = (unint64_t)v115;
    v37 = (unint64_t)objc_msgSend(v115, sel_numberOfItemsInSection_, 0);
    MinX = v114[1];
    v148.origin.y = (v35 - MinX) * 0.5;
    tx = v26 * 0.5;
    v40 = v26 * 0.5 - v125;
    v140 = *(CGRect *)v34;
    v41 = 0.0;
    v148.origin.x = 0.0;
    y = v148.origin.y;
    v148.size.width = v40;
    v148.size.height = MinX;
    *(CGRect *)v34 = CGRectUnion(v140, v148);
    if ((v37 & 0x8000000000000000) != 0)
      goto LABEL_92;
    v131 = (char *)v2;
    v126 = v7;
    v130 = v8;
    v127 = (char *)v37;
    v110 = tx;
    if (v37)
    {
      v121 = *(double *)&v134 * 0.5;
      v120 = *(double *)&v133 * 0.5;
      v42 = (*(double *)&v133 - v24) / 2.8;
      v43 = (void *)objc_opt_self();
      v44 = 0;
      v118 = *MEMORY[0x1E0DC48A0];
      v45 = &selRef_setEmergencyNumberIdentifier_;
      v46 = y;
      v124 = v22;
      v123 = v24;
      v122 = v42;
      v119 = v43;
      v117 = v18;
      do
      {
        v47 = v41;
        v48 = v40;
        v49 = MinX;
        v50 = v125 + CGRectGetMaxX(*(CGRect *)(&v46 - 1));
        v141.origin.x = v50;
        v141.origin.y = v42;
        v141.size.width = v22;
        v141.size.height = v24;
        v51 = CGRectGetMidX(v141) - v121;
        v142.origin.x = v50;
        v142.origin.y = v42;
        v142.size.width = v22;
        v142.size.height = v24;
        v52 = CGRectGetMidY(v142) - v120;
        MEMORY[0x18D774710](v44, 0);
        v53 = (void *)sub_18AF4E558();
        v54 = objc_msgSend(v43, sel_layoutAttributesForCellWithIndexPath_, v53);

        v55 = v45;
        objc_msgSend(v54, v45[70], v51, v52, *(double *)&v134, *(double *)&v133);
        v56 = v132;
        swift_beginAccess();
        v57 = v54;
        MEMORY[0x18D775E98]();
        if (*(_QWORD *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_18AF4FD58();
        v129 = v50;
        sub_18AF4FD70();
        sub_18AF4FD4C();
        swift_endAccess();
        v58 = sub_18AF4E5A0();
        v59 = v131;
        v60 = COERCE_DOUBLE(sub_18AD44AC0(v58));
        if ((v61 & 1) != 0)
          v60 = 0.0;
        v128 = v60;
        sub_18AF4FC5C();
        v62 = (void *)sub_18AF4FC38();
        swift_bridgeObjectRelease();
        v63 = (void *)sub_18AF4E558();
        v64 = objc_msgSend(v43, sel_layoutAttributesForSupplementaryViewOfKind_withIndexPath_, v62, v63);

        v65 = objc_msgSend(v59, sel_collectionView);
        if (v65)
        {
          v66 = v65;
          v67 = objc_msgSend(v65, sel_traitCollection);

          objc_msgSend(v67, sel_displayScale);
        }
        CGAffineTransformMakeScale(&v139, 0.7, 0.7);
        v143.origin.x = v51;
        v143.origin.y = v52;
        v68 = *(double *)&v134;
        *(_QWORD *)&v143.size.width = v134;
        v69 = *(double *)&v133;
        *(_QWORD *)&v143.size.height = v133;
        CGRectApplyAffineTransform(v143, &v139);
        UIRectCenteredIntegralRectScale();
        v70 = v51;
        v72 = v71;
        v74 = v73;
        v144.origin.y = v52;
        v76 = v75;
        v78 = v77;
        v144.origin.x = v70;
        v144.size.width = v68;
        v144.size.height = v69;
        CGRectGetHeight(v144);
        v145.origin.x = v72;
        v145.origin.y = v74;
        v145.size.width = v76;
        v145.size.height = v78;
        CGRectGetMaxY(v145);
        UIRectRoundToScale();
        v45 = v55;
        objc_msgSend(v64, (SEL)v55 + 3016);
        v79 = v128;
        objc_msgSend(v64, sel_setAlpha_, v128);
        if (v79 <= 0.75)
          v80 = 0;
        else
          v80 = 250;
        objc_msgSend(v64, sel_setZIndex_, v80);
        swift_beginAccess();
        v81 = v64;
        MEMORY[0x18D775E98]();
        if (*(_QWORD *)((*v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_18AF4FD58();
        ++v44;
        sub_18AF4FD70();
        sub_18AF4FD4C();
        swift_endAccess();
        v41 = v129;
        v149.origin.x = v129;
        v42 = v122;
        v149.origin.y = v122;
        ty = v124;
        v149.size.width = v124;
        v24 = v123;
        v149.size.height = v123;
        v146 = CGRectUnion(*(CGRect *)v34, v149);
        x = v146.origin.x;
        v83 = v146.origin.y;
        width = v146.size.width;
        height = v146.size.height;

        v7 = v126;
        ((void (*)(char *, uint64_t))v130[1])(v117, v126);
        *(CGFloat *)v34 = x;
        *(CGFloat *)(v34 + 8) = v83;
        v40 = ty;
        MinX = v24;
        v46 = v42;
        *(CGFloat *)(v34 + 16) = width;
        *(CGFloat *)(v34 + 24) = height;
        v22 = ty;
        v37 = (unint64_t)v127;
        v43 = v119;
      }
      while (v127 != v44);
      v40 = ty;
      MinX = v24;
      v2 = (uint64_t)v131;
      v8 = v130;
      v36 = (unint64_t)v115;
      tx = y;
      v86 = v42;
    }
    else
    {
      tx = y;
      v86 = y;
    }
    v87 = v41;
    v88 = v40;
    v89 = MinX;
    v150.origin.x = CGRectGetMaxX(*(CGRect *)(&v86 - 1));
    v150.size.height = v114[1];
    v150.origin.y = tx;
    v150.size.width = v110;
    *(CGRect *)v34 = CGRectUnion(*(CGRect *)v34, v150);
    objc_msgSend((id)v36, sel_contentOffset);
    v40 = v90;
    v31 = (uint64_t)v111;
    sub_18AD433A4(v111);
    v91 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8[6])(v31, 1, v7);
    v36 = (unint64_t)v112;
    if (v91 == 1)
    {
      sub_18ACCDE68(v31, (uint64_t *)&unk_1EDF99400);
      if (!v37)
        goto LABEL_83;
      goto LABEL_60;
    }
    ((void (*)(char *, uint64_t, uint64_t))v8[4])(v112, v31, v7);
    v92 = sub_18AF4E5AC();
    if (v92 + 0x4000000000000000 < 0)
      goto LABEL_93;
    v31 = v92;
    v93 = sub_18AF4E5A0();
    v2 = v93 + 2 * v31;
    if (__OFADD__(v93, 2 * v31))
    {
LABEL_94:
      __break(1u);
    }
    else
    {
      v31 = *v132;
      if (!((unint64_t)*v132 >> 62))
      {
        v94 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_31;
      }
    }
    sub_18AF4E9A8();
    v94 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if (v94 < 0)
    {
      __break(1u);
      goto LABEL_97;
    }
LABEL_31:
    if (v2 < 0)
    {
      v94 = (uint64_t)v127;
      goto LABEL_59;
    }
    v95 = v2 < v94;
    v94 = (uint64_t)v127;
    if (!v95)
    {
LABEL_59:
      ((void (*)(unint64_t, uint64_t))v8[1])(v36, v7);
      if (!v94)
      {
LABEL_83:

        return;
      }
LABEL_60:
      v36 = 0;
      v101 = llround(v40 / v22);
      v102 = __OFSUB__(0, v101) && v101 < 0;
      MinX = round(v40 / v22);
      v2 = *(_QWORD *)&MinX & 0x7FF0000000000000;
      if (v101 >= 0)
        v34 = v101;
      else
        v34 = -v101;
      v8 = &selRef_expandSectionForAccountWithIdentifier_;
      while (1)
      {
        if (v22 == 0.0)
        {
          v7 = 0;
        }
        else
        {
          if (v2 == 0x7FF0000000000000)
            goto LABEL_88;
          if (MinX <= -9.22337204e18)
            goto LABEL_89;
          if (MinX >= 9.22337204e18)
            goto LABEL_90;
          v7 = v34;
          if (v102)
            goto LABEL_91;
        }
        v103 = *v132;
        if ((*v132 & 0xC000000000000001) != 0)
        {
          sub_18AF4E9A8();
          v31 = MEMORY[0x18D776384](v36, v103);
          swift_bridgeObjectRelease();
          v104 = 100 - v36;
          if (__OFSUB__(100, v36))
            goto LABEL_82;
        }
        else
        {
          if ((v36 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_86:
            __break(1u);
LABEL_87:
            __break(1u);
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
LABEL_90:
            __break(1u);
LABEL_91:
            __break(1u);
LABEL_92:
            __break(1u);
            __break(1u);
LABEL_93:
            __break(1u);
            goto LABEL_94;
          }
          if (v36 >= *(_QWORD *)((v103 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_86;
          v31 = (uint64_t)*(id *)(v103 + 8 * v36 + 32);
          v104 = 100 - v36;
          if (__OFSUB__(100, v36))
          {
LABEL_82:
            __break(1u);
            goto LABEL_83;
          }
        }
        if (__OFSUB__(v104, v7))
          goto LABEL_87;
        objc_msgSend((id)v31, sel_setZIndex_, v104 - v7);
        v7 = (uint64_t)v116;
        MEMORY[0x18D774710](v36, 0);
        objc_msgSend((id)v31, sel_frame);
        sub_18AD44560((__int128 *)&v139, v105, v106, v107, v108, v40);
        v134 = *(_OWORD *)&v139.a;
        v133 = *(_OWORD *)&v139.c;
        tx = v139.tx;
        ty = v139.ty;
        ((void (*)(uint64_t, uint64_t))v130[1])(v7, v126);
        v135[0] = v134;
        v135[1] = v133;
        v136 = tx;
        v137 = ty;
        objc_msgSend((id)v31, sel_setTransform_, v135);

        if (v127 == (char *)++v36)
          goto LABEL_83;
      }
    }
    v31 = *v132;
    if ((*v132 & 0xC000000000000001) == 0)
    {
      if ((unint64_t)v2 >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_99;
      }
      v2 = (uint64_t)*(id *)(v31 + 8 * v2 + 32);
LABEL_37:
      objc_msgSend((id)v2, sel_frame);
      MinX = CGRectGetMinX(v147);
      if (MinX == 0.0)
      {

        v40 = MinX;
        goto LABEL_59;
      }
      tx = *v114;
      ty = *(double *)(v34 + 16);
      if (!((unint64_t)*v132 >> 62))
      {
        v31 = *(_QWORD *)((*v132 & 0xFFFFFFFFFFFFF8) + 0x10);
        v96 = v131;
LABEL_42:
        v94 = (uint64_t)v127;
        if (v31)
        {
          v40 = 0.0;
          while (1)
          {
            v97 = v31 == 1 ? *(double *)&v96[v109] * 0.5 : *(double *)&v96[v109];
            v98 = v40 + tx + v97;
            if (MinX < v98 && v98 < ty)
              break;
            v40 = v98;
            if (!--v31)
              goto LABEL_52;
          }
          ty = v98;
        }
        else
        {
LABEL_52:
          v40 = 0.0;
        }
        if (vabdd_f64(v40, MinX) >= vabdd_f64(ty, MinX))
        {
          v100 = *(double *)(v34 + 16);

          if (v100 - tx >= ty)
            v40 = ty;
          else
            v40 = v100 - tx;
        }
        else
        {

        }
        goto LABEL_59;
      }
LABEL_99:
      sub_18AF4E9A8();
      v31 = sub_18AF50328();
      swift_bridgeObjectRelease();
      if (v31 < 0)
        __break(1u);
      v96 = v131;
      v7 = v126;
      v8 = v130;
      v36 = (unint64_t)v112;
      goto LABEL_42;
    }
LABEL_97:
    sub_18AF4E9A8();
    v2 = MEMORY[0x18D776384](v2, v31);
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
}

void sub_18AD44560(__int128 *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, double a6@<D4>)
{
  void *v6;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat tx;
  CGFloat ty;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  double v44;
  __int128 v45;
  CGAffineTransform v46;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v13 = objc_msgSend(v6, sel_collectionView);
  v14 = xmmword_18AF89DF0;
  v15 = xmmword_18AF89E00;
  v16 = 0uLL;
  if (v13)
  {
    v17 = v13;
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    if (CGRectIsEmpty(v49))
    {

      v15 = xmmword_18AF89E00;
      v14 = xmmword_18AF89DF0;
      v16 = 0uLL;
    }
    else
    {
      objc_msgSend(v17, sel_bounds);
      v19 = v18;
      v20 = objc_msgSend(v17, sel_traitCollection);
      objc_msgSend(v20, sel_displayScale);

      v50.origin.x = a2;
      v50.origin.y = a3;
      v50.size.width = a4;
      v50.size.height = a5;
      v21 = v19 * 0.5 + a6 - CGRectGetMidX(v50);
      v22 = fabs(v21 / (a4 * 0.33));
      if (v22 > 1.0)
        v22 = 1.0;
      v44 = v21 * dbl_18AF89E10[v21 > 0.0] + v19 * -0.0365 * v22;
      v23 = 0.0;
      v24 = 0.7;
      if (a4 <= 0.0)
      {
        v25 = 0.0;
        v26 = 0.7;
      }
      else
      {
        v25 = 0.0;
        v26 = 0.7;
        if (a5 > 0.0)
        {
          CGAffineTransformMakeScale(&t1, 0.7, 0.7);
          v51.origin.x = a2;
          v51.origin.y = a3;
          v51.size.width = a4;
          v51.size.height = a5;
          CGRectApplyAffineTransform(v51, &t1);
          BSSizeRoundForScale();
          v26 = v27 / a4;
          v24 = v28 / a5;
          BSRectWithSize();
          UIRectCenteredRect();
          v30 = v29;
          v32 = v31;
          BSRectRoundForScale();
          v25 = v33 - v32;
          v23 = v34 - v30;
        }
      }
      CGAffineTransformMakeScale(&t1, v26, v24);
      v40 = *(_OWORD *)&t1.c;
      v42 = *(_OWORD *)&t1.a;
      tx = t1.tx;
      ty = t1.ty;
      CGAffineTransformMakeTranslation(&t1, v44 + v23, v25);
      v37 = *(_OWORD *)&t1.a;
      v38 = *(_OWORD *)&t1.c;
      v39 = *(_OWORD *)&t1.tx;
      *(_OWORD *)&t1.a = v42;
      *(_OWORD *)&t1.c = v40;
      t1.tx = tx;
      t1.ty = ty;
      *(_OWORD *)&t2.a = v37;
      *(_OWORD *)&t2.c = v38;
      *(_OWORD *)&t2.tx = v39;
      CGAffineTransformConcat(&v46, &t1, &t2);
      v43 = *(_OWORD *)&v46.a;
      v45 = *(_OWORD *)&v46.c;
      v41 = *(_OWORD *)&v46.tx;

      v16 = v41;
      v15 = v43;
      v14 = v45;
    }
  }
  *a1 = v15;
  a1[1] = v14;
  a1[2] = v16;
}

uint64_t sub_18AD44820()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  int v26;
  _BOOL8 v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  _QWORD v32[2];
  uint64_t v33;
  char *v34;
  _BOOL4 v35;
  char *v36;
  void (*v37)(char *, uint64_t, uint64_t);

  v1 = sub_18AF4E5B8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v36 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)v32 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  *(_QWORD *)&v11 = MEMORY[0x1E0C80A78](v9, v10).n128_u64[0];
  v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(v0, sel_collectionView, v11);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = (char *)objc_msgSend(v14, sel_numberOfItemsInSection_, 0);

  v17 = &v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete];
  swift_beginAccess();
  v18 = *(_QWORD *)v17;
  v19 = *(_QWORD *)(*(_QWORD *)v17 + 16);
  v32[1] = *(_QWORD *)v17;
  if (v19)
  {
    v20 = v18 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v21 = *(_QWORD *)(v2 + 72);
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    v33 = v21;
    v34 = v16 - 1;
    v22 = __OFSUB__(v16, 1);
    v35 = v22;
    sub_18AF4E9A8();
    v23 = v36;
    while (1)
    {
      v37(v13, v20, v1);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
      v25(v13, 0, 1, v1);
      v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v13, 1, v1);
      v27 = v26 != 1;
      if (v26 == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v8, v13, v1);
      result = sub_18AF4E5A0();
      if (v35)
      {
        __break(1u);
        return result;
      }
      v29 = result;
      v37(v23, (uint64_t)v8, v1);
      if ((char *)v29 == v34)
      {
        v30 = sub_18AF4E5A0();
        v31 = *(void (**)(char *, uint64_t))(v2 + 8);
        v31(v36, v1);
        v31(v8, v1);
        v23 = v36;
        if (v30 > 0)
          break;
      }
      else
      {
        v24 = *(void (**)(char *, uint64_t))(v2 + 8);
        v24(v23, v1);
        v24(v8, v1);
      }
      v20 += v33;
      if (!--v19)
        goto LABEL_16;
    }
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    sub_18AF4E9A8();
LABEL_16:
    v25(v13, 1, 1, v1);
    v27 = 0;
  }
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_18AD44AC0(uint64_t a1)
{
  uint64_t v1;
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
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18AF4E5B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v39 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v32 - v13;
  v33 = v1;
  v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete);
  swift_beginAccess();
  v16 = *v15;
  v40 = MEMORY[0x1E0DEE9D8];
  v17 = *(_QWORD *)(v16 + 16);
  result = sub_18AF4E9A8();
  v38 = v17;
  if (v17)
  {
    v35 = a1;
    v36 = v14;
    v19 = 0;
    v34 = v6;
    v37 = v16;
    while (v19 < *(_QWORD *)(v16 + 16))
    {
      v20 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v21 = *(_QWORD *)(v8 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, v16 + v20 + v21 * v19, v7);
      v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v22(v6, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
        goto LABEL_15;
      v23 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v24 = v36;
      v23(v36, v6, v7);
      if (sub_18AF4E5A0() > a1)
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v24, v7);
      }
      else
      {
        v23(v39, v24, v7);
        v25 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_18ACB7C28(0, *(_QWORD *)(v25 + 16) + 1, 1);
          v25 = v40;
        }
        v27 = *(_QWORD *)(v25 + 16);
        v26 = *(_QWORD *)(v25 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_18ACB7C28(v26 > 1, v27 + 1, 1);
          v25 = v40;
        }
        *(_QWORD *)(v25 + 16) = v27 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v25 + v20 + v27 * v21, v39, v7);
        v40 = v25;
        v6 = v34;
        a1 = v35;
      }
      ++v19;
      v16 = v37;
      if (v38 == v19)
        goto LABEL_14;
    }
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
LABEL_14:
  v22(v6, 1, 1, v7);
LABEL_15:
  swift_bridgeObjectRelease();
  sub_18ACCDE68((uint64_t)v6, (uint64_t *)&unk_1EDF99400);
  v28 = *(_QWORD *)(v40 + 16);
  swift_release();
  result = a1 + v28;
  if (__OFADD__(a1, v28))
    goto LABEL_21;
  v29 = *(_QWORD *)(v33 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgresses);
  if (*(_QWORD *)(v29 + 16) && (v30 = sub_18AD48D84(result), (v31 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * v30);
  else
    return 0;
}

id sub_18AD44DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_18AF4E5B8();
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (uint64_t)&v20 - v7;
  v9 = sub_18AF4E5A0();
  v10 = v0 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes;
  swift_beginAccess();
  if (!(*(_QWORD *)v10 >> 62))
  {
    v11 = *(_QWORD *)((*(_QWORD *)v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
  while (1)
  {
    sub_18AF4E9A8();
    v11 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if ((v11 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_24:
    sub_18AF4E9A8();
    v12 = (id)MEMORY[0x18D776384](v9, v11);
    swift_bridgeObjectRelease();
LABEL_8:
    v13 = objc_msgSend(v12, sel_indexPath);
    sub_18AF4E570();

    if ((sub_18AF4E564() & 1) != 0)
    {
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v8, v24);
      return v12;
    }
    v10 = *(_QWORD *)v10;
    if (v10 >> 62)
      goto LABEL_26;
    v9 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_18AF4E9A8();
    if (!v9)
      goto LABEL_27;
LABEL_12:
    v21 = v12;
    v22 = v8;
    v8 = 4;
    while (1)
    {
      v14 = (v10 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x18D776384](v8 - 4, v10)
          : *(id *)(v10 + 8 * v8);
      v15 = v14;
      v16 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v17 = objc_msgSend(v14, sel_indexPath);
      sub_18AF4E570();

      LOBYTE(v17) = sub_18AF4E564();
      v18 = *(void (**)(char *, uint64_t))(v23 + 8);
      v18(v4, v24);
      if ((v17 & 1) != 0)
      {
        swift_bridgeObjectRelease();

        v18((char *)v22, v24);
        return v15;
      }

      ++v8;
      if (v16 == v9)
      {
        swift_bridgeObjectRelease();

        v8 = v22;
        goto LABEL_28;
      }
    }
    __break(1u);
  }
LABEL_3:
  v12 = 0;
  if (v9 < 0 || v9 >= v11)
    return v12;
  v11 = *(_QWORD *)v10;
  if ((*(_QWORD *)v10 & 0xC000000000000001) != 0)
    goto LABEL_24;
  if ((unint64_t)v9 < *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(id *)(v11 + 8 * v9 + 32);
    goto LABEL_8;
  }
  __break(1u);
LABEL_26:
  sub_18AF4E9A8();
  v9 = sub_18AF50328();
  if (v9)
    goto LABEL_12;
LABEL_27:
  swift_bridgeObjectRelease();

  v18 = *(void (**)(char *, uint64_t))(v23 + 8);
LABEL_28:
  v18((char *)v8, v24);
  return 0;
}

uint64_t sub_18AD450D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v8;
  void *v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  id v13;

  v5 = sub_18AF4E5A0();
  if (sub_18AF4FC5C() == a1 && v6 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_18AF50418();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      return 0;
  }
  v10 = v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedSupplementaryFooterAttributes;
  result = swift_beginAccess();
  if (*(_QWORD *)v10 >> 62)
  {
    sub_18AF4E9A8();
    v12 = sub_18AF50328();
    result = swift_bridgeObjectRelease();
    if (v12 < 0)
    {
      __break(1u);
LABEL_18:
      sub_18AF4E9A8();
      v9 = (void *)MEMORY[0x18D776384](v5, v10);
      swift_bridgeObjectRelease();
      return (uint64_t)v9;
    }
  }
  else
  {
    v12 = *(_QWORD *)((*(_QWORD *)v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = 0;
  if (v5 < 0 || v5 >= v12)
    return (uint64_t)v9;
  v10 = *(_QWORD *)v10;
  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_18;
  if ((unint64_t)v5 < *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(void **)(v10 + 8 * v5 + 32);
    v13 = v9;
    return (uint64_t)v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_18AD45244(uint64_t a1)
{
  char *v1;
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  CGFloat a;
  void *v41;
  id v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  objc_class *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  objc_super v61;

  v53 = a1;
  v2 = sub_18AF4E5B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v50 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v49 - v8;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v49 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = v1;
  v18 = &v1[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete];
  swift_beginAccess();
  v19 = *(_QWORD *)v18;
  v20 = *(_QWORD *)(*(_QWORD *)v18 + 16);
  v58 = v2;
  v52 = v19;
  if (v20)
  {
    v51 = v9;
    v21 = v19 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v55 = *(_QWORD *)(v3 + 72);
    v57 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    sub_18AF4E9A8();
    v22 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v56 = v3;
    while (1)
    {
      v57(v17, v21, v2);
      v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v23(v17, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v17, 1, v2) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v13, v17, v2);
      v24 = sub_18AF4E5A0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v22 = sub_18AD217E0(0, v22[2] + 1, 1, v22);
      v26 = v22[2];
      v25 = v22[3];
      if (v26 >= v25 >> 1)
        v22 = sub_18AD217E0((_QWORD *)(v25 > 1), v26 + 1, 1, v22);
      v22[2] = v26 + 1;
      v22[v26 + 4] = v24;
      v21 += v55;
      --v20;
      v3 = v56;
      v2 = v58;
      if (!v20)
      {
        v9 = v51;
        goto LABEL_12;
      }
    }
    v9 = v51;
    v27 = v54;
    v28 = v53;
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    sub_18AF4E9A8();
    v22 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_12:
    v27 = v54;
    v28 = v53;
    v23(v17, 1, 1, v58);
  }
  swift_bridgeObjectRelease();
  v29 = sub_18AF4E5A0();
  v30 = sub_18AD42E80(v29, (uint64_t)v22);
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0)
  {
    v47 = (void *)sub_18AF4E558();
    v48 = (objc_class *)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
    v61.receiver = v27;
    v61.super_class = v48;
    a = COERCE_DOUBLE(objc_msgSendSuper2(&v61, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v47));

    return *(_QWORD *)&a;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v28, v58);
  v31 = sub_18AD44820();
  if ((v31 & 1) == 0)
  {
LABEL_17:
    v37 = (void *)sub_18AF4E558();
    v38 = objc_msgSend(v27, sel_layoutAttributesForItemAtIndexPath_, v37);

    v39 = v58;
    if (v38
      && (objc_msgSend(v38, sel_copy),
          v38,
          sub_18AF50154(),
          swift_unknownObjectRelease(),
          sub_18ACBE1B0(0, &qword_1EDF9A578),
          (swift_dynamicCast() & 1) != 0))
    {
      a = v59.a;
      if ((v31 & 1) != 0)
      {
        v41 = (void *)sub_18AF4E558();
        v42 = objc_msgSend(v54, sel_layoutAttributesForItemAtIndexPath_, v41);

        if (v42)
        {
          objc_msgSend(v42, sel_transform);
          objc_msgSend(*(id *)&a, sel_setTransform_, &v60);

        }
      }
      v43 = objc_msgSend(v54, sel_collectionView);
      if (v43)
      {
        v44 = v43;
        objc_msgSend(v43, sel_bounds);
        v46 = v45;

      }
      else
      {
        v46 = 0.0;
      }
      objc_msgSend(*(id *)&a, sel_transform);
      CGAffineTransformTranslate(&v59, &v60, 0.0, v46 / -0.7);
      v60 = v59;
      objc_msgSend(*(id *)&a, sel_setTransform_, &v60);
      objc_msgSend(*(id *)&a, sel_setZIndex_, 2);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v58);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v39);
      a = 0.0;
    }
    return *(_QWORD *)&a;
  }
  result = sub_18AF4E588();
  v33 = result - 1;
  if (!__OFSUB__(result, 1))
  {
    v34 = sub_18AF4E5AC();
    v35 = v50;
    MEMORY[0x18D7746F8](v33, v34);
    v36 = v58;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v58);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v9, v35, v36);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_18AD45818(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4E570();
  v11 = a1;
  v12 = (void *)a4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v12;
}

uint64_t sub_18AD458C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  objc_class *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  id v56;
  objc_super v57;

  v51 = a3;
  v47 = a1;
  v48 = a2;
  v55 = sub_18AF4E5B8();
  v4 = *(_QWORD *)(v55 - 8);
  MEMORY[0x1E0C80A78](v55, v5);
  v45 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v45 - v9;
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v45 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = v3;
  v19 = &v3[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete];
  swift_beginAccess();
  v20 = *(_QWORD *)v19;
  v21 = *(_QWORD *)(*(_QWORD *)v19 + 16);
  v50 = *(_QWORD *)v19;
  if (v21)
  {
    v46 = v10;
    v22 = v20 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v52 = *(_QWORD *)(v4 + 72);
    v54 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    sub_18AF4E9A8();
    v23 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v53 = v4;
    while (1)
    {
      v24 = v55;
      v54(v18, v22, v55);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
      v25(v18, 0, 1, v24);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v18, 1, v24) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v14, v18, v24);
      v26 = sub_18AF4E5A0();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v14, v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v23 = sub_18AD217E0(0, v23[2] + 1, 1, v23);
      v28 = v23[2];
      v27 = v23[3];
      if (v28 >= v27 >> 1)
        v23 = sub_18AD217E0((_QWORD *)(v27 > 1), v28 + 1, 1, v23);
      v23[2] = v28 + 1;
      v23[v28 + 4] = v26;
      v4 = v53;
      v22 += v52;
      if (!--v21)
      {
        v10 = v46;
        goto LABEL_12;
      }
    }
    v10 = v46;
    v29 = v49;
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    sub_18AF4E9A8();
    v23 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_12:
    v29 = v49;
    v24 = v55;
    v25(v18, 1, 1, v55);
  }
  swift_bridgeObjectRelease();
  v30 = v51;
  v31 = sub_18AF4E5A0();
  v32 = sub_18AD42E80(v31, (uint64_t)v23);
  swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
    v42 = (void *)sub_18AF4FC38();
    v43 = (void *)sub_18AF4E558();
    v44 = (objc_class *)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
    v57.receiver = v29;
    v57.super_class = v44;
    v41 = objc_msgSendSuper2(&v57, sel_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_, v42, v43);

    return (uint64_t)v41;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v30, v24);
  if ((sub_18AD44820() & 1) == 0)
  {
LABEL_17:
    v38 = (void *)sub_18AF4FC38();
    v39 = (void *)sub_18AF4E558();
    v40 = objc_msgSend(v29, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, v38, v39);

    if (v40
      && (objc_msgSend(v40, sel_copy),
          v40,
          sub_18AF50154(),
          swift_unknownObjectRelease(),
          sub_18ACBE1B0(0, &qword_1EDF9A578),
          (swift_dynamicCast() & 1) != 0))
    {
      v41 = v56;
      objc_msgSend(v56, sel_setAlpha_, 0.0);
      objc_msgSend(v41, sel_setZIndex_, 1);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v55);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v55);
      return 0;
    }
    return (uint64_t)v41;
  }
  result = sub_18AF4E588();
  v34 = result - 1;
  if (!__OFSUB__(result, 1))
  {
    v35 = sub_18AF4E5AC();
    v36 = v45;
    MEMORY[0x18D7746F8](v34, v35);
    v37 = v55;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v55);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v10, v36, v37);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_18AD45D5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, char *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v18;

  v7 = sub_18AF4E5B8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_18AF4FC5C();
  v14 = v13;
  sub_18AF4E570();
  v15 = a1;
  v16 = (void *)a5(v12, v14, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v16;
}

uint64_t sub_18AD45EA0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  char *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  id v39;
  double MaxX;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  id v52;
  double MinX;
  uint64_t *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v10 = sub_18AF4E5B8();
  v71 = *(_QWORD *)(v10 - 8);
  v72 = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v65 - v16;
  MEMORY[0x1E0C80A78](v18, v19);
  v21 = (char *)&v65 - v20;
  v73[0] = MEMORY[0x1E0DEE9D8];
  v70 = v4;
  v22 = (uint64_t *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes];
  swift_beginAccess();
  v23 = *v22;
  if (!((unint64_t)*v22 >> 62))
  {
    v24 = v23 & 0xFFFFFFFFFFFFF8;
    v25 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
  while (1)
  {
    sub_18AF4E9A8();
    v25 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if (v25 < 0)
      break;
LABEL_3:
    if (!v25)
      return MEMORY[0x1E0DEE9D8];
    v23 = (uint64_t)v70;
    v26 = sub_18AD46B94(0, v25 - 1, v24, a1, a2, a3, a4);
    if ((v27 & 1) != 0)
      return MEMORY[0x1E0DEE9D8];
    v5 = v26;
    if (v26 < 0)
      goto LABEL_78;
    v67 = v17;
    v23 = *v22;
    v17 = (char *)((unint64_t)*v22 >> 62);
    if (v17)
      goto LABEL_79;
    v28 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_18AF4E9A8();
    if (v28 < v5)
      goto LABEL_81;
LABEL_8:
    v66 = v13;
    if (v5)
      v29 = (v23 & 0xC000000000000001) == 0;
    else
      v29 = 1;
    if (!v29)
    {
      sub_18ACBE1B0(0, &qword_1EDF9A578);
      v30 = 0;
      do
      {
        v31 = v30 + 1;
        sub_18AF501FC();
        v30 = v31;
      }
      while (v5 != v31);
    }
    v69 = v22;
    if (v17)
    {
      sub_18AF4E9A8();
      v68 = sub_18AF50334();
      v33 = v35;
      v32 = v36;
      v34 = v37;
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v32 = 0;
      v68 = v23 & 0xFFFFFFFFFFFFFF8;
      v33 = (v23 & 0xFFFFFFFFFFFFFF8) + 32;
      v34 = (2 * v5) | 1;
    }
    v13 = (char *)(v34 >> 1);
    if ((char *)(v34 >> 1) != v32)
    {
      v17 = (char *)(v34 >> 1);
      while (!__OFSUB__(v17--, 1))
      {
        if ((uint64_t)v17 < (uint64_t)v32 || (uint64_t)v17 >= (uint64_t)v13)
          goto LABEL_72;
        v39 = *(id *)(v33 + 8 * (_QWORD)v17);
        objc_msgSend(v39, sel_frame);
        MaxX = CGRectGetMaxX(v74);
        v75.origin.x = a1;
        v75.origin.y = a2;
        v75.size.width = a3;
        v75.size.height = a4;
        if (CGRectGetMinX(v75) > MaxX)
        {

          goto LABEL_32;
        }
        v23 = (uint64_t)objc_msgSend(v39, sel_indexPath);
        sub_18AF4E570();

        v41 = (uint64_t *)objc_msgSend(v70, sel_collectionView);
        if (v41)
        {
          v22 = v41;
          v42 = sub_18AF4E5A0();
          v23 = (uint64_t)objc_msgSend(v22, sel_numberOfItemsInSection_, sub_18AF4E5AC());

          (*(void (**)(char *, uint64_t))(v71 + 8))(v21, v72);
          if (v42 < v23)
          {
            v22 = (uint64_t *)v39;
            v23 = (uint64_t)v73;
            MEMORY[0x18D775E98]();
            if (*(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_18AF4FD58();
            sub_18AF4FD70();
            sub_18AF4FD4C();
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v71 + 8))(v21, v72);
        }

        if (v17 == v32)
          goto LABEL_32;
      }
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
LABEL_32:
    swift_unknownObjectRelease();
    v23 = *v69;
    v17 = (char *)((unint64_t)*v69 >> 62);
    if (v17)
      goto LABEL_82;
    v43 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v43 < v5)
      goto LABEL_86;
    result = sub_18AF4E9A8();
LABEL_35:
    if ((v23 & 0xC000000000000001) != 0 && v5 != v43)
    {
      if (v5 >= v43)
        goto LABEL_91;
      sub_18ACBE1B0(0, &qword_1EDF9A578);
      v45 = v5;
      do
      {
        v46 = v45 + 1;
        sub_18AF501FC();
        v45 = v46;
      }
      while (v43 != v46);
    }
    if (v17)
    {
      sub_18AF4E9A8();
      v21 = (char *)sub_18AF50334();
      v47 = v48;
      v5 = v49;
      v51 = v50;
      swift_bridgeObjectRelease_n();
      v43 = v51 >> 1;
    }
    else
    {
      v21 = (char *)(v23 & 0xFFFFFFFFFFFFFF8);
      v47 = (v23 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    v13 = v66;
    v17 = v67;
    if (v5 == v43)
    {
LABEL_55:
      swift_unknownObjectRelease();
      v22 = (uint64_t *)v73[0];
      if (v73[0] >> 62)
        goto LABEL_87;
      v5 = *(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFF8) + 0x10);
      result = sub_18AF4E9A8();
      if (v5)
        goto LABEL_57;
LABEL_88:
      swift_bridgeObjectRelease();
      return (uint64_t)v22;
    }
    while (v5 < v43)
    {
      v52 = *(id *)(v47 + 8 * v5);
      objc_msgSend(v52, sel_frame);
      MinX = CGRectGetMinX(v76);
      v77.origin.x = a1;
      v77.origin.y = a2;
      v77.size.width = a3;
      v77.size.height = a4;
      if (MinX > CGRectGetMaxX(v77))
      {

        goto LABEL_55;
      }
      v23 = (uint64_t)objc_msgSend(v52, sel_indexPath);
      sub_18AF4E570();

      v54 = (uint64_t *)objc_msgSend(v70, sel_collectionView);
      if (v54)
      {
        v22 = v54;
        v55 = sub_18AF4E5A0();
        v23 = (uint64_t)objc_msgSend(v22, sel_numberOfItemsInSection_, sub_18AF4E5AC());

        (*(void (**)(char *, uint64_t))(v71 + 8))(v17, v72);
        if (v55 < v23)
        {
          v22 = (uint64_t *)v52;
          v23 = (uint64_t)v73;
          MEMORY[0x18D775E98]();
          if (*(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_18AF4FD58();
          sub_18AF4FD70();
          sub_18AF4FD4C();
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v71 + 8))(v17, v72);
      }
      ++v5;

      if (v43 == v5)
        goto LABEL_55;
    }
LABEL_75:
    __break(1u);
  }
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  sub_18AF4E9A8();
  result = sub_18AF50328();
  if (result < 0)
    goto LABEL_92;
  sub_18AF4E9A8();
  v62 = sub_18AF50328();
  swift_bridgeObjectRelease();
  if (v62 >= v5)
    goto LABEL_8;
LABEL_81:
  __break(1u);
LABEL_82:
  swift_bridgeObjectRetain_n();
  v43 = sub_18AF50328();
  result = swift_bridgeObjectRelease();
  if (v43 < v5)
    goto LABEL_93;
  sub_18AF4E9A8();
  v63 = sub_18AF50328();
  result = swift_bridgeObjectRelease();
  if (v63 < v5)
    goto LABEL_94;
  sub_18AF4E9A8();
  v64 = sub_18AF50328();
  result = swift_bridgeObjectRelease();
  if (v64 >= v43)
    goto LABEL_35;
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  sub_18AF4E9A8();
  result = sub_18AF50328();
  v5 = result;
  if (!result)
    goto LABEL_88;
LABEL_57:
  if (v5 >= 1)
  {
    v56 = &v70[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedSupplementaryFooterAttributes];
    v17 = (char *)((unint64_t)v22 & 0xC000000000000001);
    swift_beginAccess();
    v57 = 0;
    do
    {
      if (v17)
        v58 = (char *)MEMORY[0x18D776384](v57, v22);
      else
        v58 = (char *)(id)v22[v57 + 4];
      v21 = v58;
      v59 = objc_msgSend(v58, sel_indexPath);
      sub_18AF4E570();

      v23 = sub_18AF4E5A0();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v72);
      v60 = *(_QWORD *)v56;
      if ((*(_QWORD *)v56 & 0xC000000000000001) != 0)
      {
        sub_18AF4E9A8();
        MEMORY[0x18D776384](v23, v60);
        v61 = (id)swift_bridgeObjectRelease();
      }
      else
      {
        if (v23 < 0)
          goto LABEL_73;
        if ((unint64_t)v23 >= *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_74;
        v61 = *(id *)(v60 + 8 * v23 + 32);
      }
      MEMORY[0x18D775E98](v61);
      if (*(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v73[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_18AF4FD58();
      ++v57;
      sub_18AF4FD70();
      sub_18AF4FD4C();

    }
    while (v5 != v57);
    swift_bridgeObjectRelease();
    return v73[0];
  }
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
  return result;
}

uint64_t sub_18AD467D0(CGFloat MinX)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  _QWORD *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  CGRect v29;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18AF4E5B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD433A4((char *)v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v12, v7, v8);
    v14 = (uint64_t)v12;
    v15 = sub_18AF4E5AC();
    if (v15 + 0x4000000000000000 < 0)
    {
      __break(1u);
    }
    else
    {
      v7 = v15;
      v16 = sub_18AF4E5A0();
      v14 = v16 + 2 * v7;
      if (!__OFADD__(v16, 2 * v7))
      {
        v7 = v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes;
        swift_beginAccess();
        if (!(*(_QWORD *)v7 >> 62))
        {
          v17 = *(_QWORD *)((*(_QWORD *)v7 & 0xFFFFFFFFFFFFF8) + 0x10);
          if ((v14 & 0x8000000000000000) == 0)
          {
            while (v14 < v17)
            {
              v7 = *(_QWORD *)v7;
              if ((v7 & 0xC000000000000001) != 0)
                goto LABEL_18;
              if ((unint64_t)v14 < *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
              {
                v18 = *(id *)(v7 + 8 * v14 + 32);
                goto LABEL_12;
              }
              __break(1u);
LABEL_20:
              v17 = v9;
              v9 = v28;
              if (v14 < 0)
                break;
            }
          }
          result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
          if (MinX == 0.0)
            return result;
          goto LABEL_22;
        }
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_16:
    v28 = v9;
    sub_18AF4E9A8();
    v9 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if ((v9 & 0x8000000000000000) == 0)
      goto LABEL_20;
    __break(1u);
LABEL_18:
    sub_18AF4E9A8();
    v18 = (id)MEMORY[0x18D776384](v14, v7);
    swift_bridgeObjectRelease();
LABEL_12:
    objc_msgSend(v18, sel_frame);
    MinX = CGRectGetMinX(v29);

    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    if (MinX == 0.0)
      return result;
    goto LABEL_22;
  }
  result = sub_18ACCDE68(v7, (uint64_t *)&unk_1EDF99400);
  if (MinX == 0.0)
    return result;
LABEL_22:
  v19 = *(double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize);
  v20 = *(double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds + 16);
  v21 = (_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes);
  result = swift_beginAccess();
  if (*v21 >> 62)
  {
    sub_18AF4E9A8();
    v22 = sub_18AF50328();
    result = swift_bridgeObjectRelease();
    if (v22 < 0)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    v22 = *(_QWORD *)((*v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v22)
  {
    v23 = 0.0;
    do
    {
      if (v22 == 1)
        v24 = *(double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing)
            * 0.5;
      else
        v24 = *(double *)(v2 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing);
      v25 = v23 + v19 + v24;
      if (MinX < v25 && v25 < v20)
        break;
      v23 = v25;
      --v22;
    }
    while (v22);
  }
  return result;
}

uint64_t sub_18AD46B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t result;
  id v19;
  double MaxX;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (a2 < a1)
    return 0;
  v15 = a1 + a2;
  if (__OFADD__(a1, a2))
  {
    __break(1u);
LABEL_19:
    v27 = a3;
    sub_18AF4E9A8();
    v19 = (id)MEMORY[0x18D776384](v7, v27);
    swift_bridgeObjectRelease();
LABEL_11:
    objc_msgSend(v19, sel_frame);
    v31.origin.x = v12;
    v31.origin.y = v11;
    v31.size.width = v10;
    v31.size.height = v9;
    if (CGRectIntersectsRect(v28, v31))
    {

    }
    else
    {
      objc_msgSend(v19, sel_frame);
      MaxX = CGRectGetMaxX(v29);
      v30.origin.x = v12;
      v30.origin.y = v11;
      v30.size.width = v10;
      v30.size.height = v9;
      if (MaxX <= CGRectGetMinX(v30))
      {
        v26 = v7 + 1;
        v21.n128_f64[0] = v12;
        v22.n128_f64[0] = v11;
        v23.n128_f64[0] = v10;
        v24.n128_f64[0] = v9;
        v25 = a2;
      }
      else
      {
        v25 = v7 - 1;
        v21.n128_f64[0] = v12;
        v22.n128_f64[0] = v11;
        v23.n128_f64[0] = v10;
        v24.n128_f64[0] = v9;
        v26 = a1;
      }
      v7 = sub_18AD46B94(v26, v25, v21, v22, v23, v24);

    }
    return v7;
  }
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  if (v15 >= 0)
    v16 = a1 + a2;
  else
    v16 = v15 + 1;
  v7 = v16 >> 1;
  v17 = (uint64_t *)(v8 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes);
  result = swift_beginAccess();
  a3 = *v17;
  if ((*v17 & 0xC000000000000001) != 0)
    goto LABEL_19;
  if (v15 < -1)
  {
    __break(1u);
  }
  else if (v7 < *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v19 = *(id *)(a3 + 8 * v7 + 32);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id sub_18AD46D80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18AD46E3C()
{
  return type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
}

uint64_t type metadata accessor for CNAvatarPosterPairCollectionViewLayout()
{
  uint64_t result;

  result = qword_1EDF9A548;
  if (!qword_1EDF9A548)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18AD46E80()
{
  unint64_t v0;

  sub_18AD46F34();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_18AD46F34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDF9A558)
  {
    sub_18AF4E5B8();
    v0 = sub_18AF50118();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDF9A558);
  }
}

uint64_t sub_18AD46F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_18AD46FD0()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = &v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_scrollDirection] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cardSizeMultiplier] = 0x3FE6666666666666;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_maximumVerticalRevealFraction] = 0x3FD0000000000000;
  v3 = &v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v4 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedSupplementaryFooterAttributes] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgresses] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete] = v4;
  v5 = &v0[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_indexPathToMaintainForTransition];
  v6 = sub_18AF4E5B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);

  sub_18AF50310();
  __break(1u);
}

UIColor AvatarPosterConfiguration.backgroundColor.getter()
{
  uint64_t v0;

  sub_18ACB9378();
  v0 = sub_18AF4E9A8();
  return UIColor.init(avatarColorDescription:)((Swift::OpaquePointer)v0);
}

void sub_18AD47148(char a1)
{
  sub_18AF504B4();
  __asm { BR              X10 }
}

uint64_t sub_18AD47194()
{
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

uint64_t sub_18AD4721C()
{
  sub_18AF504B4();
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

void sub_18AD472A0(uint64_t a1, char a2)
{
  sub_18AF504B4();
  __asm { BR              X10 }
}

uint64_t sub_18AD472E8()
{
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

uint64_t sub_18AD47370()
{
  sub_18AF504B4();
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

unint64_t sub_18AD473F0(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95540);
  v2 = (_QWORD *)sub_18AF50364();
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
    sub_18AF4E9A8();
    result = sub_18AD48BE8(v5, v6);
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

unint64_t sub_18AD47500(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95550);
  v2 = sub_18AF50364();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18ACCDEA4(v6, (uint64_t)v15, &qword_1EDF9A5D8);
    result = sub_18AD48C4C((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_18ACD18D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_18AD47640(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95548);
  v2 = sub_18AF50364();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18ACCDEA4(v6, (uint64_t)&v13, &qword_1EDF954B0);
    v7 = v13;
    result = sub_18AD48C7C(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_18ACD18D4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_18AD4776C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A700);
  v2 = (_QWORD *)sub_18AF50364();
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
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    sub_18AF4E9A8();
    result = sub_18AD48D40((uint64_t)v6);
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

unint64_t sub_18AD47874(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF98AD0);
  v2 = (_QWORD *)sub_18AF50364();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_18AD48CFC((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

ContactsUI::AvatarPosterConfiguration::UserInfoKey_optional __swiftcall AvatarPosterConfiguration.UserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  ContactsUI::AvatarPosterConfiguration::UserInfoKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_18AF50388();
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

unint64_t AvatarPosterConfiguration.UserInfoKey.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0xD00000000000001ALL;
}

uint64_t sub_18AD47A1C(char *a1, char *a2)
{
  return sub_18ACC2960(*a1, *a2);
}

uint64_t sub_18AD47A28()
{
  return sub_18AD4721C();
}

uint64_t sub_18AD47A30()
{
  sub_18AF4FCA4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18AD47A90()
{
  return sub_18AD47370();
}

ContactsUI::AvatarPosterConfiguration::UserInfoKey_optional sub_18AD47A98(Swift::String *a1)
{
  return AvatarPosterConfiguration.UserInfoKey.init(rawValue:)(*a1);
}

void sub_18AD47AA4(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000012;
  else
    v2 = 0xD00000000000001ALL;
  v3 = 0x800000018AF8BBA0;
  if (*v1)
    v3 = 0x800000018AF8BBC0;
  *a1 = v2;
  a1[1] = v3;
}

ContactsUI::AvatarPosterConfiguration::ColorDescriptionKey_optional __swiftcall AvatarPosterConfiguration.ColorDescriptionKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ContactsUI::AvatarPosterConfiguration::ColorDescriptionKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_18AF50388();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AvatarPosterConfiguration.ColorDescriptionKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_18AD47B68 + 4 * byte_18AF89E9C[*v0]))(6579570, 0xE300000000000000);
}

uint64_t sub_18AD47B68()
{
  return 0x6E65657267;
}

uint64_t sub_18AD47B7C()
{
  return 1702194274;
}

uint64_t sub_18AD47B8C()
{
  return 0x6168706C61;
}

void sub_18AD47BA0(char *a1)
{
  sub_18ACC2834(*a1);
}

void sub_18AD47BAC()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_18AF504B4();
  __asm { BR              X9 }
}

uint64_t sub_18AD47BF0()
{
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

void sub_18AD47C50()
{
  __asm { BR              X10 }
}

uint64_t sub_18AD47C84()
{
  sub_18AF4FCA4();
  return swift_bridgeObjectRelease();
}

void sub_18AD47CD0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_18AF504B4();
  __asm { BR              X9 }
}

uint64_t sub_18AD47D10()
{
  sub_18AF4FCA4();
  swift_bridgeObjectRelease();
  return sub_18AF504E4();
}

ContactsUI::AvatarPosterConfiguration::ColorDescriptionKey_optional sub_18AD47D70(Swift::String *a1)
{
  return AvatarPosterConfiguration.ColorDescriptionKey.init(rawValue:)(*a1);
}

uint64_t sub_18AD47D7C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_18AD47DA4 + 4 * byte_18AF89EAC[*v0]))();
}

void sub_18AD47DA4(_QWORD *a1@<X8>)
{
  *a1 = 0x6E65657267;
  a1[1] = 0xE500000000000000;
}

void sub_18AD47DBC(_QWORD *a1@<X8>)
{
  *a1 = 1702194274;
  a1[1] = 0xE400000000000000;
}

void sub_18AD47DD0(_QWORD *a1@<X8>)
{
  *a1 = 0x6168706C61;
  a1[1] = 0xE500000000000000;
}

ContactsUI::AvatarPosterConfiguration::BoundingShape_optional __swiftcall AvatarPosterConfiguration.BoundingShape.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)(rawValue + 1) < 4)
    v2 = rawValue + 1;
  *v1 = v2;
  return (ContactsUI::AvatarPosterConfiguration::BoundingShape_optional)rawValue;
}

uint64_t AvatarPosterConfiguration.BoundingShape.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 - 1;
}

uint64_t sub_18AD47E0C()
{
  sub_18AF504B4();
  sub_18AF504C0();
  return sub_18AF504E4();
}

uint64_t sub_18AD47E50()
{
  return sub_18AF504C0();
}

uint64_t sub_18AD47E7C()
{
  sub_18AF504B4();
  sub_18AF504C0();
  return sub_18AF504E4();
}

ContactsUI::AvatarPosterConfiguration::BoundingShape_optional sub_18AD47EBC(Swift::Int *a1)
{
  return AvatarPosterConfiguration.BoundingShape.init(rawValue:)(*a1);
}

void sub_18AD47EC4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 - 1;
}

uint64_t AvatarPosterConfiguration.backgroundColorDescription.getter()
{
  return sub_18AF4E9A8();
}

uint64_t AvatarPosterConfiguration.backgroundColorDescription.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*AvatarPosterConfiguration.backgroundColorDescription.modify())()
{
  return CGSizeMake;
}

uint64_t AvatarPosterConfiguration.avatarRecordData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_18ACD15B4(v1, *(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t AvatarPosterConfiguration.avatarRecordData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_18ACB9CC8(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*AvatarPosterConfiguration.avatarRecordData.modify())()
{
  return CGSizeMake;
}

uint64_t AvatarPosterConfiguration.avatarPoseData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_18ACD15B4(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t AvatarPosterConfiguration.avatarPoseData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_18ACB9CC8(*(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*AvatarPosterConfiguration.avatarPoseData.modify())()
{
  return CGSizeMake;
}

uint64_t AvatarPosterConfiguration.hasBody.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t AvatarPosterConfiguration.hasBody.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*AvatarPosterConfiguration.hasBody.modify())()
{
  return CGSizeMake;
}

uint64_t AvatarPosterConfiguration.avatarImageData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_18ACD15B4(v1, *(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t AvatarPosterConfiguration.avatarImageData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_18ACB9CC8(*(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AvatarPosterConfiguration.avatarImageData.modify())()
{
  return CGSizeMake;
}

UIColor __swiftcall UIColor.init(avatarColorDescription:)(Swift::OpaquePointer avatarColorDescription)
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

  if (!*((_QWORD *)avatarColorDescription._rawValue + 2))
  {
    v3 = 1.0;
    v4 = 1.0;
LABEL_14:
    v7 = 1.0;
LABEL_15:
    v10 = 1.0;
    goto LABEL_16;
  }
  v2 = sub_18AD48BE8(6579570, 0xE300000000000000);
  v3 = 1.0;
  v4 = 1.0;
  if ((v5 & 1) != 0)
    v4 = *(double *)(*((_QWORD *)avatarColorDescription._rawValue + 7) + 8 * v2);
  if (!*((_QWORD *)avatarColorDescription._rawValue + 2))
    goto LABEL_14;
  v6 = sub_18AD48BE8(0x6E65657267, 0xE500000000000000);
  v7 = 1.0;
  if ((v8 & 1) != 0)
    v7 = *(double *)(*((_QWORD *)avatarColorDescription._rawValue + 7) + 8 * v6);
  if (!*((_QWORD *)avatarColorDescription._rawValue + 2))
    goto LABEL_15;
  v9 = sub_18AD48BE8(1702194274, 0xE400000000000000);
  v10 = 1.0;
  if ((v11 & 1) != 0)
    v3 = *(double *)(*((_QWORD *)avatarColorDescription._rawValue + 7) + 8 * v9);
  if (*((_QWORD *)avatarColorDescription._rawValue + 2))
  {
    v12 = sub_18AD48BE8(0x6168706C61, 0xE500000000000000);
    if ((v13 & 1) != 0)
      v10 = *(double *)(*((_QWORD *)avatarColorDescription._rawValue + 7) + 8 * v12);
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return (UIColor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, v4, v7, v3, v10);
}

void AvatarPosterConfiguration.init(backgroundColor:avatarRecordData:avatarPoseData:hasBody:avatarImageData:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  unint64_t v18;

  v18 = UIColor.avatarColorDescription.getter();

  *(_QWORD *)a9 = v18;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
}

unint64_t UIColor.avatarColorDescription.getter()
{
  void *v0;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[18];

  v6[17] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  v3 = 0;
  v4 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v6, &v5, &v4, &v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95588);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18AF8A370;
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
  return sub_18AD473F0(inited);
}

BOOL static AvatarPosterConfiguration.RenderingMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AvatarPosterConfiguration.RenderingMode.hash(into:)()
{
  return sub_18AF504C0();
}

uint64_t AvatarPosterConfiguration.RenderingMode.hashValue.getter()
{
  sub_18AF504B4();
  sub_18AF504C0();
  return sub_18AF504E4();
}

void AvatarPosterConfiguration.renderingMode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + 16) >> 60 == 15)
    *a1 = 2 * (*(_QWORD *)(v1 + 56) >> 60 == 15);
  else
    *a1 = 1;
}

double static AvatarPosterConfiguration.stickerWaistLineHeightFraction(forBoundingShape:)(_BYTE *a1)
{
  double result;

  result = 0.45;
  if (*a1 == 3)
    return 0.6;
  return result;
}

uint64_t sub_18AD483F8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_18AD48438 + 4 * byte_18AF89EB0[a1]))(0xD00000000000001ALL, 0x800000018AF8BBA0);
}

unint64_t sub_18AD48438()
{
  return 0xD000000000000010;
}

uint64_t sub_18AD48454()
{
  return 0x6F50726174617661;
}

uint64_t sub_18AD48478()
{
  return 0x79646F42736168;
}

uint64_t sub_18AD48490()
{
  return 0x6D49726174617661;
}

uint64_t sub_18AD484B4()
{
  unsigned __int8 *v0;

  return sub_18AD483F8(*v0);
}

uint64_t sub_18AD484BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_18AD4A444(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_18AD484E0()
{
  return 0;
}

void sub_18AD484EC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_18AD484F8()
{
  sub_18AD49654();
  return sub_18AF50520();
}

uint64_t sub_18AD48520()
{
  sub_18AD49654();
  return sub_18AF5052C();
}

uint64_t AvatarPosterConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95558);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  v9 = v1[1];
  v20 = v1[2];
  v21 = v9;
  v11 = v1[3];
  v18 = v1[4];
  v19 = v11;
  v24 = *((unsigned __int8 *)v1 + 40);
  v12 = v1[7];
  v16 = v1[6];
  v17 = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_18AD49654();
  sub_18AF50508();
  v22 = v10;
  v25 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95358);
  sub_18AD49720(&qword_1EDF95360, (uint64_t (*)(void))sub_18AD49698, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
  sub_18AF503D0();
  if (!v2)
  {
    v13 = v18;
    v14 = v19;
    v22 = v21;
    v23 = v20;
    v25 = 1;
    sub_18AD496DC();
    sub_18AF503B8();
    v22 = v14;
    v23 = v13;
    v25 = 2;
    sub_18AF503B8();
    LOBYTE(v22) = 3;
    sub_18AF503C4();
    v22 = v16;
    v23 = v17;
    v25 = 4;
    sub_18AF503B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t AvatarPosterConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  char v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A588);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_18AD49654();
  sub_18AF504FC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    sub_18ACB9CC8(0, 0xF000000000000000);
    sub_18ACB9CC8(0, 0xF000000000000000);
    v21 = 0;
    v22 = 0xF000000000000000;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95358);
    v30 = 0;
    sub_18AD49720(&qword_1EDF9A590, (uint64_t (*)(void))sub_18AD49794, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    sub_18AF503AC();
    v11 = v27;
    v30 = 1;
    v12 = sub_18AD497D8();
    sub_18AF4E9A8();
    sub_18AF50394();
    v26 = v11;
    v13 = v28;
    v30 = 2;
    v25 = v27;
    sub_18ACD15B4(v27, v28);
    sub_18AF50394();
    v23 = a2;
    v24 = v12;
    v14 = v27;
    v15 = v28;
    LOBYTE(v27) = 3;
    sub_18ACD15B4(v14, v28);
    v29 = sub_18AF503A0();
    v30 = 4;
    sub_18AF50394();
    LODWORD(v24) = v29 & 1;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v16 = v27;
    v17 = v28;
    sub_18ACD15B4(v27, v28);
    sub_18ACB9CC8(0, 0xF000000000000000);
    v18 = v26;
    sub_18AF4E9A8();
    v19 = v25;
    sub_18ACD15B4(v25, v13);
    sub_18ACD15B4(v14, v15);
    sub_18ACD15B4(v16, v17);
    sub_18ACB9CC8(v16, v17);
    sub_18ACB9CC8(v14, v15);
    sub_18ACB9CC8(v19, v13);
    swift_bridgeObjectRelease();
    v20 = v23;
    *v23 = v18;
    v20[1] = v19;
    v20[2] = v13;
    v20[3] = v14;
    v20[4] = v15;
    *((_BYTE *)v20 + 40) = v24;
    v20[6] = v16;
    v20[7] = v17;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_18ACB9CC8(v19, v13);
    sub_18ACB9CC8(v14, v15);
    v21 = v16;
    v22 = v17;
  }
  return sub_18ACB9CC8(v21, v22);
}

uint64_t sub_18AD48BBC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AvatarPosterConfiguration.init(from:)(a1, a2);
}

uint64_t sub_18AD48BD0(_QWORD *a1)
{
  return AvatarPosterConfiguration.encode(to:)(a1);
}

unint64_t sub_18AD48BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_18AF504B4();
  sub_18AF4FCA4();
  v4 = sub_18AF504E4();
  return sub_18AD48E0C(a1, a2, v4);
}

unint64_t sub_18AD48C4C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18AF50190();
  return sub_18AD48EEC(a1, v2);
}

unint64_t sub_18AD48C7C(uint64_t a1)
{
  uint64_t v2;

  sub_18AF4FC5C();
  sub_18AF504B4();
  sub_18AF4FCA4();
  v2 = sub_18AF504E4();
  swift_bridgeObjectRelease();
  return sub_18AD48FB0(a1, v2);
}

unint64_t sub_18AD48CFC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18AF50010();
  return sub_18AD49124(a1, v2, (void (*)(_QWORD))type metadata accessor for CNAvatarPosterPair);
}

unint64_t sub_18AD48D40(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18AF50010();
  return sub_18AD49124(a1, v2, (void (*)(_QWORD))type metadata accessor for CNAvatarPosterPairFingerprint);
}

unint64_t sub_18AD48D84(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_18AF504A8();
  return sub_18AD4922C(a1, v2);
}

unint64_t sub_18AD48DB4(unsigned __int8 a1)
{
  uint64_t v2;

  sub_18AF504B4();
  sub_18AF504C0();
  v2 = sub_18AF504E4();
  return sub_18AD492C8(a1, v2);
}

unint64_t sub_18AD48E0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_18AF50418() & 1) == 0)
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
      while (!v14 && (sub_18AF50418() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_18AD48EEC(uint64_t a1, uint64_t a2)
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
      sub_18ACD1898(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x18D776318](v9, a1);
      sub_18AD4A6A0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_18AD48FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_18AF4FC5C();
    v8 = v7;
    if (v6 == sub_18AF4FC5C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_18AF50418();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_18AF4FC5C();
          v15 = v14;
          if (v13 == sub_18AF4FC5C() && v15 == v16)
            break;
          v18 = sub_18AF50418();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_18AD49124(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    a3(0);
    v7 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
    v8 = sub_18AF5001C();

    if ((v8 & 1) == 0)
    {
      v9 = ~v5;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
        v11 = sub_18AF5001C();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_18AD4922C(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_18AD492C8(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

BOOL _s10ContactsUI25AvatarPosterConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  _BOOL8 result;
  unint64_t v27;
  char v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)(a1 + 16);
  v36 = *(_QWORD *)(a1 + 24);
  v37 = *(_QWORD *)(a1 + 8);
  v35 = *(_QWORD *)(a1 + 32);
  v34 = *(unsigned __int8 *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(unsigned __int8 *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  if ((sub_18AD5AC90(*(_QWORD *)a1, *(_QWORD *)a2) & 1) == 0)
    return 0;
  v32 = v8;
  v33 = v11;
  v30 = v10;
  v31 = v3;
  v12 = v2;
  if (v2 >> 60 == 15)
  {
    v13 = v9;
    v14 = v37;
    if (v6 >> 60 == 15)
      goto LABEL_8;
LABEL_6:
    sub_18ACD15B4(v14, v2);
    sub_18ACD15B4(v5, v6);
    sub_18ACB9CC8(v14, v2);
    v15 = v5;
    v16 = v6;
LABEL_21:
    sub_18ACB9CC8(v15, v16);
    return 0;
  }
  v13 = v9;
  v14 = v37;
  if (v6 >> 60 == 15)
    goto LABEL_6;
  sub_18ACD15B4(v37, v2);
  sub_18ACD15B4(v5, v6);
  sub_18AD33240(v37, v2);
  v18 = v17;
  sub_18ACB9CC8(v5, v6);
  sub_18ACB9CC8(v37, v12);
  if ((v18 & 1) == 0)
    return 0;
LABEL_8:
  if (v35 >> 60 == 15)
  {
    v19 = v32;
    v20 = v33;
    v21 = v36;
    v22 = v7;
    if (v32 >> 60 == 15)
    {
      v23 = v4;
      if (v34 != v13)
        return 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  v19 = v32;
  v20 = v33;
  v21 = v36;
  v22 = v7;
  if (v32 >> 60 == 15)
  {
LABEL_13:
    sub_18ACD15B4(v21, v35);
    sub_18ACD15B4(v22, v19);
    sub_18ACB9CC8(v21, v35);
    v15 = v22;
    v16 = v19;
    goto LABEL_21;
  }
  sub_18ACD15B4(v36, v35);
  sub_18ACD15B4(v7, v32);
  sub_18AD33240(v36, v35);
  v25 = v24;
  sub_18ACB9CC8(v7, v32);
  sub_18ACB9CC8(v36, v35);
  result = 0;
  if ((v25 & 1) != 0)
  {
    v23 = v4;
    if (((v34 ^ v13) & 1) == 0)
    {
LABEL_16:
      if (v31 >> 60 == 15)
      {
        v27 = v30;
        if (v30 >> 60 == 15)
          return 1;
        goto LABEL_20;
      }
      v27 = v30;
      if (v30 >> 60 == 15)
      {
LABEL_20:
        sub_18ACD15B4(v23, v31);
        sub_18ACD15B4(v20, v27);
        sub_18ACB9CC8(v23, v31);
        v15 = v20;
        v16 = v27;
        goto LABEL_21;
      }
      sub_18ACD15B4(v23, v31);
      sub_18ACD15B4(v20, v30);
      sub_18AD33240(v23, v31);
      v29 = v28;
      sub_18ACB9CC8(v20, v30);
      sub_18ACB9CC8(v23, v31);
      return (v29 & 1) != 0;
    }
  }
  return result;
}

unint64_t sub_18AD49654()
{
  unint64_t result;

  result = qword_1EDF948C0;
  if (!qword_1EDF948C0)
  {
    result = MEMORY[0x18D777800](&unk_18AF8A314, &type metadata for AvatarPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDF948C0);
  }
  return result;
}

unint64_t sub_18AD49698()
{
  unint64_t result;

  result = qword_1EDF94C10;
  if (!qword_1EDF94C10)
  {
    result = MEMORY[0x18D777800](MEMORY[0x1E0DEF050], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1EDF94C10);
  }
  return result;
}

unint64_t sub_18AD496DC()
{
  unint64_t result;

  result = qword_1EDF94C00;
  if (!qword_1EDF94C00)
  {
    result = MEMORY[0x18D777800](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EDF94C00);
  }
  return result;
}

uint64_t sub_18AD49720(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF95358);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x18D777800](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18AD49794()
{
  unint64_t result;

  result = qword_1EDF9A598;
  if (!qword_1EDF9A598)
  {
    result = MEMORY[0x18D777800](MEMORY[0x1E0DEF078], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1EDF9A598);
  }
  return result;
}

unint64_t sub_18AD497D8()
{
  unint64_t result;

  result = qword_1EDF9A5A0;
  if (!qword_1EDF9A5A0)
  {
    result = MEMORY[0x18D777800](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5A0);
  }
  return result;
}

unint64_t sub_18AD49820()
{
  unint64_t result;

  result = qword_1EDF9A5A8;
  if (!qword_1EDF9A5A8)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for AvatarPosterConfiguration.UserInfoKey, &type metadata for AvatarPosterConfiguration.UserInfoKey);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5A8);
  }
  return result;
}

unint64_t sub_18AD49868()
{
  unint64_t result;

  result = qword_1EDF9A5B0;
  if (!qword_1EDF9A5B0)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for AvatarPosterConfiguration.ColorDescriptionKey, &type metadata for AvatarPosterConfiguration.ColorDescriptionKey);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5B0);
  }
  return result;
}

unint64_t sub_18AD498B0()
{
  unint64_t result;

  result = qword_1EDF9A5B8;
  if (!qword_1EDF9A5B8)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for AvatarPosterConfiguration.BoundingShape, &type metadata for AvatarPosterConfiguration.BoundingShape);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5B8);
  }
  return result;
}

unint64_t sub_18AD498F8()
{
  unint64_t result;

  result = qword_1EDF9A5C0;
  if (!qword_1EDF9A5C0)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for AvatarPosterConfiguration.RenderingMode, &type metadata for AvatarPosterConfiguration.RenderingMode);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5C0);
  }
  return result;
}

uint64_t destroy for AvatarPosterConfiguration(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  result = swift_bridgeObjectRelease();
  v3 = a1[2];
  if (v3 >> 60 != 15)
    result = sub_18ACB9CDC(a1[1], v3);
  v4 = a1[4];
  if (v4 >> 60 != 15)
    result = sub_18ACB9CDC(a1[3], v4);
  v5 = a1[7];
  if (v5 >> 60 != 15)
    return sub_18ACB9CDC(a1[6], v5);
  return result;
}

uint64_t initializeWithCopy for AvatarPosterConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = (uint64_t *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_18AF4E9A8();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v4;
  }
  else
  {
    v6 = *v4;
    sub_18ACC022C(*v4, v5);
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v5;
  }
  v7 = (uint64_t *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  if (v8 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v7;
  }
  else
  {
    v9 = *v7;
    sub_18ACC022C(*v7, *(_QWORD *)(a2 + 32));
    *(_QWORD *)(a1 + 24) = v9;
    *(_QWORD *)(a1 + 32) = v8;
  }
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v10 = (uint64_t *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v10;
  }
  else
  {
    v12 = *v10;
    sub_18ACC022C(*v10, v11);
    *(_QWORD *)(a1 + 48) = v12;
    *(_QWORD *)(a1 + 56) = v11;
  }
  return a1;
}

uint64_t assignWithCopy for AvatarPosterConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      v6 = *v4;
      sub_18ACC022C(*v4, *(_QWORD *)(a2 + 16));
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    sub_18AD31AB8(a1 + 8);
LABEL_6:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v7 = *v4;
  sub_18ACC022C(*v4, *(_QWORD *)(a2 + 16));
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v5;
  sub_18ACB9CDC(v8, v9);
LABEL_8:
  v10 = (uint64_t *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32) >> 60 == 15)
  {
    if (v11 >> 60 != 15)
    {
      v12 = *v10;
      sub_18ACC022C(*v10, *(_QWORD *)(a2 + 32));
      *(_QWORD *)(a1 + 24) = v12;
      *(_QWORD *)(a1 + 32) = v11;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v11 >> 60 == 15)
  {
    sub_18AD31AB8(a1 + 24);
LABEL_13:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v10;
    goto LABEL_15;
  }
  v13 = *v10;
  sub_18ACC022C(*v10, *(_QWORD *)(a2 + 32));
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = v11;
  sub_18ACB9CDC(v14, v15);
LABEL_15:
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v16 = (uint64_t *)(a2 + 48);
  v17 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56) >> 60 != 15)
  {
    if (v17 >> 60 != 15)
    {
      v19 = *v16;
      sub_18ACC022C(*v16, v17);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 48) = v19;
      *(_QWORD *)(a1 + 56) = v17;
      sub_18ACB9CDC(v20, v21);
      return a1;
    }
    sub_18AD31AB8(a1 + 48);
    goto LABEL_20;
  }
  if (v17 >> 60 == 15)
  {
LABEL_20:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v16;
    return a1;
  }
  v18 = *v16;
  sub_18ACC022C(*v16, v17);
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v17;
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AvatarPosterConfiguration(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = (_OWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 >> 60 == 15)
    goto LABEL_4;
  v6 = *(_QWORD *)(a2 + 16);
  if (v6 >> 60 == 15)
  {
    sub_18AD31AB8(a1 + 8);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v4;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)v4;
  *(_QWORD *)(a1 + 16) = v6;
  sub_18ACB9CDC(v7, v5);
LABEL_6:
  v8 = (_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 24) = *v8;
    goto LABEL_11;
  }
  v10 = *(_QWORD *)(a2 + 32);
  if (v10 >> 60 == 15)
  {
    sub_18AD31AB8(a1 + 24);
    goto LABEL_9;
  }
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)v8;
  *(_QWORD *)(a1 + 32) = v10;
  sub_18ACB9CDC(v11, v9);
LABEL_11:
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v12 = (_QWORD *)(a2 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (v13 >> 60 != 15)
  {
    v14 = *(_QWORD *)(a2 + 56);
    if (v14 >> 60 != 15)
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(a1 + 48) = *v12;
      *(_QWORD *)(a1 + 56) = v14;
      sub_18ACB9CDC(v15, v13);
      return a1;
    }
    sub_18AD31AB8(a1 + 48);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)v12;
  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarPosterConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarPosterConfiguration(uint64_t result, int a2, int a3)
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
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration()
{
  return &type metadata for AvatarPosterConfiguration;
}

uint64_t storeEnumTagSinglePayload for AvatarPosterConfiguration.UserInfoKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18AD49E98 + 4 * byte_18AF89EBA[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18AD49ECC + 4 * byte_18AF89EB5[v4]))();
}

uint64_t sub_18AD49ECC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD49ED4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18AD49EDCLL);
  return result;
}

uint64_t sub_18AD49EE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18AD49EF0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18AD49EF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD49EFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration.UserInfoKey()
{
  return &type metadata for AvatarPosterConfiguration.UserInfoKey;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration.ColorDescriptionKey()
{
  return &type metadata for AvatarPosterConfiguration.ColorDescriptionKey;
}

uint64_t _s10ContactsUI25AvatarPosterConfigurationV19ColorDescriptionKeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18AD49F7C + 4 * byte_18AF89EC4[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_18AD49FB0 + 4 * byte_18AF89EBF[v4]))();
}

uint64_t sub_18AD49FB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD49FB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18AD49FC0);
  return result;
}

uint64_t sub_18AD49FCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18AD49FD4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_18AD49FD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD49FE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration.BoundingShape()
{
  return &type metadata for AvatarPosterConfiguration.BoundingShape;
}

uint64_t storeEnumTagSinglePayload for AvatarPosterConfiguration.RenderingMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18AD4A048 + 4 * byte_18AF89ECE[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18AD4A07C + 4 * byte_18AF89EC9[v4]))();
}

uint64_t sub_18AD4A07C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD4A084(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18AD4A08CLL);
  return result;
}

uint64_t sub_18AD4A098(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18AD4A0A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_18AD4A0A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD4A0AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration.RenderingMode()
{
  return &type metadata for AvatarPosterConfiguration.RenderingMode;
}

uint64_t storeEnumTagSinglePayload for AvatarPosterConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18AD4A114 + 4 * byte_18AF89ED8[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_18AD4A148 + 4 * byte_18AF89ED3[v4]))();
}

uint64_t sub_18AD4A148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD4A150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18AD4A158);
  return result;
}

uint64_t sub_18AD4A164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18AD4A16CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_18AD4A170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD4A178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvatarPosterConfiguration.CodingKeys()
{
  return &type metadata for AvatarPosterConfiguration.CodingKeys;
}

unint64_t sub_18AD4A198()
{
  unint64_t result;

  result = qword_1EDF9A5C8;
  if (!qword_1EDF9A5C8)
  {
    result = MEMORY[0x18D777800](&unk_18AF8A2EC, &type metadata for AvatarPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDF9A5C8);
  }
  return result;
}

unint64_t sub_18AD4A1E0()
{
  unint64_t result;

  result = qword_1EDF948D0;
  if (!qword_1EDF948D0)
  {
    result = MEMORY[0x18D777800](&unk_18AF8A25C, &type metadata for AvatarPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDF948D0);
  }
  return result;
}

unint64_t sub_18AD4A228()
{
  unint64_t result;

  result = qword_1EDF948C8;
  if (!qword_1EDF948C8)
  {
    result = MEMORY[0x18D777800](&unk_18AF8A284, &type metadata for AvatarPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDF948C8);
  }
  return result;
}

unint64_t sub_18AD4A26C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A5D0);
    v3 = (_QWORD *)sub_18AF50364();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_18AD48D84(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

unint64_t sub_18AD4A344(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98050);
  v3 = (_QWORD *)sub_18AF50364();
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  result = sub_18AD48DB4(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    sub_18AF4E9A8();
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
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
    v4 = *((_BYTE *)v8 - 8);
    v13 = *v8;
    sub_18AF4E9A8();
    result = sub_18AD48DB4(v4);
    v8 = v12;
    v5 = v13;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_18AD4A444(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001ALL && a2 == 0x800000018AF8BBA0 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000018AF8C7D0 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F50726174617661 && a2 == 0xEE00617461446573 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x79646F42736168 && a2 == 0xE700000000000000 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D49726174617661 && a2 == 0xEF61746144656761)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_18AF50418();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_18AD4A6A0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

id sub_18AD4A71C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  return *v1;
}

void sub_18AD4A7BC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_18AD4A80C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_18AD4A86C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CNAvatarPosterPairCollectionViewControllerWrapper.__allocating_init(with:contact:contactForSharedProfile:mode:delegate:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;
  void *v17;

  v5 = v4;
  v17 = &unk_1EE04E8D0;
  v10 = (char *)objc_allocWithZone(v5);
  swift_unknownObjectRetain();
  if (!swift_dynamicCastObjCProtocolConditional())
    swift_unknownObjectRelease();
  objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewController());
  v11 = a3;
  v12 = a2;
  v13 = a1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController] = sub_18AD4ACC8(v13, v12, v11, a4);

  v16.receiver = v10;
  v16.super_class = v5;
  v14 = objc_msgSendSuper2(&v16, sel_init);

  swift_unknownObjectRelease();
  return v14;
}

id CNAvatarPosterPairCollectionViewControllerWrapper.init(with:contact:contactForSharedProfile:mode:delegate:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  void *v4;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;
  void *v17;

  v17 = &unk_1EE04E8D0;
  v9 = v4;
  swift_unknownObjectRetain();
  if (!swift_dynamicCastObjCProtocolConditional())
    swift_unknownObjectRelease();
  v10 = objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewController());
  v11 = a3;
  v12 = a2;
  v13 = a1;
  *(_QWORD *)&v9[OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController] = sub_18AD4ACC8(v13, v12, v11, a4);

  v16.receiver = v9;
  v16.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewControllerWrapper();
  v14 = objc_msgSendSuper2(&v16, sel_init);

  swift_unknownObjectRelease();
  return v14;
}

uint64_t type metadata accessor for CNAvatarPosterPairCollectionViewController()
{
  return objc_opt_self();
}

id CNAvatarPosterPairCollectionViewControllerWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CNAvatarPosterPairCollectionViewControllerWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNAvatarPosterPairCollectionViewControllerWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewControllerWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_18AD4ACC8(void *a1, void *a2, void *a3, uint64_t a4)
{
  _BYTE *v4;
  _QWORD *v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  objc_super v27;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration] = 0;
  v9 = &v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_activePosterSnapshotKeepActiveAssertionReason];
  *v9 = 0;
  v9[1] = 0;
  v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_needsReload] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControlPreferredNumberOfVisibleIndicators] = 5;
  v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_configuration] = a1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact] = a2;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contactForSharedProfile] = a3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_mode] = a4;
  swift_unknownObjectWeakAssign();
  v10 = (void *)MEMORY[0x1E0DC3708];
  v11 = v4;
  v12 = a1;
  v13 = a2;
  v14 = a3;
  objc_msgSend(v10, "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v17 = objc_msgSend((id)objc_opt_self(), sel_mainThreadScheduler);
  objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewModel());
  v18 = v13;
  v19 = v14;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel] = sub_18AD2D2B0(v18, v19, (v16 & 0xFFFFFFFFFFFFFFFBLL) != 1, 1, (uint64_t)v17);
  v20 = objc_allocWithZone((Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout());
  v21 = sub_18AD42EE4(a4);
  v22 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout] = v21;

  v23 = *(void **)&v11[v22];
  v27.receiver = v11;
  v27.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  v24 = v23;
  v25 = objc_msgSendSuper2(&v27, sel_initWithCollectionViewLayout_, v24);

  swift_unknownObjectRelease();
  return v25;
}

uint64_t type metadata accessor for CNAvatarPosterPairCollectionViewControllerWrapper()
{
  return objc_opt_self();
}

id sub_18AD4AF38@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper_viewController);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for CNAvatarPosterPairCollectionViewControllerWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNAvatarPosterPairCollectionViewControllerWrapper.viewController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CNAvatarPosterPairCollectionViewControllerWrapper.viewController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNAvatarPosterPairCollectionViewControllerWrapper.viewController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CNAvatarPosterPairCollectionViewControllerWrapper.__allocating_init(with:contact:contactForSharedProfile:mode:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

id sub_18AD4B090()
{
  char *v0;
  objc_super v2;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber])
  {
    swift_retain();
    sub_18AF4EB40();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_18AD4B248()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t (**v3)();
  uint64_t v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  objc_msgSendSuper2(&v5, sel_viewDidLoad);
  sub_18AD4DBA8();
  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout];
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = (unint64_t (**)())(v1
                               + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider);
  *v3 = sub_18AD55054;
  v3[1] = (unint64_t (*)())v2;
  sub_18ACCDD44(v4);
  sub_18AD4DDE4();
}

char *sub_18AD4B318(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *result;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98DD8);
  v46 = *(unsigned __int8 **)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v4);
  v44 = (uint64_t)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v5;
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v6, v7).n128_u64[0];
  v43 = (uint64_t)&v41 - v9;
  result = (char *)objc_msgSend(a2, sel_collectionView, v8);
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(result, sel_visibleCells);

    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF9A6F0);
    v13 = sub_18AF4FD34();

    if (v13 >> 62)
    {
LABEL_18:
      sub_18AF4E9A8();
      v14 = sub_18AF50328();
      if (v14)
        goto LABEL_4;
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_18AF4E9A8();
      if (v14)
      {
LABEL_4:
        v15 = v13 & 0xC000000000000001;
        v16 = 4;
        v41 = v13 & 0xC000000000000001;
        v42 = v14;
        do
        {
          if (v15)
            v17 = (id)MEMORY[0x18D776384](v16 - 4, v13);
          else
            v17 = *(id *)(v13 + 8 * v16);
          v18 = v17;
          v19 = v16 - 3;
          if (__OFADD__(v16 - 4, 1))
          {
            __break(1u);
            goto LABEL_18;
          }
          type metadata accessor for CNAvatarPosterPairCollectionViewCell();
          result = (char *)swift_dynamicCastClass();
          if (!result)
            goto LABEL_5;
          v20 = *(char **)&result[OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollableContentView];
          if (!v20)
          {
            __break(1u);
            goto LABEL_21;
          }
          v21 = *(void **)(*(_QWORD *)&v20[OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_viewModel]
                         + OBJC_IVAR____TtC10ContactsUI27CNAvatarPosterPairViewModel_avatarPosterPair);
          if (v21)
          {
            v22 = v20;
            v47 = v21;
            v23 = objc_msgSend(v22, sel_traitCollection);
            v24 = objc_msgSend(v23, sel_userInterfaceIdiom);

            if (v24)
            {

            }
            else
            {
              v25 = (uint64_t)&v22[OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_displaySessionUUID];
              swift_beginAccess();
              v26 = v43;
              sub_18ACCDEA4(v25, v43, &qword_1EDF98DD8);
              v27 = swift_allocObject();
              swift_unknownObjectWeakInit();
              v28 = v44;
              sub_18ACCDEA4(v26, v44, &qword_1EDF98DD8);
              v29 = v13;
              v30 = (v46[80] + 24) & ~(unint64_t)v46[80];
              v31 = swift_allocObject();
              *(_QWORD *)(v31 + 16) = v27;
              v32 = v31 + v30;
              v13 = v29;
              v33 = v28;
              v15 = v41;
              sub_18ACD5C10(v33, v32, &qword_1EDF98DD8);
              swift_retain();
              v34 = v47;
              sub_18ACD96C0((uint64_t)v47, (void (*)(void))sub_18ACDA95C, v31, v35, v36, v37, v38, v39, v41, v42, v43, v44, v45, v46, (uint64_t)v47, v48, v49, v50, v51,
                v52,
                v53);
              swift_release();
              v40 = v26;
              v14 = v42;
              sub_18ACCDE68(v40, &qword_1EDF98DD8);

              swift_release();
            }
          }
          else
          {
LABEL_5:

          }
          ++v16;
        }
        while (v19 != v14);
      }
    }
    return (char *)swift_bridgeObjectRelease_n();
  }
  else
  {
LABEL_21:
    __break(1u);
  }
  return result;
}

uint64_t sub_18AD4B688(uint64_t a1)
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

void sub_18AD4B838(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
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
  char *v20;
  objc_class *v21;
  unint64_t v22;
  char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  objc_super v41;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF987B8);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF987C0);
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF987C8);
  v35 = *(_QWORD *)(v12 - 8);
  v36 = v12;
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_18AF4E504();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16, v18);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (objc_class *)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  v41.receiver = v2;
  v41.super_class = v21;
  objc_msgSendSuper2(&v41, sel_viewIsAppearing_, a1 & 1);
  sub_18AF4E4F8();
  sub_18AF4E4C8();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  v39 = (id)0xD00000000000002BLL;
  v40 = 0x800000018AF904C0;
  sub_18AF4FCD4();
  swift_bridgeObjectRelease();
  v22 = v40;
  v23 = &v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_activePosterSnapshotKeepActiveAssertionReason];
  *(_QWORD *)v23 = v39;
  *((_QWORD *)v23 + 1) = v22;
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(objc_allocWithZone((Class)CNPRUISPosterSnapshotController), sel_init);
  v25 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_acquireKeepActiveAssertionForReason_, v25);

  v26 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber;
  if (!*(_QWORD *)&v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber])
  {
    v27 = *(void **)&v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel];
    swift_beginAccess();
    v28 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF987E0);
    sub_18AF4EB88();
    swift_endAccess();

    v39 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
    v29 = sub_18AF5010C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 1, 1, v29);
    sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF987E8);
    sub_18ACBC6F4(&qword_1EDF987F0, &qword_1EDF987C8, MEMORY[0x1E0C96190]);
    sub_18AD54F64((unint64_t *)&qword_1EDF987F8, (unint64_t *)&qword_1EDF987E8, 0x1E0C99E58, MEMORY[0x1E0CB2358]);
    v30 = v36;
    sub_18AF4EBD0();
    sub_18ACCDE68((uint64_t)v7, &qword_1EDF987B8);

    sub_18ACBC6F4(&qword_1EDF98800, &qword_1EDF987C0, MEMORY[0x1E0C95CB8]);
    v31 = v38;
    v32 = (void *)sub_18AF4EBB8();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v31);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v30);
    v39 = v32;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98808);
    sub_18ACBC6F4(&qword_1EDF98810, &qword_1EDF98808, MEMORY[0x1E0C95D90]);
    v33 = sub_18AF4EBE8();
    swift_release();
    swift_release();
    *(_QWORD *)&v2[v26] = v33;
    swift_release();
  }
  if (v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_needsReload] == 1)
  {
    v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_needsReload] = 0;
    sub_18AD51514();
  }
}

void sub_18AD4BCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *i;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  unint64_t v29;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (!v3)
    return;
  v4 = (char *)v3;
  v5 = *(void **)(v3 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  sub_18AF4EB94();
  swift_release();
  swift_release();
  if (v29 >> 62)
    goto LABEL_48;
  v7 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_18AF4E9A8();
  for (; v7; v7 = sub_18AF50328())
  {
    v8 = 4;
    while (1)
    {
      v9 = (v29 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x18D776384](v8 - 4)
         : (char *)*(id *)(v29 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      if (v9[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_isRecentUsedAsContactPair] == 1)
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_32;
      }

      ++v8;
      if (v11 == v7)
        goto LABEL_11;
    }
    __break(1u);
LABEL_48:
    sub_18AF4E9A8();
  }
LABEL_11:
  swift_bridgeObjectRelease_n();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();
  swift_release();
  swift_release();
  if (v29 >> 62)
  {
    sub_18AF4E9A8();
    v12 = sub_18AF50328();
    if (v12)
      goto LABEL_13;
  }
  else
  {
    v12 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_18AF4E9A8();
    if (v12)
    {
LABEL_13:
      v13 = v29 & 0xC000000000000001;
      if ((v29 & 0xC000000000000001) != 0)
        goto LABEL_53;
      for (i = (char *)*(id *)(v29 + 32); ; i = (char *)MEMORY[0x18D776384](0))
      {
        v10 = i;
        if (!i[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type])
          break;

        if (v12 == 1)
          goto LABEL_30;
        v15 = v13 ? (char *)MEMORY[0x18D776384](1) : (char *)*(id *)(v29 + 40);
        v10 = v15;
        if (!v15[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type])
          break;

        if (v12 == 2)
          goto LABEL_30;
        v16 = 6;
        while (1)
        {
          v17 = v13 ? (char *)MEMORY[0x18D776384](v16 - 4) : (char *)*(id *)(v29 + 8 * v16);
          v10 = v17;
          v18 = v16 - 3;
          if (__OFADD__(v16 - 4, 1))
            break;
          if (!v17[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type])
            goto LABEL_31;

          ++v16;
          if (v18 == v12)
            goto LABEL_30;
        }
        __break(1u);
LABEL_53:
        ;
      }
LABEL_31:
      swift_bridgeObjectRelease_n();

LABEL_32:
      v19 = MEMORY[0x18D7779A4](&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
      if (v19)
      {
        v20 = (void *)v19;
        v21 = *(void **)&v10[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar];
        if (v21 == (void *)1)
          v6 = 0;
        else
          v6 = v21;
        v22 = *(void **)&v10[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster];
        if (v22 == (void *)1)
          v23 = 0;
        else
          v23 = *(_QWORD *)&v10[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster];
        v24 = v10[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_isRecentUsedAsContactPair];
        sub_18ACBC764(*(id *)&v10[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster]);
        objc_msgSend(v20, sel_avatarPosterPairCollectionDidLoadCurrentPairWithAvatar_poster_backedByRecents_, v6, v23, v24);

        swift_unknownObjectRelease();
        sub_18ACBC774(v22);
      }
      else
      {
        v6 = v10;
      }
      goto LABEL_41;
    }
  }
LABEL_30:
  swift_bridgeObjectRelease_n();
LABEL_41:

  v25 = objc_msgSend(v4, sel_view);
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_window);

    v28 = objc_msgSend(v27, sel_windowScene);
    if (v28)
      sub_18AD51514();
    else
      v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_needsReload] = 1;

  }
  else
  {
    __break(1u);
  }
}

id sub_18AD4C128(char a1)
{
  char *v1;
  id result;
  char *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  result = objc_msgSendSuper2(&v8, sel_viewWillDisappear_, a1 & 1);
  v4 = &v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_activePosterSnapshotKeepActiveAssertionReason];
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_activePosterSnapshotKeepActiveAssertionReason
                    + 8])
  {
    v5 = objc_allocWithZone((Class)CNPRUISPosterSnapshotController);
    sub_18AF4E9A8();
    v6 = objc_msgSend(v5, sel_init);
    v7 = (void *)sub_18AF4FC38();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_releaseKeepActiveAssertionForReason_, v7);

    *(_QWORD *)v4 = 0;
    *((_QWORD *)v4 + 1) = 0;
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_18AD4C334(void *a1)
{
  char *v1;
  void *v2;
  id v4;
  unint64_t v5;
  uint64_t result;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  char isEscapingClosureAtFileLocation;
  _QWORD v21[6];

  v2 = v1;
  v4 = *(id *)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel];
  v5 = sub_18AF4E5A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();

  swift_release();
  result = swift_release();
  if ((v21[0] & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x18D776384](v5, v21[0]);
LABEL_5:
    v8 = v7;
    swift_bridgeObjectRelease();
    v9 = (void *)sub_18AF4FC38();
    v10 = (void *)sub_18AF4E558();
    v11 = objc_msgSend(a1, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v9, v10);

    type metadata accessor for CNAvatarPosterPairCollectionViewCell();
    v12 = swift_dynamicCastClass();
    if (v12)
    {
      v13 = (id)v12;
      *(_QWORD *)(v12 + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_delegate + 8) = &off_1E2042C90;
      swift_unknownObjectWeakAssign();
      v14 = (void *)objc_opt_self();
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = v13;
      v15[3] = v8;
      v15[4] = v2;
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = sub_18AD54F48;
      *(_QWORD *)(v16 + 24) = v15;
      v21[4] = sub_18ACDAB0C;
      v21[5] = v16;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 1107296256;
      v21[2] = sub_18AD4C6AC;
      v21[3] = &block_descriptor_67;
      v17 = _Block_copy(v21);
      v18 = v11;
      v8 = v8;
      v19 = v2;
      swift_retain();
      swift_release();
      objc_msgSend(v14, sel_performWithoutAnimation_, v17);

      _Block_release(v17);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0)
        return (uint64_t)v13;
      __break(1u);
    }

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35C0]), sel_init);
    return (uint64_t)v13;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(_QWORD *)((v21[0] & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v21[0] + 8 * v5 + 32);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_18AD4C608(char *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  sub_18ACEB580(a2, *(void **)(a3 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact));
  v4 = OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_maximumVerticalRevealFraction;
  v5 = *(double *)&a1[OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_maximumVerticalRevealFraction];
  *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_maximumVerticalRevealFraction] = 0x3FD0000000000000;
  if (v5 != 0.25)
  {
    objc_msgSend(a1, sel_bounds);
    v8 = *(void **)&a1[OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView];
    if (v8)
      objc_msgSend(v8, sel_setContentSize_, v6, v7 * (*(double *)&a1[v4] + 1.0));
    else
      __break(1u);
  }
}

uint64_t sub_18AD4C6AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_18AD4C784(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  id result;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;

  v3 = (void *)sub_18AF4FC38();
  v4 = (void *)sub_18AF4FC38();
  v5 = (void *)sub_18AF4E558();
  v6 = objc_msgSend(a1, sel_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_, v3, v4, v5);

  type metadata accessor for CNAvatarPosterPairRemovalView();
  v7 = swift_dynamicCastClass();
  if (!v7)
  {

    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35B0]), sel_init);
  }
  v8 = v7;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_delegate + 8) = &off_1E2042C80;
  swift_unknownObjectWeakAssign();
  v9 = sub_18AF4E5A0();
  v10 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel;
  v11 = *(void **)(v1 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  v12 = v11;
  sub_18AF4EB94();

  swift_release();
  swift_release();
  if (v23 >> 62)
  {
    sub_18AF4E9A8();
    v13 = sub_18AF50328();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v9 >= v13)
    return (id)v8;
  v14 = *(id *)(v1 + v10);
  v15 = sub_18AF4E5A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();

  swift_release();
  result = (id)swift_release();
  if ((v23 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x18D776384](v15);
    goto LABEL_9;
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v15 < *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(v23 + 8 * v15 + 32);
LABEL_9:
    v18 = v17;
    swift_bridgeObjectRelease();
    v19 = OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair;
    v20 = *(void **)(v8 + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair);
    *(_QWORD *)(v8 + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_avatarPosterPair) = v18;
    v21 = v18;

    v22 = *(_QWORD *)(v8 + v19);
    if (!v22)
    {
LABEL_12:

      return (id)v8;
    }
    result = *(id *)(v8 + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton);
    if (result)
    {
      objc_msgSend(result, sel_setHidden_, *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type) == 3);
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_18AD4CC04(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  char *v20;
  char *v21;
  char v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = (char *)&v24 - v10;
  result = (uint64_t)objc_msgSend(v2, sel_collectionView);
  if (!result)
    goto LABEL_23;
  v13 = (void *)result;
  v14 = objc_msgSend((id)result, sel_indexPathForCell_, a1);

  if (v14)
  {
    sub_18AF4E570();

    v15 = sub_18AF4E5B8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 0, 1, v15);
  }
  else
  {
    v15 = sub_18AF4E5B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  }
  sub_18ACD5C10((uint64_t)v8, (uint64_t)v11, (uint64_t *)&unk_1EDF99400);
  sub_18AF4E5B8();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15) != 1)
  {
    v17 = sub_18AF4E5A0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
    v18 = *(void **)&v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel];
    swift_getKeyPath();
    swift_getKeyPath();
    v19 = v18;
    sub_18AF4EB94();

    swift_release();
    result = swift_release();
    if ((v25 & 0xC000000000000001) != 0)
    {
      v20 = (char *)MEMORY[0x18D776384](v17, v25);
LABEL_11:
      v21 = v20;
      swift_bridgeObjectRelease();
      if (v21[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type] == 3)
      {

      }
      else
      {
        v22 = (*(_QWORD *)&v21[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar] == 1) | v21[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 8];
        if (*(_QWORD *)&v21[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster] == 1)
        {

          if ((v22 & 1) != 0)
            return 1;
        }
        else
        {
          v23 = *(_WORD *)&v21[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster + 8];

          if ((v22 & 1) != 0)
            return v23 & 1;
        }
      }
      return 0;
    }
    if ((v17 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v17 < *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v20 = (char *)*(id *)(v25 + 8 * v17 + 32);
      goto LABEL_11;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }
  sub_18ACCDE68((uint64_t)v11, (uint64_t *)&unk_1EDF99400);
  return 0;
}

void sub_18AD4CEC4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t aBlock;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  void *v36;
  uint64_t v37;

  v5 = sub_18AF4FC2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v2, sel_traitCollection);
  objc_msgSend(v10, sel_userInterfaceIdiom);

  v31 = a1;
  sub_18AF4FBE4();
  v11 = MEMORY[0x1E0DEE9D8];
  sub_18ACC13F4((uint64_t)v9, MEMORY[0x1E0DEE9D8]);
  v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v9, v5);
  v13 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v13, 0, 0);

  sub_18AF4FBE4();
  sub_18ACC13F4((uint64_t)v9, v11);
  v12(v9, v5);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = a2;
  swift_retain();
  v17 = a2;
  v18 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v36 = sub_18AD549C4;
  v37 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v33 = 1107296256;
  v34 = sub_18AD0597C;
  v35 = &block_descriptor_40;
  v19 = _Block_copy(&aBlock);
  swift_release();
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_actionWithTitle_style_handler_, v18, 2, v19);
  _Block_release(v19);
  swift_release();

  sub_18AF4FBE4();
  sub_18ACC13F4((uint64_t)v9, MEMORY[0x1E0DEE9D8]);
  v12(v9, v5);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v23 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v36 = sub_18AD549CC;
  v37 = v22;
  aBlock = MEMORY[0x1E0C809B0];
  v33 = 1107296256;
  v34 = sub_18AD0597C;
  v35 = &block_descriptor_44;
  v24 = _Block_copy(&aBlock);
  swift_release();
  v25 = objc_msgSend(v20, sel_actionWithTitle_style_handler_, v23, 1, v24);
  _Block_release(v24);
  swift_release();

  objc_msgSend(v14, sel_addAction_, v21);
  objc_msgSend(v14, sel_addAction_, v25);
  objc_msgSend(v14, sel_setPreferredAction_, v25);
  v26 = objc_msgSend(v2, sel_traitCollection);
  v27 = objc_msgSend(v26, sel_userInterfaceIdiom);

  if (v27 == (id)1)
  {
    v28 = objc_msgSend(v14, sel_popoverPresentationController);
    if (v28)
    {
      v29 = v28;
      objc_msgSend(v28, sel_setSourceView_, *(_QWORD *)(v31 + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairRemovalView_deleteButton));

    }
  }
  objc_msgSend(v2, sel_presentViewController_animated_completion_, v14, 1, 0);

}

void sub_18AD4D354(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x18D7779A4](v4);
  if (v5)
  {
    v6 = (char *)v5;
    v7 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel;
    v8 = *(id *)(v5 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
    sub_18AD2D4D8(a3);

    v9 = &v6[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate];
    v10 = (void *)MEMORY[0x18D7779A4](&v6[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
    if (v10)
    {
      objc_msgSend(v10, sel_avatarPosterPairCollectionDidDeletePosterPair);
      swift_unknownObjectRelease();
    }
    if (*(_BYTE *)(*(_QWORD *)&v6[v7]
                  + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_deletingContactPair) == 1
      && (v11 = (void *)MEMORY[0x18D7779A4](v9)) != 0)
    {
      objc_msgSend(v11, sel_avatarPosterPairCollectionDidDeleteCurrentPosterPair);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

char *sub_18AD4D448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *result;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  _QWORD aBlock[6];

  v2 = a2 + 16;
  swift_beginAccess();
  result = (char *)MEMORY[0x18D7779A4](v2);
  if (!result)
    return result;
  v4 = result;
  result = (char *)objc_msgSend(result, sel_collectionView);
  if (!result)
    goto LABEL_23;
  v5 = result;
  v6 = objc_msgSend(result, sel_visibleCells);

  sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF9A6F0);
  v7 = sub_18AF4FD34();

  v21 = v4;
  if (v7 >> 62)
  {
LABEL_19:
    sub_18AF4E9A8();
    v8 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if (v8)
      goto LABEL_5;
LABEL_20:

    return (char *)swift_bridgeObjectRelease();
  }
  v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v8)
    goto LABEL_20;
LABEL_5:
  v9 = 4;
  while (1)
  {
    if ((v7 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x18D776384](v9 - 4, v7);
    else
      v13 = *(id *)(v7 + 8 * v9);
    v14 = v13;
    v15 = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    type metadata accessor for CNAvatarPosterPairCollectionViewCell();
    result = (char *)swift_dynamicCastClass();
    if (result)
      break;
LABEL_8:

    ++v9;
    if (v15 == v8)
      goto LABEL_20;
  }
  v16 = result;
  v17 = *(void **)&result[OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView];
  if (v17)
  {
    v18 = v14;
    objc_msgSend(v17, sel_contentOffset);
    if (v20 != 0.0 || v19 != 0.0)
    {
      v22 = (id)objc_opt_self();
      v10 = swift_allocObject();
      *(_QWORD *)(v10 + 16) = v16;
      aBlock[4] = sub_18AD549D4;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_18ACC449C;
      aBlock[3] = &block_descriptor_50;
      v11 = _Block_copy(aBlock);
      v12 = v18;
      swift_release();
      objc_msgSend(v22, sel_animateWithDuration_animations_, v11, 0.3);
      _Block_release(v11);
    }

    goto LABEL_8;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

id sub_18AD4D6E4(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  void *v18;
  _QWORD v19[6];

  if (!a2)
    goto LABEL_5;
  v4 = v2;
  v6 = *(void **)(v2 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration);
  if (v6)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954C8);
    v7 = a2;
    v8 = v6;
    v9 = sub_18AF5001C();

    if ((v9 & 1) != 0)
    {

LABEL_5:
      sub_18AF4FED8();
      v10 = CNUILogPosters();
      sub_18AF4E8B8();

      return objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(char **)(v4 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  v14 = *(void **)&v13[OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_workQueue];
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v19[4] = sub_18AD54990;
  v19[5] = v15;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 1107296256;
  v19[2] = sub_18ACC449C;
  v19[3] = &block_descriptor_33_0;
  v16 = _Block_copy(v19);
  v17 = v13;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v14, sel_performBlock_, v16);
  _Block_release(v16);

  swift_unknownObjectRelease();
  v18 = (void *)MEMORY[0x18D7779A4](v4 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
  if (v18)
  {
    objc_msgSend(v18, sel_avatarPosterPairCollectionDidEditPoster_, a2);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  return objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id sub_18AD4D978()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator);
  }
  else
  {
    v4 = sub_18AD4D9D4();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_18AD4D9D4()
{
  id v0;
  id v1;
  uint64_t inited;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v14;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 1012);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18AF8A390;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v1;
  v14 = inited;
  sub_18AF4FD4C();
  if (v14 >> 62)
  {
    v6 = v0;
    v7 = v1;
    sub_18AF4E9A8();
    v8 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if (!v8)
      goto LABEL_5;
    goto LABEL_3;
  }
  v3 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  v4 = v0;
  v5 = v1;
  if (v3)
LABEL_3:
    sub_18AD54634(v14);
LABEL_5:
  swift_bridgeObjectRelease();
  v9 = (void *)objc_opt_self();
  sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF9A6D0);
  sub_18AD54F64(&qword_1EDF9A6D8, (unint64_t *)&qword_1EDF9A6D0, 0x1E0CB37E8, MEMORY[0x1E0DEFCF8]);
  v10 = (void *)sub_18AF4FE48();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_privateConfigurationForTypes_, v10);

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3A58]), sel_initWithConfiguration_, v11);
  return v12;
}

void sub_18AD4DBA8()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t ObjCClassFromMetadata;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v1 = objc_msgSend(v0, sel_collectionView);
  if (v1)
  {
    v2 = v1;
    type metadata accessor for CNAvatarPosterPairRemovalView();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v4 = (id)*MEMORY[0x1E0DC48A0];
    v5 = (void *)sub_18AF4FC38();
    objc_msgSend(v2, sel_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_, ObjCClassFromMetadata, v4, v5);

    type metadata accessor for CNAvatarPosterPairCollectionViewCell();
    v6 = swift_getObjCClassFromMetadata();
    v7 = (void *)sub_18AF4FC38();
    objc_msgSend(v2, sel_registerClass_forCellWithReuseIdentifier_, v6, v7);

    v8 = (void *)objc_opt_self();
    v10 = v2;
    v9 = objc_msgSend(v8, sel_systemBackgroundColor);
    objc_msgSend(v10, sel_setBackgroundColor_, v9);

    objc_msgSend(v10, sel_setDecelerationRate_, *MEMORY[0x1E0DC5360]);
    objc_msgSend(v10, sel_setContentInsetAdjustmentBehavior_, 2);
    objc_msgSend(v10, sel_setShowsHorizontalScrollIndicator_, 0);
    objc_msgSend(v10, sel_setAlwaysBounceHorizontal_, 1);

  }
}

unint64_t sub_18AD4DD78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x18D7779A4](v1);
  if (!v2)
    return sub_18AD4A26C(MEMORY[0x1E0DEE9D8]);
  v3 = (void *)v2;
  v4 = sub_18AD524A0();

  return v4;
}

void sub_18AD4DDE4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void (*v55)(id *, _QWORD);
  id v56;
  id v57;
  id v58;
  void (*v59)(_QWORD);
  char *v60;
  uint64_t KeyPath;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  char *v81;
  char *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  void (*v110)(char *, uint64_t);
  id v111;
  void (*v112)(uint64_t, uint64_t);
  unsigned int v113;
  void (*v114)(char *, uint64_t, uint64_t);
  char *v115;
  void (*v116)(_QWORD);
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  id v133[5];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A688);
  MEMORY[0x1E0C80A78](v2, v3);
  v118 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_18AF4FC2C();
  v119 = *(char **)(v132 - 8);
  MEMORY[0x1E0C80A78](v132, v5);
  v7 = (char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18AF4E30C();
  v125 = *(_QWORD *)(v8 - 8);
  v126 = v8;
  MEMORY[0x1E0C80A78](v8, v9);
  v117 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v12);
  v124 = (char *)&v112 - v13;
  v130 = sub_18AF500B8();
  v116 = *(void (**)(_QWORD))(v130 - 8);
  MEMORY[0x1E0C80A78](v130, v14);
  v129 = (char *)&v112 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = sub_18AF50070();
  v16 = *(_QWORD *)(v128 - 8);
  MEMORY[0x1E0C80A78](v128, v17);
  v127 = (char *)&v112 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_18AF500DC();
  v123 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = (char *)&v112 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v23, v24);
  v131 = (char *)&v112 - v25;
  MEMORY[0x1E0C80A78](v26, v27);
  v29 = (char *)&v112 - v28;
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3A88]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v31 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl;
  v32 = *(void **)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl] = v30;

  v33 = *(void **)&v0[v31];
  if (!v33)
  {
    __break(1u);
    goto LABEL_39;
  }
  v34 = (void *)objc_opt_self();
  v35 = v33;
  v36 = objc_msgSend(v34, sel_tertiaryLabelColor);
  objc_msgSend(v35, sel_setPageIndicatorTintColor_, v36);

  v37 = *(void **)&v1[v31];
  if (!v37)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v38 = v37;
  v122 = v34;
  v39 = objc_msgSend(v34, sel_labelColor);
  objc_msgSend(v38, sel_setCurrentPageIndicatorTintColor_, v39);

  v40 = *(void **)&v1[v31];
  if (!v40)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  objc_msgSend(v40, sel_setHidesForSinglePage_, 1);
  v41 = *(void **)&v1[v31];
  if (!v41)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  objc_msgSend(v41, sel_setAllowsContinuousInteraction_, 0);
  v42 = *(void **)&v1[v31];
  if (!v42)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  objc_msgSend(v42, sel__setPreferredNumberOfVisibleIndicators_, 5);
  v43 = *(void **)&v1[v31];
  if (!v43)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  objc_msgSend(v43, sel__setCustomVerticalPadding_, 0.0);
  v44 = *(void **)&v1[v31];
  if (!v44)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  objc_msgSend(v44, sel_addTarget_action_forControlEvents_, v1, sel_pageControlDidChangePage_, 4096);
  v45 = *(void **)&v1[v31];
  if (!v45)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  objc_msgSend(v45, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E0DC48F0]);
  v46 = *(void **)&v1[v31];
  if (!v46)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  objc_msgSend(v46, sel_setTintAdjustmentMode_, 1);
  v47 = objc_msgSend(v1, sel_collectionView);
  if (!v47)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v48 = v47;
  v49 = objc_msgSend(v47, sel_numberOfItemsInSection_, 0);

  v50 = *(void **)&v1[v31];
  if (!v50)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (objc_msgSend(v50, sel_numberOfPages) == v49)
    goto LABEL_15;
  v51 = *(void **)&v1[v31];
  if (v51)
  {
    objc_msgSend(v51, sel_setNumberOfPages_, v49);
    sub_18AD51010(0, 1);
LABEL_15:
    v52 = objc_msgSend(v1, sel_view);
    if (v52)
    {
      v120 = v7;
      v115 = v22;
      v121 = v19;
      if (*(_QWORD *)&v1[v31])
      {
        v53 = v52;
        objc_msgSend(v52, sel_addSubview_);

        sub_18AF500D0();
        v54 = *MEMORY[0x1E0DC3040];
        v114 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
        v114(v127, v54, v128);
        sub_18AF5007C();
        v55 = (void (*)(id *, _QWORD))sub_18AF50058();
        sub_18AF4E918();
        v55(v133, 0);
        v56 = v122;
        v57 = objc_msgSend(v122, sel_labelColor);
        sub_18AF500AC();
        v58 = objc_msgSend(v56, sel_secondarySystemBackgroundColor);
        sub_18AF500A0();
        v59 = (void (*)(_QWORD))*((_QWORD *)v116 + 13);
        v113 = *MEMORY[0x1E0DC3188];
        v116 = v59;
        v59(v129);
        sub_18AF50064();
        sub_18AF50094();
        v60 = v124;
        sub_18AF4E300();
        KeyPath = swift_getKeyPath();
        MEMORY[0x1E0C80A78](KeyPath, v62);
        swift_getKeyPath();
        v133[0] = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC1448]);
        sub_18AD54500();
        sub_18AF4E2F4();
        v63 = (uint64_t)v120;
        sub_18AF4FBE4();
        v64 = MEMORY[0x1E0DEE9D8];
        sub_18ACC13F4(v63, MEMORY[0x1E0DEE9D8]);
        v65 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v119 + 1);
        v65(v63, v132);
        (*(void (**)(char *, char *, uint64_t))(v125 + 16))(v117, v60, v126);
        v66 = v118;
        sub_18AF4E2E8();
        v67 = sub_18AF4E2DC();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v66, 0, 1, v67);
        sub_18AF50088();
        v68 = sub_18ACBE1B0(0, &qword_1EDF98D60);
        v69 = *(char **)(v123 + 16);
        v119 = v29;
        v117 = v69;
        ((void (*)(char *, char *, uint64_t))v69)(v131, v29, v121);
        sub_18ACBE1B0(0, &qword_1EDF9A6B0);
        swift_allocObject();
        swift_unknownObjectWeakInit();
        sub_18AF50040();
        v118 = (char *)v68;
        v70 = sub_18AF500E8();
        v71 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton;
        v72 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton];
        *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton] = v70;

        v133[0] = (id)v64;
        v73 = objc_msgSend(v1, sel_traitCollection);
        v74 = objc_msgSend(v73, sel_userInterfaceIdiom);

        if (!v74)
        {
          sub_18AF4FBE4();
          sub_18ACC13F4(v63, MEMORY[0x1E0DEE9D8]);
          v112 = v65;
          v65(v63, v132);
          v75 = (void *)sub_18AF4FC38();
          v76 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v75);

          swift_allocObject();
          swift_unknownObjectWeakInit();
          sub_18AF50040();
          MEMORY[0x18D775E98]();
          if (*(_QWORD *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8)
                                                                                                  + 0x18) >> 1)
            sub_18AF4FD58();
          sub_18AF4FD70();
          sub_18AF4FD4C();
          v63 = (uint64_t)v120;
          v65 = v112;
        }
        sub_18AF4FBE4();
        sub_18ACC13F4(v63, MEMORY[0x1E0DEE9D8]);
        v65(v63, v132);
        v77 = (void *)sub_18AF4FC38();
        v78 = (void *)objc_opt_self();
        v79 = objc_msgSend(v78, sel_systemImageNamed_, v77);

        swift_allocObject();
        swift_unknownObjectWeakInit();
        sub_18AF50040();
        MEMORY[0x18D775E98]();
        if (*(_QWORD *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v133[0] & 0xFFFFFFFFFFFFFF8)
                                                                                                + 0x18) >> 1)
          sub_18AF4FD58();
        sub_18AF4FD70();
        sub_18AF4FD4C();
        v80 = *(void **)&v1[v71];
        v81 = v115;
        v82 = v119;
        if (v80)
        {
          if ((unint64_t)v133[0] >> 62)
          {
            sub_18ACBE1B0(0, &qword_1EDF9A6B8);
            v111 = v80;
            sub_18AF4E9A8();
            sub_18AF5031C();
          }
          else
          {
            swift_bridgeObjectRetain_n();
            v83 = v80;
            sub_18AF50424();
            sub_18ACBE1B0(0, &qword_1EDF9A6B8);
          }
          swift_bridgeObjectRelease();
          sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF9A6C0);
          v84 = (void *)sub_18AF4FFC8();
          objc_msgSend(v80, sel_setMenu_, v84);

          v85 = *(void **)&v1[v71];
          if (v85)
          {
            v86 = *MEMORY[0x1E0DC48D8];
            objc_msgSend(v85, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E0DC48D8]);
            v87 = *(void **)&v1[v71];
            if (v87)
            {
              objc_msgSend(v87, sel_setTintAdjustmentMode_, 1);
              v88 = objc_msgSend(v1, sel_view);
              if (v88)
              {
                if (*(_QWORD *)&v1[v71])
                {
                  v89 = v88;
                  objc_msgSend(v88, sel_addSubview_);

                  v90 = *(void **)&v1[v71];
                  if (v90)
                  {
                    v91 = objc_msgSend(v90, sel_currentPreferredSymbolConfiguration);
                    v92 = (void *)objc_opt_self();
                    v93 = v122;
                    if (v91)
                    {
                      v94 = objc_msgSend(v92, sel_configurationWithWeight_, 6);
                      v95 = objc_msgSend(v91, sel_configurationByApplyingConfiguration_, v94);

                    }
                    else
                    {
                      v95 = objc_msgSend(v92, sel_configurationWithPointSize_weight_scale_, 6, 2, 18.0);
                    }
                    sub_18AF500D0();
                    v96 = (void *)sub_18AF4FC38();
                    v97 = objc_msgSend(v78, sel_systemImageNamed_, v96);

                    sub_18AF500C4();
                    v98 = v95;
                    sub_18AF5004C();
                    v114(v127, *MEMORY[0x1E0DC3060], v128);
                    sub_18AF5007C();
                    v99 = objc_msgSend(v93, sel_whiteColor);
                    sub_18AF500AC();
                    v100 = objc_msgSend(v93, sel_tintColor);
                    sub_18AF500A0();
                    ((void (*)(char *, _QWORD, uint64_t))v116)(v129, v113, v130);
                    sub_18AF50064();
                    v101 = v121;
                    ((void (*)(char *, char *, uint64_t))v117)(v131, v81, v121);
                    swift_allocObject();
                    swift_unknownObjectWeakInit();
                    sub_18AF50040();
                    v102 = (void *)sub_18AF500E8();
                    objc_msgSend(v102, sel_setMaximumContentSizeCategory_, v86);
                    objc_msgSend(v102, sel_setTintAdjustmentMode_, 1);
                    v103 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton;
                    v104 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton];
                    *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton] = v102;
                    v105 = v102;

                    v106 = objc_msgSend(v1, sel_view);
                    if (v106)
                    {
                      v107 = *(void **)&v1[v103];
                      if (v107)
                      {
                        v108 = v106;
                        v109 = v107;
                        swift_bridgeObjectRelease();
                        objc_msgSend(v108, sel_addSubview_, v109);

                        v110 = *(void (**)(char *, uint64_t))(v123 + 8);
                        v110(v81, v101);
                        (*(void (**)(char *, uint64_t))(v125 + 8))(v124, v126);
                        v110(v82, v101);
                        return;
                      }
                      goto LABEL_58;
                    }
LABEL_57:
                    __break(1u);
LABEL_58:
                    __break(1u);
                    goto LABEL_59;
                  }
LABEL_56:
                  __break(1u);
                  goto LABEL_57;
                }
LABEL_55:
                __break(1u);
                goto LABEL_56;
              }
LABEL_54:
              __break(1u);
              goto LABEL_55;
            }
LABEL_53:
            __break(1u);
            goto LABEL_54;
          }
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
LABEL_51:
        __break(1u);
        goto LABEL_52;
      }
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
LABEL_59:
  __break(1u);
}

uint64_t sub_18AD4ED18()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9A6A0);
  return sub_18AF4FBD8() & 1;
}

void sub_18AD4ED70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = sub_18AD501B8();
    if (!v5)
    {

      return;
    }
    v6 = (void *)v5;
    if (*(_BYTE *)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type) != 3
      && !*(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_mode])
    {
      v8 = sub_18AD501B8();
      if (v8)
      {
        v9 = (void *)v8;
        v11 = *(void **)(v8 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar);
        v10 = *(_QWORD *)(v8 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 8);
        v13 = *(_QWORD *)(v8 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 16);
        v12 = *(_QWORD *)(v8 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 24);
        sub_18ACD1680(v11, v10, v13, v12);

        if (v11 != (void *)1)
        {
          if ((v10 & 1) != 0)
          {
            v14 = (void *)MEMORY[0x18D7779A4](&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
            if (v14)
            {
              objc_msgSend(v14, sel_avatarPosterPairCollectionDidSelectEditAvatar_, v11);

              swift_unknownObjectRelease();
              sub_18ACD16B8(v11, v10, v13, v12);
              return;
            }
            sub_18ACD16B8(v11, v10, v13, v12);
            goto LABEL_15;
          }
          sub_18ACD16B8(v11, v10, v13, v12);
        }
      }
    }
    v7 = (void *)MEMORY[0x18D7779A4](&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
    if (v7)
    {
      objc_msgSend(v7, sel_avatarPosterPairCollectionDidSelectCreateNew);

      swift_unknownObjectRelease();
      return;
    }
LABEL_15:

  }
}

void sub_18AD4EF10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  void *v34;
  id v35;
  id aBlock[11];

  aBlock[10] = *(id *)MEMORY[0x1E0C80C00];
  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = sub_18AD501B8();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = *(void **)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster);
      v8 = *(_WORD *)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster + 8);
      sub_18ACBC764(v7);

      if ((unint64_t)v7 >= 2)
      {
        if ((v8 & 1) == 0)
        {
LABEL_10:
          sub_18ACBC774(v7);
          goto LABEL_12;
        }
        v9 = (void *)objc_opt_self();
        v10 = v7;
        v11 = objc_msgSend(v10, sel_posterData);
        v12 = sub_18AF4E48C();
        v14 = v13;

        v15 = (void *)sub_18AF4E474();
        sub_18ACB9CDC(v12, v14);
        aBlock[0] = 0;
        v16 = objc_msgSend(v9, sel_unarchiveCNConfigurationFromData_error_, v15, aBlock);

        if (v16)
        {
          v17 = qword_1EDF949F0;
          v18 = aBlock[0];
          if (v17 != -1)
            swift_once();
          v19 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact;
          v20 = *(id *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact];
          v21 = objc_msgSend(v10, (SEL)&selRef_photoPickerProviderGroup_didUpdateItem_ + 3);
          v22 = sub_18AF4E48C();
          v24 = v23;

          v25 = sub_18AD5B380(v22, v24, (uint64_t)v20);
          sub_18ACB9CDC(v22, v24);

          if ((v25 & 1) == 0)
          {
            v29 = *(void **)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration];
            *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration] = v16;
            v30 = v16;

            v31 = objc_msgSend(objc_allocWithZone((Class)CNPRUISIncomingCallPosterContext), sel_initWithContact_showName_, *(_QWORD *)&v4[v19], 1);
            v32 = objc_msgSend(objc_allocWithZone((Class)CNPRUISPosterEditingViewController), sel_initWithExistingConfiguration_context_, v30, v31);
            objc_msgSend(v32, sel_setDelegate_, v4);
            objc_msgSend(v32, sel_setModalPresentationStyle_, 0);
            v33 = (_QWORD *)swift_allocObject();
            v33[2] = v32;
            aBlock[4] = sub_18AD54620;
            aBlock[5] = v33;
            aBlock[0] = (id)MEMORY[0x1E0C809B0];
            aBlock[1] = (id)1107296256;
            aBlock[2] = sub_18ACC449C;
            aBlock[3] = &block_descriptor_27_0;
            v34 = _Block_copy(aBlock);
            v35 = v32;
            swift_release();
            objc_msgSend(v4, sel_presentViewController_animated_completion_, v35, 1, v34);
            _Block_release(v34);

            sub_18ACBC774(v7);
            sub_18ACBC774(v7);
LABEL_15:

            return;
          }

          sub_18ACBC774(v7);
          goto LABEL_10;
        }
        v26 = aBlock[0];
        v27 = (void *)sub_18AF4E42C();

        swift_willThrow();
        sub_18ACBC774(v7);
        sub_18ACBC774(v7);

      }
    }
LABEL_12:
    v28 = (void *)MEMORY[0x18D7779A4](&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
    if (v28)
    {
      objc_msgSend(v28, sel_avatarPosterPairCollectionDidEditPoster_, 0);

      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_15;
  }
}

void sub_18AD4F2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = sub_18AD501B8();
    if (v5)
    {
      v6 = (void *)v5;
      v8 = *(void **)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar);
      v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 8);
      v10 = *(_QWORD *)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 16);
      v9 = *(_QWORD *)(v5 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 24);
      sub_18ACD1680(v8, v7, v10, v9);

      if (v8 != (void *)1)
      {
        if ((v7 & 1) != 0)
        {
          v11 = (void *)MEMORY[0x18D7779A4](&v4[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
          if (v11)
          {
            objc_msgSend(v11, sel_avatarPosterPairCollectionDidSelectEditAvatar_, v8);

            swift_unknownObjectRelease();
            sub_18ACD16B8(v8, v7, v10, v9);
            return;
          }
        }
        sub_18ACD16B8(v8, v7, v10, v9);
      }
    }

  }
}

void sub_18AD4F3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x18D7779A4](v3 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
    if (v5)
    {
      objc_msgSend(v5, sel_avatarPosterPairCollectionDidSelectCreateNew);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_18AD4F478()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unsigned __int8 *v31;
  int v32;
  _BYTE *v33;
  char v34;
  __int16 v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  unsigned int (*v46)(char *, uint64_t, uint64_t);
  char *v47;
  uint64_t v48;
  _BOOL4 v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  char **v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  char **v60;
  id v61;
  char *v62;
  void *v63;
  void *v64;
  id v65;
  _BOOL8 v66;
  id v67;
  id v68;
  uint64_t v69;
  char *v70;
  char *v71;
  int v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  _BOOL4 v79;
  id v80;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A688);
  MEMORY[0x1E0C80A78](v2, v3);
  v71 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A690);
  MEMORY[0x1E0C80A78](v5, v6);
  v78 = (uint64_t)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v69 - v10;
  MEMORY[0x1E0C80A78](v12, v13);
  v74 = (char *)&v69 - v14;
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v69 - v17;
  v19 = sub_18AF4FC2C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21);
  v23 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_18AF4E30C();
  v75 = *(_QWORD *)(v24 - 8);
  v76 = v24;
  MEMORY[0x1E0C80A78](v24, v25);
  v70 = (char *)&v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v27, v28);
  v30 = (char *)&v69 - v29;
  v31 = (unsigned __int8 *)sub_18AD501B8();
  if (v31)
  {
    v32 = v31[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type];

    v79 = v32 == 3;
  }
  else
  {
    v79 = 0;
  }
  v33 = (_BYTE *)sub_18AD501B8();
  if (v33)
  {
    v34 = (*(_QWORD *)&v33[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar] == 1) | v33[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar
                                                                                                + 8];
    if (*(_QWORD *)&v33[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster] == 1)
    {

      if ((v34 & 1) != 0)
      {
        v72 = 1;
        goto LABEL_11;
      }
    }
    else
    {
      v35 = *(_WORD *)&v33[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster + 8];

      if ((v34 & 1) != 0)
      {
        v72 = v35 & 1;
        goto LABEL_11;
      }
    }
  }
  v72 = 0;
LABEL_11:
  v36 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl];
  if (!v36)
  {
    __break(1u);
    goto LABEL_36;
  }
  v73 = v11;
  v37 = v79;
  objc_msgSend(v36, sel_setHidden_, v79);
  v38 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton];
  if (!v38)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  objc_msgSend(v38, sel_setHidden_, v37);
  sub_18AF4E300();
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath, v40);
  *(&v69 - 2) = v41;
  swift_getKeyPath();
  v80 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4AD0], *MEMORY[0x1E0DC1448]);
  sub_18AD54500();
  sub_18AF4E2F4();
  sub_18AF4FBE4();
  v77 = v30;
  sub_18ACC13F4((uint64_t)v23, MEMORY[0x1E0DEE9D8]);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  v42 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton;
  v43 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton];
  if (!v43)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v44 = v43;
  sub_18AF500F4();
  v45 = sub_18AF500DC();
  v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 48);
  if (v46(v18, 1, v45))
  {
    swift_bridgeObjectRelease();
    sub_18ACCDEA4((uint64_t)v18, v78, &qword_1EDF9A690);
    sub_18AF50100();

    sub_18ACCDE68((uint64_t)v18, &qword_1EDF9A690);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v70, v77, v76);
    v47 = v71;
    sub_18AF4E2E8();
    v48 = sub_18AF4E2DC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v47, 0, 1, v48);
    sub_18AF50088();
    sub_18AF50100();

  }
  v49 = v79;
  v50 = *(void **)&v1[v42];
  v51 = (uint64_t)v74;
  if (!v50)
    goto LABEL_38;
  v52 = v50;
  sub_18AF500F4();
  if (v46((char *)v51, 1, v45))
  {
    sub_18ACCDEA4(v51, v78, &qword_1EDF9A690);
    sub_18AF50100();

    sub_18ACCDE68(v51, &qword_1EDF9A690);
  }
  else
  {
    v53 = (void *)objc_opt_self();
    v54 = &selRef_whiteColor;
    if (!v49)
      v54 = &selRef_labelColor;
    v55 = objc_msgSend(v53, *v54);
    sub_18AF500AC();
    sub_18AF50100();

  }
  v56 = (uint64_t)v73;
  v57 = *(void **)&v1[v42];
  if (!v57)
    goto LABEL_39;
  v58 = v57;
  sub_18AF500F4();
  if (v46((char *)v56, 1, v45))
  {
    sub_18ACCDEA4(v56, v78, &qword_1EDF9A690);
    sub_18AF50100();

    sub_18ACCDE68(v56, &qword_1EDF9A690);
  }
  else
  {
    v59 = (void *)objc_opt_self();
    v60 = &selRef_tintColor;
    if (!v49)
      v60 = &selRef_secondarySystemBackgroundColor;
    v61 = objc_msgSend(v59, *v60);
    sub_18AF500A0();
    sub_18AF50100();

  }
  v62 = v77;
  v63 = *(void **)&v1[v42];
  if (!v63)
    goto LABEL_40;
  objc_msgSend(v63, sel_setHidden_, (v72 | v49) ^ 1u);
  v64 = *(void **)&v1[v42];
  if (!v64)
  {
LABEL_41:
    __break(1u);
    return;
  }
  v65 = v64;
  if (v49)
  {
    v66 = 0;
  }
  else
  {
    v67 = objc_msgSend(v1, sel_traitCollection);
    v68 = objc_msgSend(v67, sel_userInterfaceIdiom);

    v66 = v68 == 0;
  }
  objc_msgSend(v65, sel_setShowsMenuAsPrimaryAction_, v66);

  (*(void (**)(char *, uint64_t))(v75 + 8))(v62, v76);
}

id sub_18AD4FB54@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  char *v20;
  id result;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double MidX;
  double MidY;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v42 - v14;
  *(_QWORD *)&v18 = MEMORY[0x1E0C80A78](v16, v17).n128_u64[0];
  v20 = (char *)&v42 - v19;
  result = objc_msgSend(v4, sel_collectionView, v18);
  if (!result)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v22 = result;
  objc_msgSend(result, sel_visibleSize);
  v24 = v23;
  v26 = v25;

  v43.origin.x = a2;
  v43.origin.y = a3;
  v43.size.width = v24;
  v43.size.height = v26;
  if (CGRectIsEmpty(v43))
  {
    result = objc_msgSend(v4, sel_collectionView);
    if (result)
    {
      v27 = result;
      v28 = objc_msgSend(result, sel_indexPathsForVisibleItems);

      v29 = sub_18AF4E5B8();
      v30 = sub_18AF4FD34();

      v31 = *(_QWORD *)(v29 - 8);
      if (*(_QWORD *)(v30 + 16))
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v31 + 16))(a1, v30 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80)), v29);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(a1, 0, 1, v29);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(a1, 1, 1, v29);
      }
      return (id)swift_bridgeObjectRelease();
    }
    goto LABEL_20;
  }
  v44.origin.x = a2;
  v44.origin.y = a3;
  v44.size.width = v24;
  v44.size.height = v26;
  MidX = CGRectGetMidX(v44);
  v45.origin.x = a2;
  v45.origin.y = a3;
  v45.size.width = v24;
  v45.size.height = v26;
  MidY = CGRectGetMidY(v45);
  result = objc_msgSend(v4, sel_collectionView);
  if (!result)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    return result;
  }
  v34 = result;
  v35 = objc_msgSend(result, sel_indexPathForItemAtPoint_, MidX, MidY);

  if (v35)
  {
    sub_18AF4E570();

    v36 = sub_18AF4E5B8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v15, 0, 1, v36);
  }
  else
  {
    v36 = sub_18AF4E5B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v15, 1, 1, v36);
  }
  sub_18ACD5C10((uint64_t)v15, (uint64_t)v20, (uint64_t *)&unk_1EDF99400);
  sub_18ACCDEA4((uint64_t)v20, (uint64_t)v11, (uint64_t *)&unk_1EDF99400);
  sub_18AF4E5B8();
  v37 = *(_QWORD *)(v36 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v11, 1, v36) != 1)
  {
    sub_18ACCDE68((uint64_t)v20, (uint64_t *)&unk_1EDF99400);
    (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(a1, v11, v36);
    return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(a1, 0, 1, v36);
  }
  result = objc_msgSend(v4, sel_collectionView);
  if (!result)
    goto LABEL_22;
  v38 = result;
  v39 = objc_msgSend(result, sel_indexPathsForVisibleItems);

  v40 = sub_18AF4FD34();
  if (*(_QWORD *)(v40 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v37 + 16))(a1, v40 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80)), v36);
    v41 = 0;
  }
  else
  {
    v41 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(a1, v41, 1, v36);
  swift_bridgeObjectRelease();
  sub_18ACCDE68((uint64_t)v20, (uint64_t *)&unk_1EDF99400);
  return (id)sub_18ACCDE68((uint64_t)v11, (uint64_t *)&unk_1EDF99400);
}

id sub_18AD4FF70@<X0>(char *a1@<X8>)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18AF4E5B8();
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)&v11 = MEMORY[0x1E0C80A78](v8, v10).n128_u64[0];
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v1, sel_collectionView, v11);
  if (result)
  {
    v15 = result;
    objc_msgSend(result, sel_contentOffset);
    v17 = v16;
    v19 = v18;

    sub_18AD4FB54((uint64_t)v7, v17, v19);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_18ACCDE68((uint64_t)v7, (uint64_t *)&unk_1EDF99400);
    }
    else
    {
      v20 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v20(v13, v7, v8);
      v21 = sub_18AF4E5A0();
      v22 = *(void **)&v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel];
      swift_getKeyPath();
      swift_getKeyPath();
      v23 = v22;
      sub_18AF4EB94();

      swift_release();
      swift_release();
      if (v27 >> 62)
      {
        sub_18AF4E9A8();
        v24 = sub_18AF50328();
        swift_bridgeObjectRelease();
      }
      else
      {
        v24 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v21 < v24)
      {
        v20(a1, v13, v8);
        v25 = 0;
        return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v25, 1, v8);
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    }
    v25 = 1;
    return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, v25, 1, v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_18AD501B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t result;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18AF4E5B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD4FF70(v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_18ACCDE68((uint64_t)v4, (uint64_t *)&unk_1EDF99400);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
  v11 = *(id *)(v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  v12 = sub_18AF4E5A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();

  swift_release();
  result = swift_release();
  if ((v16 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x18D776384](v12, v16);
    goto LABEL_7;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 < *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = *(id *)(v16 + 8 * v12 + 32);
LABEL_7:
    v10 = v14;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return (uint64_t)v10;
  }
  __break(1u);
  return result;
}

void sub_18AD5037C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  CGFloat Height;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  uint64_t v43;
  void *v44;
  CGFloat v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  void *v55;
  double v56;
  id v57;
  id v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  id v71;
  void *v72;
  CGFloat v73;
  CGFloat v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  id v89;
  void *v90;
  id v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  id v98;
  void *v99;
  id v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  double MidX;
  CGFloat v111;
  BOOL v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  CGFloat v118;
  int v119;
  id v120;
  id v121;
  void *v122;
  CGFloat v123;
  CGFloat v124;
  id v125;
  void *v126;
  id v127;
  double v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat v135;
  CGFloat v136;
  CGFloat MinY;
  uint64_t v138;
  CGFloat v139;
  CGFloat MaxX;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](v6, v8).n128_u64[0];
  v11 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(v0, sel_view, v9);
  if (!v12)
  {
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v13 = v12;
  objc_msgSend(v12, sel_bounds);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v144.origin.x = v15;
  v144.origin.y = v17;
  v144.size.width = v19;
  v144.size.height = v21;
  Width = CGRectGetWidth(v144);
  v145.origin.x = v15;
  v145.origin.y = v17;
  v145.size.width = v19;
  v145.size.height = v21;
  if (CGRectGetHeight(v145) < Width)
  {
    v146.origin.x = v15;
    v146.origin.y = v17;
    v146.size.width = v19;
    v146.size.height = v21;
    Height = CGRectGetHeight(v146);
    v147.origin.x = v15;
    v147.origin.y = v17;
    v147.size.width = v19;
    v147.size.height = v21;
    v21 = CGRectGetWidth(v147);
    v19 = Height;
  }
  v24 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v24, sel_displayScale);
  v26 = v25;

  v27 = objc_msgSend(v1, sel_collectionViewLayout);
  v28 = objc_msgSend(v1, sel_collectionView);
  if (!v28)
    goto LABEL_45;
  v29 = v28;
  objc_msgSend(v28, sel_contentOffset);
  v31 = v30;
  v33 = v32;

  sub_18AD4FB54((uint64_t)v5, v31, v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    MEMORY[0x18D774710](0, 0);
    sub_18ACCDE68((uint64_t)v5, (uint64_t *)&unk_1EDF99400);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v5, v6);
  }
  v142 = v19;
  v143 = v21;
  v34 = (void *)sub_18AF4E558();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  v35 = objc_msgSend(v27, sel_layoutAttributesForItemAtIndexPath_, v34);

  v141 = v17;
  if (v35)
  {
    objc_msgSend(v35, sel_frame);
    MaxX = v36;
    v38 = v37;
    v40 = v39;
    v42 = v41;

  }
  else
  {
    v40 = 0.0;
    v42 = 0.0;
    MaxX = 0.0;
    v38 = 0.0;
  }
  v43 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl;
  v44 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl];
  if (!v44)
    goto LABEL_46;
  v45 = v15;
  v138 = v26;
  objc_msgSend(v44, sel_sizeForNumberOfPages_, 5);
  v47 = v46;
  v49 = v48;
  v50 = MaxX;
  v148.origin.x = MaxX;
  v148.origin.y = v38;
  v148.size.width = v40;
  v148.size.height = v42;
  MinX = CGRectGetMinX(v148);
  v149.origin.x = v50;
  v149.origin.y = v38;
  v149.size.width = v40;
  v149.size.height = v42;
  MaxY = CGRectGetMaxY(v149);
  v150.origin.x = v50;
  v150.origin.y = v38;
  v150.size.width = v40;
  v150.size.height = v42;
  v51 = CGRectGetWidth(v150);
  v139 = v45;
  v151.origin.x = v45;
  v151.origin.y = v141;
  v151.size.width = v142;
  v151.size.height = v143;
  v52 = CGRectGetHeight(v151);
  v152.origin.x = v50;
  MinY = v38;
  v152.origin.y = v38;
  v152.size.width = v40;
  v152.size.height = v42;
  v53 = CGRectGetMaxY(v152);
  v54 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton;
  v55 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton];
  if (!v55)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v135 = v42;
  v136 = v40;
  v56 = v52 - v53 - (v49 + v49) + -8.0;
  objc_msgSend(v55, sel_sizeThatFits_, v51, v56, *(_QWORD *)&v49, v47);
  v57 = objc_msgSend(v1, sel_traitCollection);
  v58 = objc_msgSend(v57, sel_userInterfaceIdiom);

  if (v58 == (id)1)
  {
    v59 = v141;
    v60 = v142;
    v61 = v139;
    v62 = v143;
  }
  else
  {
    v61 = v139;
    v153.origin.x = v139;
    v59 = v141;
    v60 = v142;
    v153.origin.y = v141;
    v153.size.width = v142;
    v62 = v143;
    v153.size.height = v143;
    CGRectGetWidth(v153);
    v154.origin.y = MaxY;
    v154.origin.x = MinX;
    v154.size.width = v51;
    v154.size.height = v56;
    CGRectGetHeight(v154);
  }
  BSSizeCeilForScale();
  MaxY = v63;
  v65 = v64;
  v155.origin.x = v61;
  v155.origin.y = v59;
  v155.size.width = v60;
  v155.size.height = v62;
  MinX = CGRectGetMidX(v155);
  v156.origin.x = v61;
  v156.origin.y = v59;
  v156.size.width = v60;
  v156.size.height = v62;
  CGRectGetMaxY(v156);
  v157.origin.x = v61;
  v157.origin.y = v59;
  v157.size.width = v60;
  v157.size.height = v62;
  CGRectGetMaxY(v157);
  v66 = MaxX;
  v158.origin.x = MaxX;
  v67 = v136;
  v68 = MinY;
  v158.origin.y = MinY;
  v158.size.width = v136;
  v69 = v135;
  v158.size.height = v135;
  CGRectGetMaxY(v158);
  v70 = *(void **)&v1[v54];
  if (!v70)
    goto LABEL_48;
  v71 = v70;
  MaxY = v65;
  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v71, sel_setFrame_);

  v159.origin.x = v66;
  v159.origin.y = v68;
  v159.size.width = v67;
  v159.size.height = v69;
  CGRectGetMaxY(v159);
  v72 = *(void **)&v1[v54];
  if (!v72)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  objc_msgSend(v72, sel_frame);
  CGRectGetMinY(v160);
  v73 = v139;
  v161.origin.x = v139;
  v74 = v141;
  v161.size.width = v142;
  v161.origin.y = v141;
  v161.size.height = v143;
  CGRectGetMidX(v161);
  v75 = *(void **)&v1[v43];
  if (!v75)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v76 = v75;
  BSRectWithSize();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v76, sel_setFrame_);

  v77 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton;
  v78 = *(void **)&v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton];
  if (!v78)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v79 = v78;
  BSSizeCeilForScale();
  BSRectWithSize();
  objc_msgSend(v79, sel_setBounds_);

  v80 = *(void **)&v1[v54];
  if (!v80)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  objc_msgSend(v80, sel_frame);
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v89 = objc_msgSend(v1, sel_view);
  if (!v89)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  v90 = v89;
  v91 = objc_msgSend(v89, sel_effectiveUserInterfaceLayoutDirection);

  if (v91)
  {
    v162.origin.x = v73;
    v162.origin.y = v74;
    v93 = v142;
    v92 = v143;
    v162.size.width = v142;
    v162.size.height = v143;
    MaxX = CGRectGetMinX(v162);
    v163.origin.x = v82;
    v163.origin.y = v84;
    v163.size.width = v86;
    v163.size.height = v88;
    MinY = CGRectGetMinY(v163);
    v164.origin.x = v82;
    v164.origin.y = v84;
    v164.size.width = v86;
    v164.size.height = v88;
    v94 = CGRectGetMinX(v164);
    v165.origin.x = v73;
    v165.origin.y = v141;
    v165.size.width = v93;
    v165.size.height = v92;
    v95 = CGRectGetMinX(v165);
  }
  else
  {
    v166.origin.x = v82;
    v166.origin.y = v84;
    v166.size.width = v86;
    v166.size.height = v88;
    MaxX = CGRectGetMaxX(v166);
    v167.origin.x = v82;
    v167.origin.y = v84;
    v167.size.width = v86;
    v167.size.height = v88;
    MinY = CGRectGetMinY(v167);
    v168.origin.x = v73;
    v168.origin.y = v74;
    v168.size.width = v142;
    v168.size.height = v143;
    v94 = CGRectGetMaxX(v168);
    v169.origin.x = v82;
    v169.origin.y = v84;
    v169.size.width = v86;
    v169.size.height = v88;
    v95 = CGRectGetMaxX(v169);
  }
  v96 = v94 - v95;
  v170.origin.x = v82;
  v170.origin.y = v84;
  v170.size.width = v86;
  v170.size.height = v88;
  v97 = CGRectGetHeight(v170);
  v98 = objc_msgSend(v1, sel_view);
  if (!v98)
    goto LABEL_54;
  v99 = v98;
  v100 = objc_msgSend(v98, sel_effectiveUserInterfaceLayoutDirection);

  v101 = MaxX;
  v102 = MinY;
  v103 = v96;
  v104 = v97;
  if (v100)
  {
    v105 = CGRectGetMinX(*(CGRect *)&v101);
    v106 = *(void **)&v1[v77];
    if (!v106)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    v107 = v105;
    objc_msgSend(v106, sel_frame);
    v108 = CGRectGetWidth(v171);
    v109 = *(void **)&v1[v77];
    if (!v109)
    {
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    MidX = v107 + v108 * 1.5;
    objc_msgSend(v109, sel_frame);
    v111 = (MidX + CGRectGetWidth(v172)) * 0.5;
    v173.origin.x = v82;
    v173.origin.y = v84;
    v173.size.width = v86;
    v173.size.height = v88;
    v112 = v111 < CGRectGetMinX(v173);
    goto LABEL_33;
  }
  v113 = CGRectGetMaxX(*(CGRect *)&v101);
  v114 = *(void **)&v1[v77];
  if (!v114)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v115 = v113;
  objc_msgSend(v114, sel_frame);
  v116 = CGRectGetWidth(v174);
  v117 = *(void **)&v1[v77];
  if (v117)
  {
    MidX = v115 + v116 * -1.5;
    objc_msgSend(v117, sel_frame);
    v118 = (MidX - CGRectGetWidth(v175)) * 0.5;
    v176.origin.x = v82;
    v176.origin.y = v84;
    v176.size.width = v86;
    v176.size.height = v88;
    v112 = CGRectGetMaxX(v176) < v118;
LABEL_33:
    v119 = v112;
    v120 = objc_msgSend(v1, sel_traitCollection);
    v121 = objc_msgSend(v120, sel_userInterfaceIdiom);

    v122 = *(void **)&v1[v77];
    v123 = MaxX;
    v124 = MinY;
    if (v121 == (id)1 && v119)
    {
      if (!v122)
      {
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
      v125 = v122;
    }
    else
    {
      if (!v122)
      {
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
      v125 = v122;
      v177.origin.x = v123;
      v177.origin.y = v124;
      v177.size.width = v96;
      v177.size.height = v97;
      MidX = CGRectGetMidX(v177);
    }
    v178.origin.x = v123;
    v178.origin.y = v124;
    v178.size.width = v96;
    v178.size.height = v97;
    objc_msgSend(v125, sel_setCenter_, MidX, CGRectGetMidY(v178));

    v126 = *(void **)&v1[v77];
    if (v126)
    {
      v127 = v126;
      objc_msgSend(v127, sel_frame);
      BSPointRoundForScale();
      v129 = v128;
      v131 = v130;
      objc_msgSend(v127, sel_frame);
      objc_msgSend(v127, sel_setFrame_, v129, v131);

      return;
    }
    goto LABEL_55;
  }
LABEL_61:
  __break(1u);
}

void sub_18AD50D24(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double MinX;
  double v16;
  double v17;
  char *v18;
  double v19;
  double *v20;
  double v21;
  char *v22;
  uint64_t v23;
  char *v24;
  double v25;
  double v26;
  double v28;
  id v29;
  void *v30;
  char *v31;
  uint64_t v32;
  CGRect v33;

  v2 = v1;
  v4 = sub_18AF4E5B8();
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)&v7 = MEMORY[0x1E0C80A78](v4, v6).n128_u64[0];
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, sel_currentPage, v7);
  v11 = objc_msgSend(v2, sel_collectionView);
  if (!v11)
    goto LABEL_28;
  v12 = v11;
  MEMORY[0x18D774710](v10, 0);
  v13 = (void *)sub_18AF4E558();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  v14 = objc_msgSend(v12, sel_layoutAttributesForItemAtIndexPath_, v13);

  if (!v14)
    return;
  objc_msgSend(v14, sel_frame);
  MinX = CGRectGetMinX(v33);
  v16 = MinX;
  if (MinX != 0.0)
  {
    v17 = MinX;
    v18 = *(char **)&v2[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout];
    v19 = *(double *)&v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize];
    v20 = (double *)&v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds];
    v21 = *(double *)&v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds + 16];
    v22 = &v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes];
    swift_beginAccess();
    if (!(*(_QWORD *)v22 >> 62))
    {
      v23 = *(_QWORD *)((*(_QWORD *)v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      v24 = v18;
LABEL_6:
      if (v23)
      {
        v16 = 0.0;
        while (1)
        {
          v25 = v23 == 1
              ? *(double *)&v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing]
              * 0.5
              : *(double *)&v18[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing];
          v26 = v16 + v19 + v25;
          if (v17 < v26 && v26 < v21)
            break;
          v16 = v26;
          if (!--v23)
            goto LABEL_16;
        }
        v21 = v26;
      }
      else
      {
LABEL_16:
        v16 = 0.0;
      }
      if (vabdd_f64(v16, v17) >= vabdd_f64(v21, v17))
      {
        v28 = v20[2];

        if (v28 - v19 >= v21)
          v16 = v21;
        else
          v16 = v28 - v19;
      }
      else
      {

      }
      goto LABEL_23;
    }
    v31 = v18;
    sub_18AF4E9A8();
    v23 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if ((v23 & 0x8000000000000000) == 0)
      goto LABEL_6;
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_23:
  v29 = objc_msgSend(v2, sel_collectionView);
  if (!v29)
  {
LABEL_29:
    __break(1u);
    return;
  }
  v30 = v29;
  objc_msgSend(v29, sel_setContentOffset_animated_, 1, v16, 0.0);

}

id sub_18AD51010(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](v6, v7).n128_u64[0];
  v10 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    sub_18AD4FF70((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v11 = sub_18AF4E5B8();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
      return (id)sub_18ACCDE68((uint64_t)v10, (uint64_t *)&unk_1EDF99400);
    a1 = sub_18AF4E5A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  v14 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl;
  result = *(id *)(v3 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  result = objc_msgSend(result, sel_currentPage, v9);
  if (result == (id)a1)
    return result;
  result = *(id *)(v3 + v14);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  return objc_msgSend(result, sel_setCurrentPage_, a1);
}

void sub_18AD51130(uint64_t a1, char a2, char a3)
{
  char *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  char *v8;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  char *v17;
  double *v18;
  void *v19;
  double MinX;
  double v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  double v26;
  double v27;
  id v29;
  void *v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unsigned __int8 *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char *v41;
  uint64_t v42;
  CGRect v43;

  v8 = v3;
  v12 = (_QWORD *)sub_18AF4E5B8();
  v13 = *(v12 - 1);
  *(_QWORD *)&v15 = MEMORY[0x1E0C80A78](v12, v14).n128_u64[0];
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (double *)objc_msgSend(v8, sel_collectionView, v15);
  if (!v18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v4 = (uint64_t)v18;
  MEMORY[0x18D774710](a1, 0);
  v19 = (void *)sub_18AF4E558();
  (*(void (**)(char *, _QWORD *))(v13 + 8))(v17, v12);
  v12 = objc_msgSend((id)v4, sel_layoutAttributesForItemAtIndexPath_, v19);

  if (!v12)
    return;
  objc_msgSend(v12, sel_frame);
  MinX = CGRectGetMinX(v43);
  v21 = MinX;
  if (MinX == 0.0)
    goto LABEL_22;
  v5 = MinX;
  v17 = *(char **)&v8[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout];
  v6 = *(double *)&v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize];
  v4 = (uint64_t)&v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds];
  v7 = *(double *)&v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds + 16];
  v22 = &v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes];
  swift_beginAccess();
  v23 = *(_QWORD *)v22;
  if (v23 >> 62)
  {
    v13 = v4;
    v41 = v17;
    sub_18AF4E9A8();
    v4 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if ((v4 & 0x8000000000000000) == 0)
      goto LABEL_46;
    __break(1u);
    goto LABEL_43;
  }
  v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  v25 = v17;
  if (v24)
    goto LABEL_6;
LABEL_15:
  v21 = 0.0;
  while (1)
  {
    if (vabdd_f64(v21, v5) >= vabdd_f64(v7, v5))
    {
      v5 = *(double *)(v4 + 16);

      v21 = v5 - v6 >= v7 ? v7 : v5 - v6;
    }
    else
    {

    }
LABEL_22:
    v29 = objc_msgSend(v8, sel_collectionView);
    v30 = v29;
    if ((a2 & 1) == 0 || (a3 & 1) == 0)
      break;
    if (v29)
    {
      objc_msgSend(v29, sel__setContentOffsetWithDecelerationAnimation_, v21, 0.0);

      return;
    }
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    v24 = v4;
    v4 = v13;
    if (!v24)
      goto LABEL_15;
LABEL_6:
    v21 = 0.0;
    while (1)
    {
      v26 = v24 == 1
          ? *(double *)&v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing]
          * 0.5
          : *(double *)&v17[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing];
      v27 = v21 + v6 + v26;
      if (v5 < v27 && v27 < v7)
        break;
      v21 = v27;
      if (!--v24)
        goto LABEL_15;
    }
    v7 = v27;
  }
  if (!v29)
    goto LABEL_45;
  objc_msgSend(v29, sel_setContentOffset_animated_, a2 & 1, v21, 0.0);

  if ((a2 & 1) != 0 || (sub_18AD51010(0, 1), (v31 = sub_18AD501B8()) == 0))
  {
LABEL_37:

    return;
  }
  v32 = (unsigned __int8 *)v31;
  v33 = MEMORY[0x18D7779A4](&v8[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate]);
  if (!v33)
  {

    goto LABEL_37;
  }
  v34 = (void *)v33;
  v35 = sub_18AD51C78();
  v36 = (unsigned __int8 *)sub_18AD501B8();
  if (v36 && (v37 = v36[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type], v36, v37 == 3)
    || (v38 = sub_18AD501B8()) == 0)
  {
    v40 = 0;
  }
  else
  {
    v39 = (void *)v38;
    v40 = *(void **)(v38 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster);
    sub_18ACBC764(v40);

    if (v40 == (void *)1)
      v40 = 0;
  }
  objc_msgSend(v34, sel_avatarPosterPairCollectionDidSelectAvatar_poster_selectionDidChange_isShared_, v35, v40, sub_18AD51D2C() & 1, v32[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type] == 1);

  swift_unknownObjectRelease();
}

void sub_18AD51514()
{
  char *v0;
  id v1;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  void (*v16)();
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD aBlock[6];
  CGRect v29;
  CGRect v30;

  v1 = objc_msgSend(v0, sel_collectionView);
  if (!v1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v2 = v1;
  objc_msgSend(v1, sel_frame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = 0.0;
  v30.size.height = 0.0;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  if (CGRectEqualToRect(v29, v30))
  {
    sub_18AF4FEF0();
    v27 = CNUILogPosters();
    sub_18AF4E8B8();

    return;
  }
  v11 = *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel]
      + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_pendingDeletedIndex;
  v12 = *(_QWORD *)v11;
  v13 = *(_BYTE *)(v11 + 8);
  v14 = objc_msgSend(v0, sel_collectionView);
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    if (!v14)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    objc_msgSend(v14, sel_reloadData);

    sub_18AD51130(0, 0, 0);
    v16 = 0;
  }
  else
  {
    if (!v14)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    *(_QWORD *)(v18 + 24) = v12;
    v19 = swift_allocObject();
    v16 = sub_18AD544B4;
    *(_QWORD *)(v19 + 16) = sub_18AD544B4;
    *(_QWORD *)(v19 + 24) = v18;
    aBlock[4] = sub_18ACC54C4;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18AD4C6AC;
    aBlock[3] = &block_descriptor_12;
    v20 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v15, sel_performBatchUpdates_completion_, v20, 0);
    _Block_release(v20);

  }
  sub_18AD51010(0, 1);
  v21 = objc_msgSend(v0, sel_collectionView);
  if (!v21)
    goto LABEL_16;
  v22 = v21;
  v23 = objc_msgSend(v21, sel_numberOfItemsInSection_, 0);

  v24 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl;
  v25 = *(void **)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl];
  if (!v25)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (objc_msgSend(v25, sel_numberOfPages) == v23)
  {
LABEL_14:
    sub_18AD4F478();
    sub_18ACCDD44((uint64_t)v16);
    return;
  }
  v26 = *(void **)&v0[v24];
  if (v26)
  {
    objc_msgSend(v26, sel_setNumberOfPages_, v23);
    sub_18AD51010(0, 1);
    goto LABEL_14;
  }
LABEL_20:
  __break(1u);
}

void sub_18AD5181C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_18AF4E54C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = MEMORY[0x18D7779A4](a1 + 16);
  if (v9)
  {
    v10 = (char *)v9;
    v11 = *(id *)(v9 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout);
    sub_18AF4E540();
    sub_18AD43040();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v12 = objc_msgSend(v10, sel_collectionView);
    if (v12)
    {
      v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A680);
      sub_18AF4E5B8();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_18AF84FD0;
      MEMORY[0x18D774710](a2, 0);
      v14 = (void *)sub_18AF4FD28();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_deleteItemsAtIndexPaths_, v14);

      v15 = *(_QWORD *)&v10[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel]
          + OBJC_IVAR____TtC10ContactsUI37CNAvatarPosterPairCollectionViewModel_pendingDeletedIndex;
      *(_QWORD *)v15 = 0;
      *(_BYTE *)(v15 + 8) = 1;
      sub_18AD519DC();

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_18AD519DC()
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
  uint64_t v9;
  char *v10;
  id v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD4FF70(v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_18ACCDE68((uint64_t)v5, (uint64_t *)&unk_1EDF99400);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
  v11 = *(id *)(v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  v12 = sub_18AF4E5A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();

  swift_release();
  swift_release();
  if ((v24 & 0xC000000000000001) == 0)
  {
    if ((v12 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v12 < *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v13 = (unsigned __int8 *)*(id *)(v24 + 8 * v12 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  v13 = (unsigned __int8 *)MEMORY[0x18D776384](v12, v24);
LABEL_7:
  v14 = v13;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v15 = MEMORY[0x18D7779A4](v1 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
  if (v15)
  {
    v16 = (void *)v15;
    v17 = sub_18AD51C78();
    v18 = (unsigned __int8 *)sub_18AD501B8();
    if (v18 && (v19 = v18[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type], v18, v19 == 3)
      || (v20 = sub_18AD501B8()) == 0)
    {
      v22 = 0;
    }
    else
    {
      v21 = (void *)v20;
      v22 = *(void **)(v20 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster);
      sub_18ACBC764(v22);

      if (v22 == (void *)1)
        v22 = 0;
    }
    objc_msgSend(v16, sel_avatarPosterPairCollectionDidSelectAvatar_poster_selectionDidChange_isShared_, v17, v22, sub_18AD51D2C() & 1, v14[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type] == 1);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

void *sub_18AD51C78()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;

  v0 = (unsigned __int8 *)sub_18AD501B8();
  if (v0)
  {
    v1 = v0[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type];

    if (v1 == 3)
      return 0;
  }
  v2 = sub_18AD501B8();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 8);
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 16);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar + 24);
  sub_18ACD1680(v4, v5, v6, v7);

  if (v4 == (void *)1)
    return 0;
  v8 = v4;
  sub_18ACD16B8(v4, v5, v6, v7);
  return v4;
}

uint64_t sub_18AD51D2C()
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
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t v22;
  unint64_t v23;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD4FF70(v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_18ACCDE68((uint64_t)v5, (uint64_t *)&unk_1EDF99400);
LABEL_3:
    v11 = 0;
    return v11 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
  v13 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel;
  v14 = *(id *)(v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  v15 = sub_18AF4E5A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();

  swift_release();
  swift_release();
  if ((v23 & 0xC000000000000001) == 0)
  {
    if ((v15 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v15 < *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v16 = *(id *)(v23 + 8 * v15 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_21;
  }
  v16 = (id)MEMORY[0x18D776384](v15, v23);
LABEL_9:
  v15 = (unint64_t)v16;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v17 = *(void **)(v1 + v13);
  swift_getKeyPath();
  swift_getKeyPath();
  v18 = v17;
  sub_18AF4EB94();

  swift_release();
  swift_release();
  if (!(v23 >> 62))
  {
    v19 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_11;
  }
LABEL_21:
  sub_18AF4E9A8();
  v19 = sub_18AF50328();
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  v20 = *(unsigned __int8 *)(v15 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type);
  if (!*(_BYTE *)(v15 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type))
  {

    goto LABEL_3;
  }
  if (v20 == 2)
  {
    v21 = *(_BYTE *)(v15 + OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_isRecentUsedAsContactPair);

    v11 = v21 ^ 1;
  }
  else if (v20 == 3)
  {

    v11 = v19 == 1;
  }
  else
  {

    v11 = 1;
  }
  return v11 & 1;
}

void sub_18AD51FF8(void *a1)
{
  _BYTE *v1;
  uint64_t v2;
  unsigned __int8 v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
  _QWORD aBlock[6];

  v2 = OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling;
  if ((v1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling] & 1) == 0)
  {
    v3 = objc_msgSend(a1, sel__isAnimatingScroll);
    v4 = v1[v2];
    v1[v2] = v3;
    if ((v3 & 1) == 0)
    {
      if (v4)
        sub_18AD51010(0, 1);
    }
  }
  v5 = objc_msgSend(v1, sel_collectionView);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_visibleCells);

    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF9A6F0);
    v8 = sub_18AF4FD34();

    if (v8 >> 62)
    {
LABEL_23:
      sub_18AF4E9A8();
      v9 = sub_18AF50328();
      swift_bridgeObjectRelease();
      if (v9)
        goto LABEL_8;
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v9)
      {
LABEL_8:
        v10 = 4;
        do
        {
          if ((v8 & 0xC000000000000001) != 0)
            v14 = (id)MEMORY[0x18D776384](v10 - 4, v8);
          else
            v14 = *(id *)(v8 + 8 * v10);
          v15 = v14;
          v16 = v10 - 3;
          if (__OFADD__(v10 - 4, 1))
          {
            __break(1u);
            goto LABEL_23;
          }
          type metadata accessor for CNAvatarPosterPairCollectionViewCell();
          v17 = swift_dynamicCastClass();
          if (v17)
          {
            v18 = v17;
            v19 = *(void **)(v17 + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView);
            if (!v19)
            {
              __break(1u);
              goto LABEL_26;
            }
            v20 = v15;
            objc_msgSend(v19, sel_contentOffset);
            if (v22 != 0.0 || v21 != 0.0)
            {
              v23 = (id)objc_opt_self();
              v11 = swift_allocObject();
              *(_QWORD *)(v11 + 16) = v18;
              aBlock[4] = sub_18AD550A0;
              aBlock[5] = v11;
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 1107296256;
              aBlock[2] = sub_18ACC449C;
              aBlock[3] = &block_descriptor_57;
              v12 = _Block_copy(aBlock);
              v13 = v20;
              swift_release();
              objc_msgSend(v23, sel_animateWithDuration_animations_, v12, 0.3);
              _Block_release(v12);
            }

          }
          ++v10;
        }
        while (v16 != v9);
      }
    }
    swift_bridgeObjectRelease();
    sub_18AD4F478();
    sub_18AD519DC();
  }
  else
  {
LABEL_26:
    __break(1u);
  }
}

uint64_t sub_18AD524A0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  unint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  char v40;
  unint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t result;
  _QWORD v55[2];
  char *v56;
  uint64_t v57;
  void *v58;
  unint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  void (*v62)(char *, unint64_t, uint64_t);
  _QWORD *v63;

  v1 = v0;
  v2 = sub_18AF4E5B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_18AD4A26C(MEMORY[0x1E0DEE9D8]);
  v11 = objc_msgSend(v0, sel_collectionView);
  if (!v11)
    goto LABEL_40;
  v12 = v11;
  v13 = objc_msgSend(v11, sel_indexPathsForVisibleItems);

  v14 = sub_18AF4FD34();
  v15 = *(_QWORD *)(v14 + 16);
  v16 = v2;
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, 1, 1, v2);
LABEL_33:
    v53 = v59;
LABEL_34:
    swift_bridgeObjectRelease();
    return v53;
  }
  v17 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v55[1] = v14;
  v56 = v6;
  v18 = v14 + v17;
  v19 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v61 = *(_QWORD *)(v3 + 72);
  v62 = v19;
  v57 = v3;
  v58 = v1;
  v19(v10, v18, v2);
  while (1)
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v20(v10, 0, 1, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v16) == 1)
    {
      v53 = v59;
      goto LABEL_34;
    }
    v60 = v20;
    v21 = v10;
    v22 = v16;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v10, v16);
    v23 = objc_msgSend(v1, sel_collectionView);
    if (!v23)
      break;
    v24 = v23;
    v25 = (void *)sub_18AF4E558();
    v26 = objc_msgSend(v24, sel_cellForItemAtIndexPath_, v25);

    if (!v26)
      goto LABEL_5;
    type metadata accessor for CNAvatarPosterPairCollectionViewCell();
    v27 = swift_dynamicCastClass();
    if (!v27)
    {

LABEL_5:
      v16 = v22;
      goto LABEL_6;
    }
    v28 = v27;
    v29 = sub_18AF4E5A0();
    v30 = OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView;
    v31 = *(void **)(v28 + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView);
    if (!v31)
      goto LABEL_38;
    objc_msgSend(v31, sel_bounds);
    v33 = v32
        * *(double *)(v28
                    + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_maximumVerticalRevealFraction);
    v34 = 0.0;
    if (v33 > 0.0)
    {
      v35 = *(void **)(v28 + v30);
      if (!v35)
        goto LABEL_39;
      objc_msgSend(v35, sel_contentOffset);
      v37 = v36 / v33;
      if (v36 / v33 <= 0.0)
        v37 = 0.0;
      v34 = 1.0;
      if (v37 <= 1.0)
        v34 = v37;
    }
    v38 = v59;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v63 = (_QWORD *)v38;
    v41 = sub_18AD48D84(v29);
    v42 = *(_QWORD *)(v38 + 16);
    v43 = (v40 & 1) == 0;
    v44 = v42 + v43;
    if (__OFADD__(v42, v43))
    {
      __break(1u);
LABEL_36:
      __break(1u);
      break;
    }
    v45 = v40;
    if (*(_QWORD *)(v38 + 24) >= v44)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_18AD53FB8();
    }
    else
    {
      sub_18AD53510(v44, isUniquelyReferenced_nonNull_native);
      v46 = sub_18AD48D84(v29);
      if ((v45 & 1) != (v47 & 1))
        goto LABEL_41;
      v41 = v46;
    }
    v16 = v22;
    v48 = v63;
    v59 = (unint64_t)v63;
    if ((v45 & 1) != 0)
    {
      *(double *)(v63[7] + 8 * v41) = v34;
    }
    else
    {
      v63[(v41 >> 6) + 8] |= 1 << v41;
      v49 = 8 * v41;
      *(_QWORD *)(v48[6] + v49) = v29;
      *(double *)(v48[7] + v49) = v34;
      v50 = v48[2];
      v51 = __OFADD__(v50, 1);
      v52 = v50 + 1;
      if (v51)
        goto LABEL_36;
      v48[2] = v52;
    }

    swift_bridgeObjectRelease();
    v3 = v57;
    v1 = v58;
    v6 = v56;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v16);
    v18 += v61;
    --v15;
    v10 = v21;
    if (!v15)
    {
      v60(v21, 1, 1, v16);
      goto LABEL_33;
    }
    v62(v21, v18, v16);
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_18AF50454();
  __break(1u);
  return result;
}

void sub_18AD528DC()
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
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18AF4E5B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD4FF70(v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_18ACCDE68((uint64_t)v5, (uint64_t *)&unk_1EDF99400);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
    v11 = objc_msgSend(v0, sel_collectionView);
    if (!v11)
    {
LABEL_16:
      __break(1u);
      return;
    }
    v12 = v11;
    v13 = (void *)sub_18AF4E558();
    v14 = objc_msgSend(v12, sel_cellForItemAtIndexPath_, v13);

    if (v14)
    {
      type metadata accessor for CNAvatarPosterPairCollectionViewCell();
      v15 = swift_dynamicCastClass();
      if (v15)
      {
        *(_BYTE *)(v15 + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_showShadow) = 0;
        sub_18ACEABF0();
      }

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v16 = objc_msgSend(v1, sel_collectionView);
  if (!v16)
  {
    __break(1u);
    goto LABEL_16;
  }
  v17 = v16;
  v18 = (void *)sub_18AF4E558();
  v19 = objc_msgSend(v17, sel_cellForItemAtIndexPath_, v18);

  if (v19)
  {
    type metadata accessor for CNAvatarPosterPairCollectionViewCell();
    v20 = swift_dynamicCastClass();
    if (v20)
    {
      *(_BYTE *)(v20 + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_showShadow) = 1;
      sub_18ACEABF0();
    }

  }
}

uint64_t sub_18AD52B68@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4EB94();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18AD52BE4(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18AF4E9A8();
  v3 = v2;
  return sub_18AF4EBA0();
}

uint64_t sub_18AD52C58(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95550);
  v6 = sub_18AF5034C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_18ACD18D4((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_18ACD1898(v25, (uint64_t)&v38);
      sub_18ACB8738(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_18AF50190();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_18ACD18D4(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18AD52F6C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A700);
  v6 = sub_18AF5034C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      sub_18AF4E9A8();
    }
    result = sub_18AF50010();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18AD53240(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF98AD0);
  v6 = sub_18AF5034C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_18AF50010();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18AD53510(uint64_t a1, char a2)
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
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A5D0);
  result = sub_18AF5034C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_18AF504A8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_18AD537B8(uint64_t a1, char a2)
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
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98050);
  result = sub_18AF5034C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v30 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v29 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v19 >= v29)
          goto LABEL_33;
        v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v29)
            goto LABEL_33;
          v20 = v30[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v30 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_42;
                if (v8 >= v29)
                  goto LABEL_33;
                v20 = v30[v8];
                ++v21;
                if (v20)
                  goto LABEL_30;
              }
            }
            v8 = v21;
          }
        }
LABEL_30:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v26 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v18);
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0)
        sub_18AF4E9A8();
      sub_18AF504B4();
      sub_18AF504C0();
      result = sub_18AF504E4();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v24 = v15 == v23;
          if (v15 == v23)
            v15 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v26;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v16) = v27;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

void *sub_18AD53A88()
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
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95550);
  v2 = *v0;
  v3 = sub_18AF50340();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_18ACD1898(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_18ACB8738(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_18ACD18D4(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_18AD53C6C()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A700);
  v2 = *v0;
  v3 = sub_18AF50340();
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)sub_18AF4E9A8();
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

id sub_18AD53E14()
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
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF98AD0);
  v2 = *v0;
  v3 = sub_18AF50340();
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

void *sub_18AD53FB8()
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
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A5D0);
  v2 = *v0;
  v3 = sub_18AF50340();
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
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
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

void *sub_18AD54144()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98050);
  v2 = *v0;
  v3 = sub_18AF50340();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)sub_18AF4E9A8();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t (*sub_18AD542E4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_18AD5438C(v6, a2, a3);
  return sub_18AD35C74;
}

uint64_t (*sub_18AD54338(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_18AD543F8(v6, a2, a3);
  return sub_18AD35C74;
}

uint64_t (*sub_18AD5438C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x18D776384](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for ContactAvatarView;
  }
  __break(1u);
  return result;
}

void (*sub_18AD543F8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x18D776384](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for CNAvatarPosterPair.Poster;
  }
  __break(1u);
  return result;
}

uint64_t sub_18AD5446C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_18AD54490()
{
  swift_release();
  return swift_deallocObject();
}

void sub_18AD544B4()
{
  uint64_t v0;

  sub_18AD5181C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_18AD544BC()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

void sub_18AD544E4()
{
  sub_18AF4E2D0();
  __break(1u);
}

unint64_t sub_18AD54500()
{
  unint64_t result;

  result = qword_1EDF9A698;
  if (!qword_1EDF9A698)
  {
    result = MEMORY[0x18D777800](MEMORY[0x1E0DC1948], MEMORY[0x1E0DC1958]);
    atomic_store(result, (unint64_t *)&qword_1EDF9A698);
  }
  return result;
}

void sub_18AD54544()
{
  sub_18AD54500();
  sub_18AF4E414();
  __break(1u);
}

uint64_t sub_18AD54568()
{
  return 8;
}

uint64_t sub_18AD54574()
{
  return swift_release();
}

uint64_t sub_18AD5457C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_18AD5458C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9A6A0);
  return sub_18AF4FBC0();
}

_QWORD *sub_18AD545D0(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_18AD545DC(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4ED70(a1, v1);
}

void sub_18AD545E4(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4F2F4(a1, v1);
}

void sub_18AD545EC(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4F3F8(a1, v1);
}

void sub_18AD545F4(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4EF10(a1, v1);
}

uint64_t sub_18AD545FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_18AD54620()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_presentationDidFinishAnimated_, 1);
}

void sub_18AD54634(unint64_t a1)
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
    sub_18AF4E9A8();
    v5 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9A6E0);
      v3 = sub_18AF501CC();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      sub_18AF4E9A8();
      v4 = sub_18AF50328();
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
  v3 = MEMORY[0x1E0DEE9E8];
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
        v8 = MEMORY[0x18D776384](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_18AF50010();
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
      sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF9A6D0);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_18AF5001C();

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
          v21 = sub_18AF5001C();

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
    v26 = sub_18AF50010();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF9A6D0);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_18AF5001C();

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
        v36 = sub_18AF5001C();

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

void sub_18AD54990()
{
  sub_18AD2D4B8();
}

uint64_t sub_18AD54998()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_18AD549C4(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4D354(a1, *(_QWORD *)(v1 + 16), *(_BYTE **)(v1 + 24));
}

char *sub_18AD549CC(uint64_t a1)
{
  uint64_t v1;

  return sub_18AD4D448(a1, v1);
}

id sub_18AD549D4()
{
  uint64_t v0;

  return sub_18ACEABC8(*(_QWORD *)(v0 + 16));
}

void sub_18AD549DC()
{
  _BYTE *v0;
  _QWORD *v1;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration] = 0;
  v1 = &v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_activePosterSnapshotKeepActiveAssertionReason];
  *v1 = 0;
  v1[1] = 0;
  v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_needsReload] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControlPreferredNumberOfVisibleIndicators] = 5;
  v0[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling] = 0;

  sub_18AF50310();
  __break(1u);
}

void sub_18AD54ACC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v1 = (char *)sub_18AD501B8();
  if (v1)
  {
    if (v1[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_type] != 3)
    {
      v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_mode);
      if (v2 == 1)
      {
        v3 = &OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_poster;
LABEL_7:
        if (*(_QWORD *)&v1[*v3] == 1)
          goto LABEL_8;
        v7 = v1;
        v5 = v1[OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_isRecentUsedAsContactPair];
        v6 = (void *)MEMORY[0x18D7779A4](v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
        if (v5 == 1)
        {
          if (v6)
          {
            objc_msgSend(v6, sel_avatarPosterPairCollectionDidTapDismiss);
LABEL_18:

            goto LABEL_11;
          }
        }
        else if (v6)
        {
          objc_msgSend(v6, sel_avatarPosterPairCollectionDidConfirmSelection);
          goto LABEL_18;
        }

        return;
      }
      if (!v2)
      {
        v3 = &OBJC_IVAR____TtC10ContactsUI18CNAvatarPosterPair_avatar;
        goto LABEL_7;
      }
    }
LABEL_8:

  }
  v4 = (void *)MEMORY[0x18D7779A4](v0 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
  if (v4)
  {
    objc_msgSend(v4, sel_avatarPosterPairCollectionDidSelectCreateNew);
LABEL_11:
    swift_unknownObjectRelease();
  }
}

uint64_t sub_18AD54C08(double *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  CGFloat v20;
  double v21;
  char *v22;
  char *v23;
  double v24;
  double v25;
  double v26;
  void *v29;
  void *v30;
  char *v31;
  uint64_t v32;

  v8 = v2;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF99400);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18AF4E5B8();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a1;
  v20 = a1[1];
  if (*a1 == 0.0)
    goto LABEL_21;
  v4 = *(char **)(v8 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout);
  v6 = *(double *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemSize];
  v5 = (double *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds];
  v7 = *(double *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds + 16];
  v22 = &v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_cachedAttributes];
  swift_beginAccess();
  if (*(_QWORD *)v22 >> 62)
  {
    v32 = v16;
    v31 = v4;
    sub_18AF4E9A8();
    v3 = sub_18AF50328();
    swift_bridgeObjectRelease();
    if ((v3 & 0x8000000000000000) == 0)
      goto LABEL_32;
    __break(1u);
    goto LABEL_30;
  }
  v3 = *(_QWORD *)((*(_QWORD *)v22 & 0xFFFFFFFFFFFFF8) + 0x10);
  v23 = v4;
  if (v3)
    goto LABEL_4;
LABEL_13:
  v24 = 0.0;
  if (fabs(a2) < 0.05)
  {
LABEL_14:
    if (vabdd_f64(v24, v21) < vabdd_f64(v7, v21))
      goto LABEL_20;
LABEL_15:
    a2 = v5[2];

    if (a2 - v6 >= v7)
      v21 = v7;
    else
      v21 = a2 - v6;
    goto LABEL_21;
  }
  while (1)
  {
    if (a2 >= 0.0)
      goto LABEL_15;
LABEL_20:

    v21 = v24;
LABEL_21:
    *a1 = v21;
    a1[1] = v20;
    sub_18AD4FB54((uint64_t)v14, v21, v20);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
      return sub_18ACCDE68((uint64_t)v14, (uint64_t *)&unk_1EDF99400);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v14, v15);
    sub_18AD528DC();
    a1 = (double *)sub_18AF4E5A0();
    v14 = (char *)OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl;
    v29 = *(void **)(v8 + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl);
    if (v29)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    v16 = v32;
    if (!v3)
      goto LABEL_13;
LABEL_4:
    v24 = 0.0;
    while (1)
    {
      v25 = v3 == 1
          ? *(double *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing]
          * 0.5
          : *(double *)&v4[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_minimumInterimSpacing];
      v26 = v24 + v6 + v25;
      if (v21 < v26 && v26 < v7)
        break;
      v24 = v26;
      if (!--v3)
        goto LABEL_13;
    }
    v7 = v26;
    if (fabs(a2) < 0.05)
      goto LABEL_14;
  }
  if (objc_msgSend(v29, sel_currentPage) == a1)
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  v30 = *(void **)&v14[v8];
  if (!v30)
    goto LABEL_31;
  objc_msgSend(v30, sel_setCurrentPage_, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
}

uint64_t sub_18AD54F14()
{
  id *v0;

  return swift_deallocObject();
}

void sub_18AD54F48()
{
  uint64_t v0;

  sub_18AD4C608(*(char **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_18AD54F54()
{
  return swift_deallocObject();
}

uint64_t sub_18AD54F64(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_18ACBE1B0(255, a2);
    result = MEMORY[0x18D777800](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_18AD54FA4(uint64_t a1)
{
  uint64_t v1;

  sub_18AD4BCAC(a1, v1);
}

char *sub_18AD54FAC(uint64_t a1)
{
  uint64_t v1;

  return sub_18AD4B318(a1, *(void **)(v1 + 16));
}

uint64_t sub_18AD54FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98DD8) - 8) + 80);
  v2 = (v1 + 24) & ~v1;
  swift_release();
  v3 = sub_18AF4E504();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

unint64_t sub_18AD55054()
{
  uint64_t v0;

  return sub_18AD4DD78(v0);
}

uint64_t destroy for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v8 = *(void **)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v8;
  *(_QWORD *)(a1 + 80) = v7;
  swift_retain();
  swift_retain();
  sub_18AF4E9A8();
  swift_retain();
  swift_retain();
  sub_18AF4E9A8();
  v9 = v8;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 72);
  v5 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNWallpaperSuggestionsGalleryNameTextFieldView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNWallpaperSuggestionsGalleryNameTextFieldView()
{
  return &type metadata for CNWallpaperSuggestionsGalleryNameTextFieldView;
}

uint64_t sub_18AD55424()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18AD55434@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t *v39;
  uint64_t v41;

  v4 = sub_18AF4EE7C();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (_OWORD *)((char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A708);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A710);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A718);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (uint64_t *)((char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v19 = sub_18AF4F974();
  v19[1] = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A720);
  sub_18AD556D4(a1, (uint64_t)v19 + *(int *)(v21 + 44));
  v22 = (char *)v7 + *(int *)(v4 + 20);
  v23 = *MEMORY[0x1E0CDB0C0];
  v24 = sub_18AF4F0BC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v22, v23, v24);
  __asm { FMOV            V0.2D, #10.0 }
  *v7 = _Q0;
  v30 = objc_msgSend((id)objc_opt_self(), sel_systemGray6Color);
  v31 = MEMORY[0x18D775844](v30);
  sub_18AD56CC0((uint64_t)v7, (uint64_t)v11);
  *(_QWORD *)&v11[*(int *)(v8 + 52)] = v31;
  *(_WORD *)&v11[*(int *)(v8 + 56)] = 256;
  sub_18ACDF144((uint64_t)v7);
  v32 = sub_18AF4F974();
  v34 = v33;
  v35 = (uint64_t)&v15[*(int *)(v12 + 36)];
  sub_18ACCDEA4((uint64_t)v11, v35, &qword_1EDF9A708);
  v36 = (uint64_t *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A728) + 36));
  *v36 = v32;
  v36[1] = v34;
  sub_18ACCDEA4((uint64_t)v19, (uint64_t)v15, &qword_1EDF9A718);
  sub_18ACCDE68((uint64_t)v11, &qword_1EDF9A708);
  sub_18ACCDE68((uint64_t)v19, &qword_1EDF9A718);
  v37 = sub_18AF4F6EC();
  KeyPath = swift_getKeyPath();
  sub_18ACCDEA4((uint64_t)v15, a2, &qword_1EDF9A710);
  v39 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A730) + 36));
  *v39 = KeyPath;
  v39[1] = v37;
  return sub_18ACCDE68((uint64_t)v15, &qword_1EDF9A710);
}

uint64_t sub_18AD556D4@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unsigned __int8 v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __n128 v71;
  void (*v72)(char *, char *, uint64_t, __n128);
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v77;
  char *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;

  v82 = a2;
  v80 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A738);
  MEMORY[0x1E0C80A78](v80, v3);
  v5 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = v4;
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v77 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A740);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A748);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A750);
  MEMORY[0x1E0C80A78](v18, v19);
  v21 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v21 = sub_18AF4F0E0();
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 1;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A758);
  sub_18AD55BE0(a1, (uint64_t)&v21[*(int *)(v22 + 44)]);
  LOBYTE(a1) = sub_18AF4F38C();
  sub_18AF4EC24();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  sub_18ACCDEA4((uint64_t)v21, (uint64_t)v17, &qword_1EDF9A750);
  v31 = &v17[*(int *)(v14 + 36)];
  *v31 = (char)a1;
  *((_QWORD *)v31 + 1) = v24;
  *((_QWORD *)v31 + 2) = v26;
  *((_QWORD *)v31 + 3) = v28;
  *((_QWORD *)v31 + 4) = v30;
  v31[40] = 0;
  sub_18ACCDE68((uint64_t)v21, &qword_1EDF9A750);
  LOBYTE(v14) = sub_18AF4F398();
  sub_18AF4EC24();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_18ACCDEA4((uint64_t)v17, (uint64_t)v13, &qword_1EDF9A748);
  v40 = &v13[*(int *)(v10 + 36)];
  *v40 = v14;
  *((_QWORD *)v40 + 1) = v33;
  *((_QWORD *)v40 + 2) = v35;
  *((_QWORD *)v40 + 3) = v37;
  *((_QWORD *)v40 + 4) = v39;
  v40[40] = 0;
  sub_18ACCDE68((uint64_t)v17, &qword_1EDF9A748);
  LOBYTE(v10) = sub_18AF4F3A4();
  v41 = sub_18AF4F3BC();
  v42 = sub_18AF4F3B0();
  sub_18AF4F3B0();
  if (sub_18AF4F3B0() != v10)
    v42 = sub_18AF4F3B0();
  sub_18AF4F3B0();
  if (sub_18AF4F3B0() != v41)
    v42 = sub_18AF4F3B0();
  sub_18AF4EC24();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  sub_18ACCDEA4((uint64_t)v13, (uint64_t)v9, &qword_1EDF9A740);
  v51 = &v9[*((int *)v80 + 9)];
  *v51 = v42;
  *((_QWORD *)v51 + 1) = v44;
  *((_QWORD *)v51 + 2) = v46;
  *((_QWORD *)v51 + 3) = v48;
  *((_QWORD *)v51 + 4) = v50;
  v51[40] = 0;
  sub_18ACCDE68((uint64_t)v13, &qword_1EDF9A740);
  sub_18AD578D8((uint64_t)v9, (uint64_t)v5);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A760);
  v80 = &v77;
  v53 = *(_QWORD *)(v52 - 8);
  v54 = *(_QWORD *)(v53 + 64);
  MEMORY[0x1E0C80A78](v52, v55);
  v56 = (char *)&v77 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = &v77;
  MEMORY[0x1E0C80A78](v57, v58);
  v59 = sub_18AF4F8E4();
  v77 = (uint64_t)&v77;
  v78 = v5;
  v60 = *(_QWORD *)(v59 - 8);
  MEMORY[0x1E0C80A78](v59, v61);
  v63 = (char *)&v77 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4F8D8();
  sub_18AF4F3A4();
  sub_18AD57920();
  sub_18AF4F590();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v59);
  v64 = (*(uint64_t (**)(char *, char *, uint64_t))(v53 + 32))(v56, v56, v52);
  v79 = &v77;
  MEMORY[0x1E0C80A78](v64, v65);
  v67 = (char *)&v77 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = (uint64_t)v78;
  v69 = sub_18ACCDEA4((uint64_t)v78, (uint64_t)v67, &qword_1EDF9A738);
  v71 = MEMORY[0x1E0C80A78](v69, v70);
  v72 = *(void (**)(char *, char *, uint64_t, __n128))(v53 + 16);
  v72(v56, v56, v52, v71);
  v73 = v82;
  sub_18ACCDEA4((uint64_t)v67, v82, &qword_1EDF9A738);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A768);
  ((void (*)(uint64_t, char *, uint64_t))v72)(v73 + *(int *)(v74 + 48), v56, v52);
  v75 = *(void (**)(char *, uint64_t))(v53 + 8);
  v75(v56, v52);
  sub_18ACCDE68(v68, &qword_1EDF9A738);
  v75(v56, v52);
  return sub_18ACCDE68((uint64_t)v67, &qword_1EDF9A738);
}

uint64_t sub_18AD55BE0@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  char *v16;
  uint64_t (*v17)(char *, char *, uint64_t, __n128);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  char *v24;
  uint64_t *v25;
  void (*v26)(char *, char *, uint64_t, __n128);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  char *v51;
  uint64_t (*v52)(char *, char *, uint64_t, __n128);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __n128 v56;
  uint64_t *v57;
  void (*v58)(char *, char *, uint64_t, __n128);
  char *v59;
  void (*v60)(char *, uint64_t);
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;

  v77 = a2;
  if ((*a1 & 1) != 0)
  {
    v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A778);
    v37 = *(_QWORD **)(v68 - 8);
    v38 = v37[8];
    MEMORY[0x1E0C80A78](v68, v39);
    v40 = (v38 + 15) & 0xFFFFFFFFFFFFFFF0;
    v71 = (char *)&v66 - v40;
    sub_18AD561A4((uint64_t)&v66 - v40);
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A770);
    v76 = &v66;
    v67 = *(uint64_t **)(v41 - 8);
    v42 = v67[8];
    MEMORY[0x1E0C80A78](v41, v43);
    v44 = (char *)&v66 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    v70 = v44;
    sub_18AD56614((uint64_t)v44);
    v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A798);
    v75 = &v66;
    MEMORY[0x1E0C80A78](v73, v45);
    v47 = (char *)&v66 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    v74 = &v66;
    v50 = MEMORY[0x1E0C80A78](v48, v49);
    v51 = (char *)&v66 - v40;
    v52 = (uint64_t (*)(char *, char *, uint64_t, __n128))v37[2];
    v53 = v68;
    v54 = v52((char *)&v66 - v40, (char *)&v66 - v40, v68, v50);
    v72 = &v66;
    v56 = MEMORY[0x1E0C80A78](v54, v55);
    v57 = v67;
    v58 = (void (*)(char *, char *, uint64_t, __n128))v67[2];
    v58(v44, v44, v41, v56);
    ((void (*)(char *, char *, uint64_t))v52)(v47, v51, v53);
    v59 = &v47[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7B0) + 48)];
    v69 = v41;
    ((void (*)(char *, char *, uint64_t))v58)(v59, v44, v41);
    v60 = (void (*)(char *, uint64_t))v57[1];
    v60(v44, v41);
    v61 = (void (*)(char *, uint64_t))v37[1];
    v61(v51, v53);
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A790);
    v67 = &v66;
    MEMORY[0x1E0C80A78](v62, v63);
    sub_18ACCDEA4((uint64_t)v47, (uint64_t)&v66 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EDF9A798);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A780);
    v65 = MEMORY[0x1E0CE0680];
    sub_18ACBC6F4(&qword_1EDF9A7A0, &qword_1EDF9A798, MEMORY[0x1E0CE0680]);
    sub_18ACBC6F4(&qword_1EDF9A7A8, &qword_1EDF9A780, v65);
    sub_18AF4F1D0();
    sub_18ACCDE68((uint64_t)v47, &qword_1EDF9A798);
    v60(v70, v69);
    return ((uint64_t (*)(char *, uint64_t))v61)(v71, v53);
  }
  else
  {
    v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A770);
    v2 = *(_QWORD **)(v68 - 8);
    v3 = v2[8];
    MEMORY[0x1E0C80A78](v68, v4);
    v5 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
    v71 = (char *)&v66 - v5;
    sub_18AD56614((uint64_t)&v66 - v5);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A778);
    v76 = &v66;
    v67 = *(uint64_t **)(v6 - 8);
    v7 = v67[8];
    MEMORY[0x1E0C80A78](v6, v8);
    v9 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v70 = v9;
    sub_18AD561A4((uint64_t)v9);
    v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A780);
    v75 = &v66;
    MEMORY[0x1E0C80A78](v73, v10);
    v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v74 = &v66;
    v15 = MEMORY[0x1E0C80A78](v13, v14);
    v16 = (char *)&v66 - v5;
    v17 = (uint64_t (*)(char *, char *, uint64_t, __n128))v2[2];
    v18 = (char *)&v66 - v5;
    v19 = (char *)&v66 - v5;
    v20 = v68;
    v21 = v17(v18, v19, v68, v15);
    v72 = &v66;
    v23 = MEMORY[0x1E0C80A78](v21, v22);
    v24 = v9;
    v25 = v67;
    v26 = (void (*)(char *, char *, uint64_t, __n128))v67[2];
    v26(v9, v9, v6, v23);
    v27 = v20;
    ((void (*)(char *, char *, uint64_t))v17)(v12, v16, v20);
    v28 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A788) + 48)];
    v29 = v6;
    v69 = v6;
    ((void (*)(char *, char *, uint64_t))v26)(v28, v24, v6);
    v30 = (void (*)(char *, uint64_t))v25[1];
    v30(v24, v29);
    v31 = (void (*)(char *, uint64_t))v2[1];
    v31(v16, v27);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A790);
    MEMORY[0x1E0C80A78](v32, v33);
    sub_18ACCDEA4((uint64_t)v12, (uint64_t)&v66 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EDF9A780);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A798);
    v35 = MEMORY[0x1E0CE0680];
    sub_18ACBC6F4(&qword_1EDF9A7A0, &qword_1EDF9A798, MEMORY[0x1E0CE0680]);
    sub_18ACBC6F4(&qword_1EDF9A7A8, &qword_1EDF9A780, v35);
    sub_18AF4F1D0();
    sub_18ACCDE68((uint64_t)v12, &qword_1EDF9A780);
    v30(v70, v69);
    return ((uint64_t (*)(char *, uint64_t))v31)(v71, v27);
  }
}

uint64_t sub_18AD561A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t *v27;
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
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;

  v2 = v1;
  v64 = a1;
  v3 = sub_18AF4FC2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7B8);
  MEMORY[0x1E0C80A78](v63, v8);
  v62 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7C0);
  MEMORY[0x1E0C80A78](v61, v10);
  v60 = (uint64_t)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7C8);
  MEMORY[0x1E0C80A78](v59, v12);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D0);
  v15 = *(_QWORD *)(v58 - 8);
  MEMORY[0x1E0C80A78](v58, v16);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4FBE4();
  v19 = sub_18ACC13F4((uint64_t)v7, MEMORY[0x1E0DEE9D8]);
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v22 = *(_OWORD *)(v2 + 24);
  v65 = *(_OWORD *)(v2 + 8);
  v66 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D8);
  sub_18AF4F8CC();
  v67 = v19;
  v68 = v21;
  sub_18ACB7660();
  sub_18AF4F9C8();
  v23 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v24 = MEMORY[0x18D775844](v23);
  KeyPath = swift_getKeyPath();
  v26 = v58;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v14, v18, v58);
  v27 = (uint64_t *)&v14[*(int *)(v59 + 36)];
  *v27 = KeyPath;
  v27[1] = v24;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v26);
  LOBYTE(v24) = sub_18AF4F38C();
  sub_18AF4EC24();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = v60;
  sub_18ACCDEA4((uint64_t)v14, v60, &qword_1EDF9A7C8);
  v37 = v36 + *(int *)(v61 + 36);
  *(_BYTE *)v37 = v24;
  *(_QWORD *)(v37 + 8) = v29;
  *(_QWORD *)(v37 + 16) = v31;
  *(_QWORD *)(v37 + 24) = v33;
  *(_QWORD *)(v37 + 32) = v35;
  *(_BYTE *)(v37 + 40) = 0;
  sub_18ACCDE68((uint64_t)v14, &qword_1EDF9A7C8);
  LOBYTE(v14) = sub_18AF4F398();
  sub_18AF4EC24();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = v62;
  sub_18ACCDEA4(v36, v62, &qword_1EDF9A7C0);
  v47 = v46 + *(int *)(v63 + 36);
  *(_BYTE *)v47 = (_BYTE)v14;
  *(_QWORD *)(v47 + 8) = v39;
  *(_QWORD *)(v47 + 16) = v41;
  *(_QWORD *)(v47 + 24) = v43;
  *(_QWORD *)(v47 + 32) = v45;
  *(_BYTE *)(v47 + 40) = 0;
  sub_18ACCDE68(v36, &qword_1EDF9A7C0);
  v48 = swift_allocObject();
  v49 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v48 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v48 + 64) = v49;
  *(_OWORD *)(v48 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v48 + 96) = *(_QWORD *)(v2 + 80);
  v50 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v48 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v48 + 32) = v50;
  v51 = sub_18AF4EDEC();
  v52 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51, v53);
  v55 = (char *)&v57 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD56C3C(v2);
  sub_18AF4EDE0();
  sub_18ACD6098(&qword_1EDF9A7E0, &qword_1EDF9A7B8, sub_18AD57974, MEMORY[0x1E0CD9758]);
  sub_18AF4F68C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
  return sub_18ACCDE68(v46, &qword_1EDF9A7B8);
}

uint64_t sub_18AD56614@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t *v25;
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
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v2 = v1;
  v50 = a1;
  v3 = sub_18AF4FC2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7C0);
  MEMORY[0x1E0C80A78](v49, v8);
  v48 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7C8);
  MEMORY[0x1E0C80A78](v47, v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D0);
  v13 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46, v14);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4FBE4();
  v17 = sub_18ACC13F4((uint64_t)v7, MEMORY[0x1E0DEE9D8]);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v20 = *(_OWORD *)(v2 + 56);
  v51 = *(_OWORD *)(v2 + 40);
  v52 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D8);
  sub_18AF4F8CC();
  v53 = v17;
  v54 = v19;
  sub_18ACB7660();
  sub_18AF4F9C8();
  v21 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  v22 = MEMORY[0x18D775844](v21);
  KeyPath = swift_getKeyPath();
  v24 = v46;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v12, v16, v46);
  v25 = (uint64_t *)&v12[*(int *)(v47 + 36)];
  *v25 = KeyPath;
  v25[1] = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v24);
  LOBYTE(v16) = sub_18AF4F38C();
  sub_18AF4EC24();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = v48;
  sub_18ACCDEA4((uint64_t)v12, v48, &qword_1EDF9A7C8);
  v35 = v34 + *(int *)(v49 + 36);
  *(_BYTE *)v35 = (_BYTE)v16;
  *(_QWORD *)(v35 + 8) = v27;
  *(_QWORD *)(v35 + 16) = v29;
  *(_QWORD *)(v35 + 24) = v31;
  *(_QWORD *)(v35 + 32) = v33;
  *(_BYTE *)(v35 + 40) = 0;
  sub_18ACCDE68((uint64_t)v12, &qword_1EDF9A7C8);
  v36 = swift_allocObject();
  v37 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v36 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v36 + 64) = v37;
  *(_OWORD *)(v36 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v36 + 96) = *(_QWORD *)(v2 + 80);
  v38 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v36 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v36 + 32) = v38;
  v39 = sub_18AF4EDEC();
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39, v41);
  v43 = (char *)&v45 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD56C3C(v2);
  sub_18AF4EDE0();
  sub_18AD57974();
  sub_18AF4F68C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v39);
  return sub_18ACCDE68(v34, &qword_1EDF9A7C0);
}

void sub_18AD569C0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95228);
  sub_18AF4F7E8();
  v2 = v7;
  v5 = *(_OWORD *)(a1 + 8);
  v6 = *(_OWORD *)(a1 + 24);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D8);
  MEMORY[0x18D775A24](&v7, v3);
  v4 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setGivenName_, v4, v5, v6);

}

void sub_18AD56A68(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95228);
  sub_18AF4F7E8();
  v2 = v7;
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 56);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A7D8);
  MEMORY[0x18D775A24](&v7, v3);
  v4 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setFamilyName_, v4, v5, v6);

}

uint64_t sub_18AD56B10@<X0>(uint64_t *a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v3 = sub_18AF4FC2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[3];
  v19 = v1[2];
  v20 = v8;
  v21 = v1[4];
  v22 = *((_QWORD *)v1 + 10);
  v9 = v1[1];
  v17 = *v1;
  v18 = v9;
  sub_18AF4FBE4();
  v10 = sub_18ACC13F4((uint64_t)v7, MEMORY[0x1E0DEE9D8]);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v13 = swift_allocObject();
  v14 = v20;
  *(_OWORD *)(v13 + 48) = v19;
  *(_OWORD *)(v13 + 64) = v14;
  *(_OWORD *)(v13 + 80) = v21;
  *(_QWORD *)(v13 + 96) = v22;
  v15 = v18;
  *(_OWORD *)(v13 + 16) = v17;
  *(_OWORD *)(v13 + 32) = v15;
  *a1 = v10;
  a1[1] = v12;
  a1[2] = (uint64_t)sub_18AD56C34;
  a1[3] = v13;
  return sub_18AD56C3C((uint64_t)&v17);
}

uint64_t sub_18AD56C34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18AD55434((_BYTE *)(v1 + 16), a1);
}

uint64_t sub_18AD56C3C(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_18AF4E9A8();
  swift_retain();
  swift_retain();
  sub_18AF4E9A8();
  v3 = v2;
  return a1;
}

uint64_t sub_18AD56CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_18AF4EE7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18AD56D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v58 = a3;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95190);
  MEMORY[0x1E0C80A78](v50, v5);
  v7 = (uint64_t *)((char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF951B8);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94F08);
  MEMORY[0x1E0C80A78](v49, v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95008);
  MEMORY[0x1E0C80A78](v53, v15);
  v51 = (uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF951C0);
  v56 = *(_QWORD *)(v17 - 8);
  v57 = v17;
  MEMORY[0x1E0C80A78](v17, v18);
  v52 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94F18);
  MEMORY[0x1E0C80A78](v55, v20);
  v54 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = a1;
  v60 = a2;
  sub_18ACB7660();
  sub_18AF4E9A8();
  v22 = sub_18AF4F518();
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  v29 = *MEMORY[0x1E0CDDC08];
  v30 = sub_18AF4F4E8();
  v31 = *(_QWORD *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 104))(v11, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v11, 0, 1, v30);
  KeyPath = swift_getKeyPath();
  sub_18ACCDEA4((uint64_t)v11, (uint64_t)v7 + *(int *)(v50 + 28), &qword_1EDF951B8);
  *v7 = KeyPath;
  sub_18ACCDEA4((uint64_t)v7, (uint64_t)&v14[*(int *)(v49 + 36)], &qword_1EDF95190);
  *(_QWORD *)v14 = v22;
  *((_QWORD *)v14 + 1) = v24;
  v14[16] = v28;
  *((_QWORD *)v14 + 3) = v26;
  sub_18ACD5BB4(v22, v24, v28);
  sub_18AF4E9A8();
  sub_18ACCDE68((uint64_t)v7, &qword_1EDF95190);
  sub_18ACCDE68((uint64_t)v11, &qword_1EDF951B8);
  sub_18ACD5A1C(v22, v24, v28);
  swift_bridgeObjectRelease();
  v33 = sub_18AF4F494();
  v34 = swift_getKeyPath();
  v35 = v51;
  sub_18ACCDEA4((uint64_t)v14, v51, &qword_1EDF94F08);
  v36 = (uint64_t *)(v35 + *(int *)(v53 + 36));
  *v36 = v34;
  v36[1] = v33;
  sub_18ACCDE68((uint64_t)v14, &qword_1EDF94F08);
  sub_18AF4F434();
  sub_18AD02A18();
  v37 = v52;
  sub_18AF4F548();
  sub_18ACCDE68(v35, &qword_1EDF95008);
  v38 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v39 = MEMORY[0x18D775844](v38);
  v40 = swift_getKeyPath();
  v41 = v56;
  v42 = (uint64_t)v54;
  v43 = v37;
  v44 = v37;
  v45 = v57;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v54, v43, v57);
  v46 = (uint64_t *)(v42 + *(int *)(v55 + 36));
  *v46 = v40;
  v46[1] = v39;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v45);
  v47 = v58;
  sub_18ACCDEA4(v42, v58, &qword_1EDF94F18);
  *(_WORD *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95018) + 36)) = 256;
  return sub_18ACCDE68(v42, &qword_1EDF94F18);
}

uint64_t sub_18AD57130@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_18AD56D04(*v1, v1[1], a1);
}

uint64_t sub_18AD57140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t);
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
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v31 = a3;
  v32 = a4;
  v29 = a1;
  v30 = a2;
  v33 = a7;
  v9 = type metadata accessor for CNWallpaperSuggestionsGallerySection.TitleView(255, a5, a6, a4);
  v10 = sub_18AF4EE40();
  v42[0] = MEMORY[0x18D777800](&unk_18AF8A680, v9);
  v42[1] = MEMORY[0x1E0CD9758];
  v41[0] = v10;
  v41[1] = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v10, v42);
  MEMORY[0x18D7777AC](255, v41, MEMORY[0x1E0CDE260], 0);
  swift_getTupleTypeMetadata2();
  v11 = sub_18AF4F9D4();
  MEMORY[0x18D777800](MEMORY[0x1E0CE0680], v11);
  v12 = sub_18AF4F890();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v28 - v15;
  v17 = sub_18AF4EE40();
  v28 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21, v22);
  v24 = (char *)&v28 - v23;
  sub_18AF4F0EC();
  v34 = a5;
  v35 = a6;
  v36 = v29;
  v37 = v30;
  v38 = v31;
  v39 = v32;
  sub_18AF4F884();
  sub_18AF4F974();
  v27 = MEMORY[0x18D777800](MEMORY[0x1E0CDFCC0], v12);
  sub_18AF4F644();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  v40[0] = v27;
  v40[1] = MEMORY[0x1E0CDA228];
  MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v17, v40);
  sub_18ACE2D80((uint64_t)v20, v17, (uint64_t)v24);
  v25 = *(void (**)(char *, uint64_t))(v28 + 8);
  v25(v20, v17);
  sub_18ACE05FC((uint64_t)v24, v17, v33);
  return ((uint64_t (*)(char *, uint64_t))v25)(v24, v17);
}

uint64_t sub_18AD57418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  __int128 v63;
  __int128 v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  __int128 v70;
  char v71;
  _QWORD v72[3];

  v52 = a4;
  v53 = a3;
  v7 = a1;
  v57 = a6;
  v54 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v51 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v55 = (uint64_t)&v47 - v11;
  v50 = v12;
  v56 = v13;
  v15 = type metadata accessor for CNWallpaperSuggestionsGallerySection.TitleView(255, v12, v13, v14);
  v16 = sub_18AF4EE40();
  v72[0] = MEMORY[0x18D777800](&unk_18AF8A680, v15);
  v72[1] = MEMORY[0x1E0CD9758];
  v17 = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v16, v72);
  v66 = v16;
  v67 = v17;
  v18 = MEMORY[0x18D7777AC](0, &v66, MEMORY[0x1E0CDE260], 0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18, v20);
  v49 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v47 - v24;
  MEMORY[0x1E0C80A78](v26, v27);
  v29 = (char *)&v47 - v28;
  v60 = v7;
  v61 = a2;
  sub_18AF4E9A8();
  sub_18AF4F38C();
  swift_checkMetadataState();
  sub_18AF4F668();
  swift_bridgeObjectRelease();
  v60 = v66;
  v61 = v67;
  v62 = v68;
  v63 = v69;
  v64 = v70;
  v65 = v71;
  LOBYTE(v7) = sub_18AF4F3A4();
  v30 = sub_18AF4F3BC();
  sub_18AF4F3B0();
  sub_18AF4F3B0();
  if (sub_18AF4F3B0() != v7)
    sub_18AF4F3B0();
  sub_18AF4F3B0();
  if (sub_18AF4F3B0() != v30)
    sub_18AF4F3B0();
  v31 = swift_checkMetadataState();
  sub_18AF4F590();
  swift_bridgeObjectRelease();
  v66 = v31;
  v67 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v33 = v18;
  sub_18ACE2D80((uint64_t)v25, v18, (uint64_t)v29);
  v34 = v19;
  v48 = *(uint64_t (**)(char *, uint64_t))(v19 + 8);
  v35 = v48(v25, v18);
  v36 = (uint64_t)v51;
  v53(v35);
  v37 = v55;
  v38 = v50;
  v39 = v56;
  sub_18ACE2D80(v36, v50, v55);
  v40 = v54;
  v41 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
  v41(v36, v38);
  v42 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v43 = (uint64_t)v49;
  v42(v49, v29, v33);
  v66 = v43;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v36, v37, v38);
  v67 = v36;
  v60 = v33;
  v61 = v38;
  v58 = OpaqueTypeConformance2;
  v59 = v39;
  sub_18ACE0614(&v66, 2uLL, (uint64_t)&v60);
  v41(v37, v38);
  v44 = v29;
  v45 = (uint64_t (*)(uint64_t, uint64_t))v48;
  v48(v44, v33);
  v41(v36, v38);
  return v45(v43, v33);
}

uint64_t sub_18AD57824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_18AD57140(*v2, v2[1], v2[2], v2[3], *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a2);
}

uint64_t sub_18AD57838@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EF0C();
  *a1 = result;
  return result;
}

uint64_t sub_18AD57860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EF0C();
  *a1 = result;
  return result;
}

uint64_t sub_18AD57888()
{
  swift_retain();
  return sub_18AF4EF18();
}

uint64_t sub_18AD578B0()
{
  swift_retain();
  return sub_18AF4EF18();
}

uint64_t sub_18AD578D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_18AD57920()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF99170;
  if (!qword_1EDF99170)
  {
    v1 = sub_18AF4F8E4();
    result = MEMORY[0x18D777800](MEMORY[0x1E0CDFE38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDF99170);
  }
  return result;
}

void sub_18AD5796C()
{
  uint64_t v0;

  sub_18AD569C0(v0 + 16);
}

uint64_t sub_18AD57974()
{
  return sub_18ACD6098(&qword_1EDF9A7E8, &qword_1EDF9A7C0, (uint64_t (*)(void))sub_18AD57998, MEMORY[0x1E0CD9758]);
}

unint64_t sub_18AD57998()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9A7F0;
  if (!qword_1EDF9A7F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A7C8);
    v2[0] = sub_18AD57A1C();
    v2[1] = sub_18ACBC6F4(&qword_1EDF95198, (uint64_t *)&unk_1EDF951A0, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9A7F0);
  }
  return result;
}

unint64_t sub_18AD57A1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF9A7F8;
  if (!qword_1EDF9A7F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A7D0);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE0630], v1);
    atomic_store(result, (unint64_t *)&qword_1EDF9A7F8);
  }
  return result;
}

uint64_t objectdestroyTm_7()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_18AD57AC8()
{
  uint64_t v0;

  sub_18AD56A68(v0 + 16);
}

uint64_t sub_18AD57AD0()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_18AD57AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  sub_18AF4E9A8();
  swift_retain();
  return a1;
}

_QWORD *sub_18AD57B40(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_18AD57BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for CNWallpaperSuggestionsGallerySection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CNWallpaperSuggestionsGallerySection);
}

uint64_t sub_18AD57BFC()
{
  return sub_18ACBC6F4(&qword_1EDF9A800, &qword_1EDF9A808, (uint64_t)&unk_18AF8A600);
}

uint64_t sub_18AD57C28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for CNWallpaperSuggestionsGallerySection.TitleView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CNWallpaperSuggestionsGallerySection.TitleView);
}

uint64_t sub_18AD57C68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18AD57418(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void (**)(uint64_t))(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), a1);
}

_QWORD *sub_18AD57C78(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_18AF4E9A8();
  return a1;
}

uint64_t destroy for CNContactGroupVisualizer()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_18AD57CAC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_18AD57CEC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_18AD57D1C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v4 = type metadata accessor for CNWallpaperSuggestionsGallerySection.TitleView(255, *a1, a1[1], a4);
  v5 = sub_18AF4EE40();
  v13[0] = MEMORY[0x18D777800](&unk_18AF8A680, v4);
  v13[1] = MEMORY[0x1E0CD9758];
  v6 = MEMORY[0x1E0CD9C20];
  v12[0] = v5;
  v12[1] = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v5, v13);
  MEMORY[0x18D7777AC](255, v12, MEMORY[0x1E0CDE260], 0);
  swift_getTupleTypeMetadata2();
  v7 = sub_18AF4F9D4();
  MEMORY[0x18D777800](MEMORY[0x1E0CE0680], v7);
  v8 = sub_18AF4F890();
  v9 = sub_18AF4EE40();
  v11[0] = MEMORY[0x18D777800](MEMORY[0x1E0CDFCC0], v8);
  v11[1] = MEMORY[0x1E0CDA228];
  return MEMORY[0x18D777800](v6, v9, v11);
}

uint64_t sub_18AD57E50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18AD57E94()
{
  return sub_18ACD6098(&qword_1EDF95010, &qword_1EDF95018, (uint64_t (*)(void))sub_18AD57EC8, MEMORY[0x1E0CDA1F0]);
}

unint64_t sub_18AD57EC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1EDF94F10;
  if (!qword_1EDF94F10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF94F18);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF95008);
    v2[3] = sub_18AD02A18();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_18ACBC6F4(&qword_1EDF95198, (uint64_t *)&unk_1EDF951A0, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF94F10);
  }
  return result;
}

uint64_t static CNMonogramPosterConfigurationReader.canReadConfiguration.getter()
{
  return 1;
}

uint64_t sub_18AD57FE4()
{
  sub_18ACB9378();
  sub_18AF4E7C8();
  return sub_18AF4FFEC();
}

uint64_t sub_18AD58074()
{
  uint64_t v0;

  sub_18AF4E7D4();
  v0 = sub_18AF4FC38();
  swift_bridgeObjectRelease();
  return v0;
}

id CNMonogramPosterConfigurationReader.__allocating_init(posterConfigurationUserInfo:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CNMonogramPosterConfigurationReader.init(posterConfigurationUserInfo:)(a1);
}

id CNMonogramPosterConfigurationReader.init(posterConfigurationUserInfo:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  void (*v14)(char *, char *, uint64_t);
  objc_class *v15;
  objc_super v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A818);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18AF4E7E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1;
  sub_18AD58330(a1, (uint64_t)v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {

    sub_18AD5863C((uint64_t)v6);
    type metadata accessor for CNMonogramPosterConfigurationReader();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v11, v6, v7);
    v14(&v12[OBJC_IVAR____TtC10ContactsUI35CNMonogramPosterConfigurationReader_monogramPosterConfiguration], v11, v7);

    v15 = (objc_class *)type metadata accessor for CNMonogramPosterConfigurationReader();
    v16.receiver = v12;
    v16.super_class = v15;
    return objc_msgSendSuper2(&v16, sel_init);
  }
}

uint64_t sub_18AD58330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v4 = sub_18AF4FC5C();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_18AD48BE8(v4, v5), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    v14 = v8;
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18AF4E330();
      swift_allocObject();
      sub_18AF4E324();
      v9 = sub_18AF4E7E0();
      sub_18AD58868();
      sub_18AF4E318();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a2, 0, 1, v9);
      swift_release();
      return sub_18ACB9CDC(v12, v13);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v10 = sub_18AF4E7E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a2, 1, 1, v10);
}

uint64_t sub_18AD5863C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A818);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CNMonogramPosterConfigurationReader()
{
  uint64_t result;

  result = qword_1EDF9A820;
  if (!qword_1EDF9A820)
    return swift_getSingletonMetadata();
  return result;
}

id CNMonogramPosterConfigurationReader.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CNMonogramPosterConfigurationReader.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNMonogramPosterConfigurationReader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNMonogramPosterConfigurationReader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18AD587A0()
{
  return type metadata accessor for CNMonogramPosterConfigurationReader();
}

uint64_t sub_18AD587A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18AF4E7E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CNMonogramPosterConfigurationReader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNMonogramPosterConfigurationReader.backgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CNMonogramPosterConfigurationReader.initials.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNMonogramPosterConfigurationReader.__allocating_init(posterConfigurationUserInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static CNMonogramPosterConfigurationReader.monogramPosterConfigurationData(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

unint64_t sub_18AD58868()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF9A830;
  if (!qword_1EDF9A830)
  {
    v1 = sub_18AF4E7E0();
    result = MEMORY[0x18D777800](MEMORY[0x1E0D50338], v1);
    atomic_store(result, &qword_1EDF9A830);
  }
  return result;
}

BOOL static CNPosterOnboardingSettingsAnimationViewController.pausableAnimationStartingValue.getter()
{
  return !UIAccessibilityIsVideoAutoplayEnabled();
}

BOOL static CNPosterOnboardingSettingsAnimationViewController.isAnimationPausable.getter()
{
  return UIAccessibilityIsReduceMotionEnabled() || !UIAccessibilityIsVideoAutoplayEnabled();
}

uint64_t static CNPosterOnboardingSettingsAnimationViewController.controller(for:isRTL:windowScene:shouldDefaultToCleanState:completion:)(void *a1, char a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_18AF4FDE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_18AF4FDC4();
  v17 = a1;
  v18 = a3;
  swift_retain();
  v19 = sub_18AF4FDB8();
  v20 = swift_allocObject();
  v21 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = v21;
  *(_QWORD *)(v20 + 32) = v17;
  *(_BYTE *)(v20 + 40) = a2;
  *(_QWORD *)(v20 + 48) = v18;
  *(_BYTE *)(v20 + 56) = a4;
  *(_QWORD *)(v20 + 64) = a5;
  *(_QWORD *)(v20 + 72) = a6;
  sub_18ACE3AB8((uint64_t)v15, (uint64_t)&unk_1EDF9A840, v20);
  return swift_release();
}

uint64_t sub_18AD58A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, char a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v13;
  uint64_t v15;

  v8[13] = a8;
  v8[14] = v15;
  v8[15] = sub_18AF4FDC4();
  v8[16] = sub_18AF4FDB8();
  type metadata accessor for CNPosterOnboardingSettingsAnimationFactory();
  swift_initStaticObject();
  v13 = (_QWORD *)swift_task_alloc();
  v8[17] = v13;
  *v13 = v8;
  v13[1] = sub_18AD58ADC;
  return sub_18ACBE1E8((uint64_t)(v8 + 2), a4, a5, a6, a7);
}

uint64_t sub_18AD58ADC()
{
  swift_task_dealloc();
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD58B4C()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  char *v3;
  uint64_t v4;
  id v5;
  char *v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  id v10;
  id v11;
  void (*v13)(id);

  v13 = *(void (**)(id))(v0 + 104);
  swift_release();
  v1 = *(void **)(v0 + 16);
  sub_18ACD5C10(v0 + 24, v0 + 72, &qword_1EDF95418);
  sub_18ACD5C10(v0 + 32, v0 + 80, &qword_1EDF95418);
  sub_18ACD5C10(v0 + 40, v0 + 88, &qword_1EDF95418);
  sub_18ACD5C10(v0 + 48, v0 + 96, &qword_1EDF95418);
  v2 = (objc_class *)type metadata accessor for CNPosterOnboardingSettingsAnimationViewController();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer] = 0;
  v4 = OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  v5 = v1;
  sub_18ACB9138((id *)(v0 + 72));
  sub_18ACB9138((id *)(v0 + 80));
  sub_18ACB9138((id *)(v0 + 88));
  sub_18ACB9138((id *)(v0 + 96));
  v6 = v3;
  v3[v4] = !UIAccessibilityIsVideoAutoplayEnabled();
  v7 = &v6[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource];
  v8 = *(_OWORD *)(v0 + 16);
  v9 = *(_OWORD *)(v0 + 32);
  *((_QWORD *)v7 + 4) = *(_QWORD *)(v0 + 48);
  *(_OWORD *)v7 = v8;
  *((_OWORD *)v7 + 1) = v9;
  v10 = v5;
  sub_18ACB9138((id *)(v0 + 72));
  sub_18ACB9138((id *)(v0 + 80));
  sub_18ACB9138((id *)(v0 + 88));
  sub_18ACB9138((id *)(v0 + 96));

  *(_QWORD *)(v0 + 56) = v6;
  *(_QWORD *)(v0 + 64) = v2;
  v11 = objc_msgSendSuper2((objc_super *)(v0 + 56), sel_initWithNibName_bundle_, 0, 0);

  sub_18ACB9160((id *)(v0 + 72));
  sub_18ACB9160((id *)(v0 + 80));
  sub_18ACB9160((id *)(v0 + 88));
  sub_18ACB9160((id *)(v0 + 96));
  v13(v11);

  sub_18ACB9160((id *)(v0 + 72));
  sub_18ACB9160((id *)(v0 + 80));
  sub_18ACB9160((id *)(v0 + 88));
  sub_18ACB9160((id *)(v0 + 96));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18AD58D2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_18ACC02C0;
  return sub_18AD58A20(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_18AD58FCC()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  objc_super v16;

  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for CNPosterOnboardingSettingsAnimationViewController();
  objc_msgSendSuper2(&v16, sel_viewWillLayoutSubviews);
  v1 = sub_18AD594C0();
  if (v1)
  {
    v2 = v1;
    v3 = sub_18AD598EC(v1);
    if (v3)
    {
      v4 = v3;
      sub_18AD59EB8(v2);
      v5 = OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer;
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer], sel_removeFromSuperlayer);
      v6 = *(void **)&v0[v5];
      *(_QWORD *)&v0[v5] = v4;
      v7 = v4;

      v8 = &v0[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused];
      swift_beginAccess();
      if (*v8 == 1)
      {
        v9 = *(void **)&v0[v5];
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v10, sel_convertTime_fromLayer_, 0, CACurrentMediaTime());
          v12 = v11;
          LODWORD(v11) = 0;
          objc_msgSend(v10, sel_setSpeed_, v11);
          objc_msgSend(v10, sel_setTimeOffset_, v12);

        }
      }
      v13 = objc_msgSend(v0, sel_view);
      if (!v13)
      {
        __break(1u);
        return;
      }
      v14 = v13;
      v15 = objc_msgSend(v13, sel_layer);

      objc_msgSend(v15, sel_addSublayer_, v7);
    }

  }
}

uint64_t type metadata accessor for CNPosterOnboardingSettingsAnimationViewController()
{
  return objc_opt_self();
}

uint64_t sub_18AD59228()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_18AD592B4(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_18AD592FC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_18AD59340()
{
  uint64_t v0;
  BOOL *v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v1 = (BOOL *)(v0 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused);
  swift_beginAccess();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer);
  if (*v1)
  {
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v3, sel_timeOffset);
      v5 = v4;
      LODWORD(v4) = 1.0;
      objc_msgSend(v3, sel_setSpeed_, v4);
      objc_msgSend(v3, sel_setTimeOffset_, 0.0);
      objc_msgSend(v3, sel_setBeginTime_, 0.0);
      objc_msgSend(v3, sel_convertTime_fromLayer_, 0, CACurrentMediaTime());
      objc_msgSend(v3, sel_setBeginTime_, v6 - v5);
LABEL_6:

    }
  }
  else if (v2)
  {
    v3 = v2;
    objc_msgSend(v3, sel_convertTime_fromLayer_, 0, CACurrentMediaTime());
    v8 = v7;
    LODWORD(v7) = 0;
    objc_msgSend(v3, sel_setSpeed_, v7);
    objc_msgSend(v3, sel_setTimeOffset_, v8);
    goto LABEL_6;
  }
  *v1 = !*v1;
}

id sub_18AD594C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void (*v22)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  id v25;
  _BYTE v27[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94BF8);
  MEMORY[0x1E0C80A78](v0, v1);
  v3 = &v27[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_18AF4E45C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = &v27[-v11];
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = &v27[-v15];
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_18AD59D00();
  v19 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v20 = (void *)sub_18AF4FC38();
  v21 = objc_msgSend(v18, sel_URLForResource_withExtension_, v19, v20);

  if (!v21)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_5;
  }
  sub_18AF4E444();

  v22 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32);
  v22(v3, v12, v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_5:
    sub_18ACCDE68((uint64_t)v3, &qword_1EDF94BF8);
    return 0;
  }
  v22(v16, v3, v4);
  sub_18ACBE1B0(0, &qword_1EDF95518);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v8, v16, v4);
  v23 = sub_18AF4FC5C();
  v25 = sub_18AD59760((uint64_t)v8, v23, v24, 0);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v16, v4);
  return v25;
}

id sub_18AD59760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = (void *)sub_18AF4E438();
  v7 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_18AF4FB9C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v17[0] = 0;
  v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_packageWithContentsOfURL_type_options_error_, v6, v7, v8, v17);

  v10 = v17[0];
  if (v9)
  {
    v11 = sub_18AF4E45C();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v13 = v10;
    v12(a1, v11);
  }
  else
  {
    v14 = v17[0];
    sub_18AF4E42C();

    swift_willThrow();
    v15 = sub_18AF4E45C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

id sub_18AD598EC(void *a1)
{
  void *v1;
  id v2;
  id result;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double Width;
  double v25;
  double v26;
  double v27;
  CGFloat m43;
  CGFloat m44;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CATransform3D v73;
  CATransform3D b;
  CATransform3D a;
  CGRect v76;

  v2 = objc_msgSend(a1, sel_rootLayer);
  if (!v2)
    return v2;
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  v4 = result;
  objc_msgSend(result, sel_bounds);
  v6 = v5;

  objc_msgSend(v2, sel_bounds);
  v8 = v7;
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v9 = result;
  v10 = v6 / v8;
  objc_msgSend(result, sel_bounds);
  v12 = v11;

  objc_msgSend(v2, sel_bounds);
  if (v10 > v12 / v13)
    v14 = v10;
  else
    v14 = v12 / v13;
  v15 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v15, sel_bounds);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v76.origin.x = v17;
  v76.origin.y = v19;
  v76.size.width = v21;
  v76.size.height = v23;
  Width = CGRectGetWidth(v76);
  if (qword_1EDF94930 != -1)
    swift_once();
  v25 = Width - (*(double *)&qword_1EDFA8A30 + 20.0 + *(double *)&qword_1EDFA8A30 + 20.0);
  objc_msgSend(v2, sel_bounds);
  if (v14 >= v25 / v26)
    v27 = v25 / v26;
  else
    v27 = v14;
  objc_msgSend(v2, sel_transform);
  v69 = *(_OWORD *)&a.m13;
  v71 = *(_OWORD *)&a.m11;
  v65 = *(_OWORD *)&a.m23;
  v67 = *(_OWORD *)&a.m21;
  v61 = *(_OWORD *)&a.m33;
  v63 = *(_OWORD *)&a.m31;
  v59 = *(_OWORD *)&a.m41;
  m43 = a.m43;
  m44 = a.m44;
  CATransform3DMakeScale(&a, v27, v27, 1.0);
  v30 = *(_OWORD *)&a.m11;
  v31 = *(_OWORD *)&a.m13;
  v32 = *(_OWORD *)&a.m21;
  v33 = *(_OWORD *)&a.m23;
  v34 = *(_OWORD *)&a.m31;
  v35 = *(_OWORD *)&a.m33;
  v36 = *(_OWORD *)&a.m41;
  v37 = *(_OWORD *)&a.m43;
  *(_OWORD *)&a.m11 = v71;
  *(_OWORD *)&a.m13 = v69;
  *(_OWORD *)&a.m21 = v67;
  *(_OWORD *)&a.m23 = v65;
  *(_OWORD *)&a.m31 = v63;
  *(_OWORD *)&a.m33 = v61;
  *(_OWORD *)&a.m41 = v59;
  a.m43 = m43;
  a.m44 = m44;
  *(_OWORD *)&b.m11 = v30;
  *(_OWORD *)&b.m13 = v31;
  *(_OWORD *)&b.m21 = v32;
  *(_OWORD *)&b.m23 = v33;
  *(_OWORD *)&b.m31 = v34;
  *(_OWORD *)&b.m33 = v35;
  *(_OWORD *)&b.m41 = v36;
  *(_OWORD *)&b.m43 = v37;
  CATransform3DConcat(&v73, &a, &b);
  a = v73;
  objc_msgSend(v2, sel_setTransform_, &a);
  result = objc_msgSend(v1, sel_view);
  if (!result)
    goto LABEL_18;
  v38 = result;
  objc_msgSend(result, sel_bounds);
  v40 = v39;

  objc_msgSend(v2, sel_bounds);
  v42 = v41;
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v43 = result;
    v44 = (v40 - v42) * 0.5;
    objc_msgSend(result, sel_bounds);
    v46 = v45;

    objc_msgSend(v2, sel_bounds);
    v48 = (v46 - v47) * 0.5;
    objc_msgSend(v2, sel_transform);
    v70 = *(_OWORD *)&a.m13;
    v72 = *(_OWORD *)&a.m11;
    v66 = *(_OWORD *)&a.m23;
    v68 = *(_OWORD *)&a.m21;
    v62 = *(_OWORD *)&a.m33;
    v64 = *(_OWORD *)&a.m31;
    v60 = *(_OWORD *)&a.m41;
    v49 = a.m43;
    v50 = a.m44;
    CATransform3DMakeTranslation(&a, v44, v48, 1.0);
    v51 = *(_OWORD *)&a.m11;
    v52 = *(_OWORD *)&a.m13;
    v53 = *(_OWORD *)&a.m21;
    v54 = *(_OWORD *)&a.m23;
    v55 = *(_OWORD *)&a.m31;
    v56 = *(_OWORD *)&a.m33;
    v57 = *(_OWORD *)&a.m41;
    v58 = *(_OWORD *)&a.m43;
    *(_OWORD *)&a.m11 = v72;
    *(_OWORD *)&a.m13 = v70;
    *(_OWORD *)&a.m21 = v68;
    *(_OWORD *)&a.m23 = v66;
    *(_OWORD *)&a.m31 = v64;
    *(_OWORD *)&a.m33 = v62;
    *(_OWORD *)&a.m41 = v60;
    a.m43 = v49;
    a.m44 = v50;
    *(_OWORD *)&b.m11 = v51;
    *(_OWORD *)&b.m13 = v52;
    *(_OWORD *)&b.m21 = v53;
    *(_OWORD *)&b.m23 = v54;
    *(_OWORD *)&b.m31 = v55;
    *(_OWORD *)&b.m33 = v56;
    *(_OWORD *)&b.m41 = v57;
    *(_OWORD *)&b.m43 = v58;
    CATransform3DConcat(&v73, &a, &b);
    a = v73;
    objc_msgSend(v2, sel_setTransform_, &a);
    return v2;
  }
LABEL_19:
  __break(1u);
  return result;
}

id sub_18AD59D00()
{
  void *v0;
  unsigned __int8 v1;
  id result;
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v1 = sub_18AD59DD4();
  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, sel_effectiveUserInterfaceLayoutDirection);

    v5 = 0xD000000000000022;
    v6 = 0xD000000000000025;
    if (v4 == (id)1)
    {
      v6 = 0xD000000000000029;
      v5 = 0xD000000000000026;
    }
    if ((v1 & 1) != 0)
      return (id)v6;
    else
      return (id)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_18AD59DD4()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  double Width;
  double v5;
  double Height;
  double v7;
  double v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_window);

    if (v3)
    {
      objc_msgSend(v3, sel_bounds);
      Width = CGRectGetWidth(v9);
      objc_msgSend(v3, sel_bounds);
      v5 = Width / CGRectGetHeight(v10);
      objc_msgSend(v3, sel_bounds);
      Height = CGRectGetHeight(v11);
      objc_msgSend(v3, sel_bounds);
      v7 = CGRectGetWidth(v12);

      v8 = Height / v7;
      if (Height / v7 >= v5)
        v8 = v5;
      return (id)(v8 > 0.5);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_18AD59EB8(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[24];
  uint64_t v19;

  v3 = (void *)sub_18AF4FC38();
  v4 = objc_msgSend(a1, sel_publishedObjectWithName_, v3);

  if (v4)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v1
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource
                     + 8))
        objc_msgSend(v15, sel_setContents_);

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
  v5 = (void *)sub_18AF4FC38();
  v6 = objc_msgSend(a1, sel_publishedObjectWithName_, v5);

  if (v6)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v1
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource
                     + 16))
        objc_msgSend(v15, sel_setContents_);

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
  v7 = (void *)sub_18AF4FC38();
  v8 = objc_msgSend(a1, sel_publishedObjectWithName_, v7);

  if (v8)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v1
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource
                     + 24))
        objc_msgSend(v15, sel_setContents_);

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
  v9 = (void *)sub_18AF4FC38();
  v10 = objc_msgSend(a1, sel_publishedObjectWithName_, v9);

  if (v10)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v1
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource
                     + 32))
        objc_msgSend(v15, sel_setContents_);

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
  v11 = (void *)sub_18AF4FC38();
  v12 = objc_msgSend(a1, sel_publishedObjectWithName_, v11);

  if (v12)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v15, sel_setBackgroundColor_, *(_QWORD *)(v1 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource));

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
  v13 = (void *)sub_18AF4FC38();
  v14 = objc_msgSend(a1, sel_publishedObjectWithName_, v13);

  if (v14)
  {
    sub_18AF50154();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_18ACD5C10((uint64_t)&v16, (uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  if (v19)
  {
    sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF954F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      objc_msgSend(v15, sel_setBackgroundColor_, *(_QWORD *)(v1 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource));

    }
  }
  else
  {
    sub_18ACCDE68((uint64_t)v18, (uint64_t *)&unk_1EDF955B0);
  }
}

id CNPosterOnboardingSettingsAnimationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_18AF4FC38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CNPosterOnboardingSettingsAnimationViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNPosterOnboardingSettingsAnimationViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNPosterOnboardingSettingsAnimationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18AD5A5B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_18AD5A600(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for CNPosterOnboardingSettingsAnimationViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNPosterOnboardingSettingsAnimationViewController.isAnimationPaused.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CNPosterOnboardingSettingsAnimationViewController.isAnimationPaused.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CNPosterOnboardingSettingsAnimationViewController.isAnimationPaused.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CNPosterOnboardingSettingsAnimationViewController.toggleAnimation()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t sub_18AD5A72C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18AD5A750()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t objectdestroyTm_8()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18AD5A7A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_18ACBFE40;
  return sub_18AD58A20(a1, v4, v5, v6, v7, v8, v9, v10);
}

id sub_18AD5A848(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  __int128 v8;
  id v9;
  objc_super v11;
  id v12;
  id v13;
  id v14;
  id v15;

  *(_QWORD *)&v1[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer] = 0;
  v3 = OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  v4 = v1;
  v1[v3] = !UIAccessibilityIsVideoAutoplayEnabled();
  v5 = *(void **)a1;
  sub_18ACD5C10(a1 + 8, (uint64_t)&v15, &qword_1EDF95418);
  sub_18ACD5C10(a1 + 16, (uint64_t)&v14, &qword_1EDF95418);
  sub_18ACD5C10(a1 + 24, (uint64_t)&v13, &qword_1EDF95418);
  sub_18ACD5C10(a1 + 32, (uint64_t)&v12, &qword_1EDF95418);
  v6 = &v4[OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a1;
  *((_OWORD *)v6 + 1) = v8;
  *((_QWORD *)v6 + 4) = v7;
  v9 = v5;
  sub_18ACB9138(&v15);
  sub_18ACB9138(&v14);
  sub_18ACB9138(&v13);
  sub_18ACB9138(&v12);

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for CNPosterOnboardingSettingsAnimationViewController();
  return objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
}

id sub_18AD5A9A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNAvatarPosterPairViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CNAvatarPosterPairViewModel()
{
  return objc_opt_self();
}

uint64_t sub_18AD5AA28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for CNAvatarPosterPairViewModel();
  result = sub_18AF4EB4C();
  *a1 = result;
  return result;
}

void destroy for CNPosterOnboardingSettingsAnimationDataSource(id *a1)
{

}

_QWORD *initializeWithCopy for CNPosterOnboardingSettingsAnimationDataSource(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  return a1;
}

uint64_t assignWithCopy for CNPosterOnboardingSettingsAnimationDataSource(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  v16 = *(void **)(a1 + 32);
  v17 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v17;
  v18 = v17;

  return a1;
}

uint64_t assignWithTake for CNPosterOnboardingSettingsAnimationDataSource(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CNPosterOnboardingSettingsAnimationDataSource(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNPosterOnboardingSettingsAnimationDataSource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNPosterOnboardingSettingsAnimationDataSource()
{
  return &type metadata for CNPosterOnboardingSettingsAnimationDataSource;
}

uint64_t sub_18AD5AC90(uint64_t result, uint64_t a2)
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
    sub_18AF4E9A8();
    v19 = sub_18AD48BE8(v16, v17);
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

id sub_18AD5AE40()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CNWallpaperConfigurationGenerator()), sel_init);
  qword_1EDF949E8 = (uint64_t)result;
  return result;
}

id CNWallpaperConfigurationGenerator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static CNWallpaperConfigurationGenerator.shared.getter()
{
  if (qword_1EDF949F0 != -1)
    swift_once();
  return (id)qword_1EDF949E8;
}

void sub_18AD5AF0C(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(void *), uint64_t a5, void *a6, void *a7, uint64_t a8, unint64_t a9, void *a10)
{
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned __int8 v23;
  id v24;
  unint64_t v25;
  void *v26;
  unsigned int v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void (*v34)(void *);
  __int128 v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v16 = a3 + 16;
  swift_beginAccess();
  v17 = MEMORY[0x18D7779A4](v16);
  if (v17)
  {
    v32 = (void *)v17;
    v34 = a4;
    v18 = objc_msgSend(a10, sel_poseConfigurationData);
    if (v18)
    {
      v19 = v18;
      v20 = sub_18AF4E48C();
      v22 = v21;

    }
    else
    {
      v20 = 0;
      v22 = 0xF000000000000000;
    }
    v23 = objc_msgSend(a10, sel_poseHasBody);
    sub_18ACC022C(a1, a2);
    sub_18ACC022C(a8, a9);
    v24 = a7;
    v25 = UIColor.avatarColorDescription.getter();

    *(_QWORD *)&v35 = v25;
    *((_QWORD *)&v35 + 1) = a8;
    v36 = a9;
    v37 = v20;
    v33 = v20;
    v38 = v22;
    v39 = v23;
    v40 = a1;
    v41 = a2;
    sub_18AD5BD0C(&v35);
    v26 = (void *)sub_18AF4FB9C();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v35 = 0;
    v27 = objc_msgSend(a6, sel_storeUserInfo_error_, v26, &v35);

    if (v27)
    {
      v28 = (id)v35;
    }
    else
    {
      v29 = (id)v35;
      v30 = (void *)sub_18AF4E42C();

      swift_willThrow();
      sub_18AF4FEF0();
      v31 = CNUILogPosters();
      sub_18AF4E8B8();

    }
    v34(a6);
    swift_bridgeObjectRelease();
    sub_18ACB9CC8(a8, a9);
    sub_18ACB9CC8(v33, v22);
    sub_18ACB9CC8(a1, a2);

  }
  else
  {
    a4(a6);
  }
}

uint64_t sub_18AD5B190(uint64_t a1, void *a2)
{
  void (*v3)(uint64_t, unint64_t);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = sub_18AF4E48C();
  v7 = v6;

  v3(v5, v7);
  sub_18ACB9CDC(v5, v7);
  return swift_release();
}

uint64_t sub_18AD5B200(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = (void *)sub_18AD5C014(1, a1, *(void **)(v1+ OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor), 0, 0, 2);
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_18AF4FC38();
  v5 = objc_msgSend(v3, sel_finalizedConfiguration_forExtensionIdentifier_, v2, v4);

  if (v5)
  {

    v2 = v5;
  }
  sub_18ACBE1B0(0, (unint64_t *)&unk_1EDF9A2C0);
  v6 = sub_18AD12100((uint64_t)v2);

  return v6;
}

uint64_t sub_18AD5B380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  os_log_type_t v35;
  NSObject *v36;
  os_log_type_t v37;
  id v38;
  id v39;
  uint8_t *v40;
  _QWORD *v41;
  id v42;
  void *v43;
  int v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  id v56[2];

  v55 = a3;
  v56[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = sub_18AF4E7E0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A818);
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v10, v13);
  v16 = (char *)&v54 - v15;
  MEMORY[0x1E0C80A78](v14, v17);
  v19 = (char *)&v54 - v18;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))((char *)&v54 - v18, 1, 1, v3);
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_18AF4E474();
  v56[0] = 0;
  v22 = objc_msgSend(v20, sel_unarchiveCNConfigurationFromData_error_, v21, v56);

  v23 = v56[0];
  if (!v22)
  {
    v30 = v56[0];
    v31 = sub_18AF4E42C();

    swift_willThrow();
    v32 = (void *)v31;
LABEL_7:

    LOBYTE(v36) = 0;
    goto LABEL_18;
  }
  v56[0] = 0;
  v24 = v23;
  v25 = objc_msgSend(v22, sel_loadUserInfoWithError_, v56);
  v26 = v56[0];
  if (!v25)
  {
    v33 = v56[0];
    v34 = (void *)sub_18AF4E42C();

    swift_willThrow();
    v35 = sub_18AF4FEE4();
    v36 = CNUILogPosters();
    v37 = v35;
    if (!os_log_type_enabled(v36, v35))
    {

      LOBYTE(v36) = 0;
      goto LABEL_18;
    }
    v38 = v34;
    v39 = v34;
    v40 = (uint8_t *)swift_slowAlloc();
    v41 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v40 = 138412290;
    v42 = v34;
    v43 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v56[0] = v43;
    sub_18AF50124();
    *v41 = v43;

    _os_log_impl(&dword_18AC56000, v36, v37, "Poster could not be decoded as a monogram: %@", v40, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF99D20);
    swift_arrayDestroy();
    MEMORY[0x18D7778C0](v41, -1, -1);
    MEMORY[0x18D7778C0](v40, -1, -1);

    v32 = v34;
    goto LABEL_7;
  }
  v27 = v25;
  v28 = sub_18AF4FBA8();
  v29 = v26;

  sub_18AD5B94C(v28, (uint64_t)v16);
  sub_18ACCDE68((uint64_t)v19, &qword_1EDF9A818);
  swift_bridgeObjectRelease();

  sub_18AD5CDFC((uint64_t)v16, (uint64_t)v19);
  sub_18AD5CE44((uint64_t)v19, (uint64_t)v12);
  v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3);
  if (v44 == 1)
  {
    sub_18ACCDE68((uint64_t)v19, &qword_1EDF9A818);
    LOBYTE(v36) = 0;
    v19 = v12;
  }
  else
  {
    v45 = v7;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v12, v3);
    v36 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v55, 1002);
    if (v36)
    {
      v46 = sub_18AF4FC5C();
      v48 = v47;

      if (v46 == sub_18AF4E7D4() && v48 == v49)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v50 = sub_18AF50418();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v50 & 1) == 0)
        {
          (*(void (**)(char *, uint64_t))(v4 + 8))(v45, v3);
          LOBYTE(v36) = 0;
          goto LABEL_18;
        }
      }
      v51 = sub_18AF4FFF8();
      v52 = sub_18AF4E7C8();
      LOBYTE(v36) = sub_18AD5AC90(v51, v52);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v45, v3);
  }
LABEL_18:
  sub_18ACCDE68((uint64_t)v19, &qword_1EDF9A818);
  return v36 & 1;
}

uint64_t sub_18AD5B94C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE v20[40];
  __int128 v21;
  __int128 v22;

  v5 = sub_18AF4E7E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4E330();
  swift_allocObject();
  sub_18AF4E324();
  v18 = sub_18AF4FC5C();
  v19 = v10;
  sub_18AF501A8();
  if (*(_QWORD *)(a1 + 16) && (v11 = sub_18AD48C4C((uint64_t)v20), (v12 & 1) != 0))
  {
    sub_18ACB8738(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v21);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }
  sub_18AD4A6A0((uint64_t)v20);
  if (!*((_QWORD *)&v22 + 1))
  {
    swift_release();
    sub_18ACCDE68((uint64_t)&v21, (uint64_t *)&unk_1EDF955B0);
LABEL_11:
    v16 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v16, 1, v5);
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();
    goto LABEL_11;
  }
  v13 = v18;
  v14 = v19;
  sub_18AD5D080(&qword_1EDF9A830, MEMORY[0x1E0D50338]);
  sub_18AF4E318();
  sub_18ACB9CDC(v13, v14);
  result = swift_release();
  if (v2)
    return result;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v9, v5);
  v16 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v16, 1, v5);
}

id CNWallpaperConfigurationGenerator.init()()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor;
  v2 = (void *)objc_opt_self();
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_systemDarkGrayColor);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for CNWallpaperConfigurationGenerator();
  return objc_msgSendSuper2(&v5, sel_init);
}

id CNWallpaperConfigurationGenerator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNWallpaperConfigurationGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_18AD5BC84(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x18D7778D8](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x18D7778D8](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_18AD5BD0C(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  v13 = a1[1];
  v14 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_BYTE *)a1 + 40);
  v4 = *((_QWORD *)a1 + 6);
  v5 = *((_QWORD *)a1 + 7);
  v6 = sub_18AD47500(MEMORY[0x1E0DEE9D8]);
  sub_18AF4E360();
  swift_allocObject();
  sub_18AF4E354();
  sub_18AF4E33C();
  v18[0] = v14;
  v18[1] = v13;
  v19 = v2;
  v20 = v3;
  v21 = v4;
  v22 = v5;
  sub_18AD5D03C();
  v7 = sub_18AF4E348();
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = v7;
    v10 = v8;
    sub_18AF4FC5C();
    sub_18AF501A8();
    v17 = MEMORY[0x1E0CB0338];
    *(_QWORD *)&v16 = v9;
    *((_QWORD *)&v16 + 1) = v10;
    sub_18ACD18D4(&v16, v15);
    sub_18ACC022C(v9, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_18ACCF2C0(v15, (uint64_t)v18, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_18AD4A6A0((uint64_t)v18);
    sub_18ACB9CDC(v9, v10);
    swift_release();
  }
  return v6;
}

unint64_t sub_18AD5BE9C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  _BYTE v11[40];

  v1 = sub_18AD47500(MEMORY[0x1E0DEE9D8]);
  sub_18AF4E360();
  swift_allocObject();
  sub_18AF4E354();
  sub_18AF4E33C();
  sub_18AF4E7E0();
  sub_18AD5D080(&qword_1EDF94C30, MEMORY[0x1E0D50330]);
  v2 = sub_18AF4E348();
  if (v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = v2;
    v5 = v3;
    sub_18AF4FC5C();
    sub_18AF501A8();
    v10 = MEMORY[0x1E0CB0338];
    *(_QWORD *)&v9 = v4;
    *((_QWORD *)&v9 + 1) = v5;
    sub_18ACD18D4(&v9, v8);
    sub_18ACC022C(v4, v5);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_18ACCF2C0(v8, (uint64_t)v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_18AD4A6A0((uint64_t)v11);
    sub_18ACB9CDC(v4, v5);
    swift_release();
  }
  return v1;
}

uint64_t sub_18AD5C014(char a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void (**v38)(char *, _QWORD);
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;
  char v61;
  id v62;
  unsigned __int8 v63;
  char isUniquelyReferenced_nonNull_native;
  void *v65;
  id v66;
  char *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t result;
  uint64_t v74;
  char v75;
  id v76;
  void *v77;
  void (**v78)(char *, uint64_t);
  void (**v79)(char *, uint64_t);
  id v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  id v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  void (**v100)(char *, _QWORD);
  void *v101;
  unsigned __int8 v102;
  void (**v103)(char *, _QWORD);
  void *v104;
  void *v105;
  unsigned int v106;
  id v107;
  id v108;
  void *v109;
  id v110;
  _QWORD v111[2];
  uint64_t v112;
  uint64_t v113;
  char *v114;
  int v115;
  char *v116;
  void (**v117)(char *, _QWORD);
  __int128 v118;
  unint64_t v119;
  id v120;
  unint64_t v121;
  id v122;
  __int128 v123;
  __int128 v124;
  unsigned __int8 v125;
  __int128 v126;
  _OWORD v127[2];
  __int128 v128;
  uint64_t v129;
  uint64_t v130;

  v115 = a6;
  v111[1] = a4;
  *((_QWORD *)&v118 + 1) = a2;
  v130 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v118 = sub_18AF4E45C();
  v117 = *(void (***)(char *, _QWORD))(v118 - 8);
  MEMORY[0x1E0C80A78](v118, v9);
  v116 = (char *)v111 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = sub_18AF4E7E0();
  v113 = *(_QWORD *)(v112 - 8);
  v12 = MEMORY[0x1E0C80A78](v112, v11);
  v14 = (char *)v111 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)v111 - v16;
  v18 = sub_18AF4E804();
  v19 = *(_QWORD *)(v18 - 8);
  v21 = MEMORY[0x1E0C80A78](v18, v20);
  v23 = (char *)v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21, v24);
  v114 = (char *)v111 - v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94C38);
  v28 = MEMORY[0x1E0C80A78](v26, v27);
  v30 = (char *)v111 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28, v31);
  v33 = (char *)v111 - v32;
  v120 = objc_msgSend(objc_allocWithZone((Class)CNPRSMutablePosterConfiguration), sel_init);
  v119 = sub_18AD47500(MEMORY[0x1E0DEE9D8]);
  if (!a1)
  {
    if (a3)
    {
      v38 = (void (**)(char *, _QWORD))objc_msgSend(a3, sel_colorWithAlphaComponent_, 1.0);
    }
    else
    {
      v55 = sub_18AF4E810();
      v56 = v55;
      v57 = *(_QWORD *)(v55 + 16);
      if (v57)
      {
        v58 = sub_18AD5BC84(*(_QWORD *)(v55 + 16));
        if (v58 >= v57)
          goto LABEL_52;
        (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v33, v56+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(_QWORD *)(v19 + 72) * v58, v18);
        v59 = 0;
      }
      else
      {
        v59 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v33, v59, 1, v18);
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v33, 1, v18);
      if ((_DWORD)result == 1)
      {
LABEL_54:
        __break(1u);
        return result;
      }
      v38 = (void (**)(char *, _QWORD))sub_18AF4E7F8();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v33, v18);
    }
    v80 = objc_msgSend(*((id *)&v118 + 1), sel_memojiMetadata);
    if (v80)
    {
      v81 = v80;
      v82 = sub_18AF4E48C();
      v84 = v83;

      v85 = (void *)objc_opt_self();
      v86 = (void *)sub_18AF4E474();
      v87 = objc_msgSend(v85, sel_memojiMetadataFromData_, v86);

      if (v87)
      {
        v88 = objc_msgSend(v87, sel_avatarRecordData);
        if (v88)
        {
          v89 = v88;
          v90 = sub_18AF4E48C();
          v92 = v91;

          v93 = objc_msgSend((id)objc_opt_self(), sel_imageDataFromMetadata_, v87);
          v94 = sub_18AF4E48C();
          v96 = v95;

          v97 = objc_msgSend(v87, sel_poseConfigurationData);
          if (v97)
          {
            v98 = v97;
            *(_QWORD *)&v118 = sub_18AF4E48C();
            *((_QWORD *)&v118 + 1) = v99;

          }
          else
          {
            *(_QWORD *)&v118 = 0;
            *((_QWORD *)&v118 + 1) = 0xF000000000000000;
          }
          v102 = objc_msgSend(v87, sel_poseHasBody);
          sub_18ACC022C(v94, v96);
          v117 = v38;
          v103 = v38;
          sub_18ACC022C(v90, v92);
          v104 = (void *)UIColor.avatarColorDescription.getter();

          v122 = v104;
          *(_QWORD *)&v123 = v90;
          *((_QWORD *)&v123 + 1) = v92;
          v124 = v118;
          v125 = v102;
          *(_QWORD *)&v126 = v94;
          *((_QWORD *)&v126 + 1) = v96;
          sub_18AD5BD0C((__int128 *)&v122);
          swift_bridgeObjectRelease();
          sub_18ACB9CDC(v82, v84);

          sub_18ACB9CDC(v90, v92);
          sub_18ACB9CDC(v94, v96);
          swift_bridgeObjectRelease();
          sub_18ACB9CC8(v90, v92);
          sub_18ACB9CC8(v118, *((unint64_t *)&v118 + 1));
          sub_18ACB9CC8(v94, v96);
          goto LABEL_33;
        }

      }
      sub_18ACB9CDC(v82, v84);
    }
    v100 = v38;
    v101 = (void *)UIColor.avatarColorDescription.getter();

    v122 = v101;
    v123 = xmmword_18AF889E0;
    v124 = xmmword_18AF889E0;
    v125 = 0;
    v126 = xmmword_18AF889E0;
    sub_18AD5BD0C((__int128 *)&v122);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_18ACB9CC8(0, 0xF000000000000000);
    sub_18ACB9CC8(0, 0xF000000000000000);
    sub_18ACB9CC8(0, 0xF000000000000000);
    v60 = v120;
    goto LABEL_47;
  }
  if (a1 != 1)
  {
    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D751F0]), sel_initWithConfigurationType_, 0);
    objc_msgSend(v39, sel_setOptions_, 32);
    if (a5)
    {
      v40 = objc_allocWithZone(MEMORY[0x1E0D75210]);
      sub_18AF4E9A8();
      v41 = (void *)sub_18AF4FC38();
      swift_bridgeObjectRelease();
      v42 = objc_msgSend(v40, sel_initWithAssetUUID_, v41);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
      v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_18AF85030;
      *(_QWORD *)(v43 + 32) = v42;
      v122 = (id)v43;
      sub_18AF4FD4C();
      sub_18ACBE1B0(0, &qword_1EDF9A880);
      v44 = v42;
      v45 = (void *)sub_18AF4FD28();
      swift_bridgeObjectRelease();
      objc_msgSend(v39, sel_setMedia_, v45);

    }
    v46 = objc_msgSend(v39, sel_userInfo);
    if (v46)
    {
      v47 = v46;
      v48 = sub_18AF4FBA8();

    }
    else
    {
      v48 = sub_18AD47500(MEMORY[0x1E0DEE9D8]);
    }
    v60 = v120;
    v61 = v115;
    *(_QWORD *)&v128 = 0xD000000000000025;
    *((_QWORD *)&v128 + 1) = 0x800000018AF90A10;
    sub_18AF501A8();
    if ((v61 & 1) != 0)
    {
      v63 = 1;
    }
    else
    {
      v62 = objc_msgSend((id)objc_opt_self(), sel_unifiedMeContactMonitor);
      v63 = objc_msgSend(v62, sel_isMeContact_, *((_QWORD *)&v118 + 1));

    }
    v129 = MEMORY[0x1E0DEAFA0];
    LOBYTE(v128) = v63;
    sub_18ACD18D4(&v128, v127);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v121 = v48;
    sub_18ACCF2C0(v127, (uint64_t)&v122, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_18AD4A6A0((uint64_t)&v122);
    v65 = (void *)sub_18AF4FB9C();
    swift_bridgeObjectRelease();
    objc_msgSend(v39, sel_setUserInfo_, v65);

    v66 = objc_msgSend(v60, sel_assetDirectory);
    v67 = v116;
    sub_18AF4E444();

    v68 = (void *)sub_18AF4E438();
    v117[1](v67, v118);
    v122 = 0;
    LODWORD(v67) = objc_msgSend(v39, sel_saveToURL_error_, v68, &v122);

    v69 = v122;
    if ((_DWORD)v67)
    {

    }
    else
    {
      v70 = v69;
      v71 = (void *)sub_18AF4E42C();

      swift_willThrow();
      sub_18AF4FEF0();
      v72 = CNUILogPosters();
      sub_18AF4E8B8();

    }
    goto LABEL_47;
  }
  if (a3)
  {
    v34 = objc_msgSend(a3, sel_colorWithAlphaComponent_, 1.0);
    v35 = v114;
    sub_18AF4E7EC();
    v36 = v18;
    v37 = v35;
    goto LABEL_27;
  }
  v49 = sub_18AF4E810();
  v50 = v49;
  v51 = *(_QWORD *)(v49 + 16);
  if (v51)
  {
    v52 = sub_18AD5BC84(*(_QWORD *)(v49 + 16));
    if (v52 < v51)
    {
      v53 = v18;
      (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v30, v50+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(_QWORD *)(v19 + 72) * v52, v18);
      v54 = 0;
      goto LABEL_25;
    }
    __break(1u);
LABEL_52:
    __break(1u);
  }
  v54 = 1;
  v53 = v18;
LABEL_25:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v30, v54, 1, v53);
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v30, 1, v53);
  v37 = v114;
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_54;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v114, v30, v53);
  v36 = v53;
LABEL_27:
  v74 = *((_QWORD *)&v118 + 1);
  v75 = sub_18AF4E828();
  v76 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v74, 1002);
  if (!v76)
  {
LABEL_31:
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v23, v37, v36);
    sub_18AF4E7BC();
    sub_18AD5BE9C();
    v79 = (void (**)(char *, uint64_t))(v113 + 8);
    swift_bridgeObjectRelease();
    (*v79)(v14, v112);
    goto LABEL_32;
  }
  v77 = v76;
  sub_18AF4FC5C();

  if ((v75 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v23, v37, v36);
  sub_18AF4E7BC();
  sub_18AD5BE9C();
  v78 = (void (**)(char *, uint64_t))(v113 + 8);
  swift_bridgeObjectRelease();
  (*v78)(v17, v112);
LABEL_32:
  (*(void (**)(char *, uint64_t))(v19 + 8))(v37, v36);
LABEL_33:
  v60 = v120;
LABEL_47:
  v105 = (void *)sub_18AF4FB9C();
  swift_bridgeObjectRelease();
  v122 = 0;
  v106 = objc_msgSend(v60, sel_storeUserInfo_error_, v105, &v122);

  if (v106)
  {
    v107 = v122;
  }
  else
  {
    v108 = v122;
    v109 = (void *)sub_18AF4E42C();

    swift_willThrow();
    sub_18AF4FEF0();
    v110 = CNUILogPosters();
    sub_18AF4E8B8();

  }
  return (uint64_t)v60;
}

uint64_t sub_18AD5CDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18AD5CE44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for CNWallpaperConfigurationGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for CNWallpaperConfigurationGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNWallpaperConfigurationGenerator.cleanStatePosterArchiveData(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CNWallpaperConfigurationGenerator.isCleanStatePosterData(_:contact:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

id sub_18AD5CEF0(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v2 = objc_msgSend(a1, sel_memojiMetadata);
  if (v2)
  {
    v3 = v2;
    v4 = sub_18AF4E48C();
    v6 = v5;

    sub_18ACB9CDC(v4, v6);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  v8 = (void *)sub_18AD5C014(v7, (uint64_t)a1, 0, 0, 0, 2);
  v9 = objc_msgSend(a1, sel_memojiMetadata);
  if (v9)
  {
    v10 = v9;
    v11 = sub_18AF4E48C();
    v13 = v12;

    sub_18ACB9CDC(v11, v13);
  }
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_finalizedConfiguration_forExtensionIdentifier_, v8, v15);

  if (v16)
  {

    return v16;
  }
  return v8;
}

unint64_t sub_18AD5D03C()
{
  unint64_t result;

  result = qword_1EDF948D8;
  if (!qword_1EDF948D8)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for AvatarPosterConfiguration, &type metadata for AvatarPosterConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EDF948D8);
  }
  return result;
}

uint64_t sub_18AD5D080(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_18AF4E7E0();
    result = MEMORY[0x18D777800](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_18AD5D0C0(void *a1, void (*a2)(void))
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_18AF4FC38();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_finalizedConfiguration_forExtensionIdentifier_, a1, v5);

  v6 = v7;
  if (!v7)
    v6 = a1;
  v8 = v6;
  a2();

}

void sub_18AD5D1BC(unsigned __int8 a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, void (*a8)(void), uint64_t a9, void *a10, char a11)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  id v56;
  double v57;
  double v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  _QWORD *v66;
  id v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  _QWORD aBlock[7];

  v79 = a7;
  v80 = a5;
  LODWORD(v81) = a6;
  v82 = a2;
  v15 = a1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94C38);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a8;
  *(_QWORD *)(v20 + 24) = a9;
  *(_QWORD *)(v20 + 32) = a10;
  *(_BYTE *)(v20 + 40) = a11;
  if (v15)
  {
    swift_retain();
    v21 = a10;
    v82 = (void *)sub_18AD5C014(a1, (uint64_t)v82, a3, a4, v80, (int)v81);
    sub_18AD5D0C0(v82, a8);
    swift_release();
    v22 = v82;
LABEL_3:

    return;
  }
  v23 = a3;
  v24 = objc_allocWithZone((Class)CNPRSMutablePosterConfiguration);
  swift_retain();
  v25 = a10;
  v81 = objc_msgSend(v24, sel_init);
  v26 = objc_msgSend(v82, sel_memojiMetadata);
  if (!v26)
  {
    swift_release();
    v22 = v81;
    goto LABEL_3;
  }
  v27 = v26;
  v28 = sub_18AF4E48C();
  v30 = v29;

  v31 = (void *)objc_opt_self();
  v32 = (void *)sub_18AF4E474();
  v33 = objc_msgSend(v31, sel_memojiMetadataFromData_, v32);

  if (!v33)
  {

    sub_18ACB9CDC(v28, v30);
LABEL_12:
    swift_release();
    return;
  }
  v78 = v20;
  v34 = v28;
  v35 = objc_msgSend(v33, sel_avatarRecordData);
  if (!v35)
  {

    sub_18ACB9CDC(v28, v30);
    goto LABEL_12;
  }
  v36 = v35;
  v76 = a9;
  v37 = (void *)sub_18AF4E48C();
  v80 = v38;

  v82 = v37;
  v77 = v30;
  if (!v23)
  {
    v75 = v25;
    v41 = sub_18AF4E810();
    v42 = v41;
    v43 = *(_QWORD *)(v41 + 16);
    if (v43)
    {
      v44 = sub_18AD5BC84(*(_QWORD *)(v41 + 16));
      if (v44 >= v43)
      {
        __break(1u);
        goto LABEL_26;
      }
      v45 = v44;
      v46 = sub_18AF4E804();
      v47 = *(_QWORD *)(v46 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v47 + 16))(v19, v42+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(_QWORD *)(v47 + 72) * v45, v46);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v19, 0, 1, v46);
    }
    else
    {
      v46 = sub_18AF4E804();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v19, 1, 1, v46);
    }
    swift_bridgeObjectRelease();
    sub_18AF4E804();
    v48 = *(_QWORD *)(v46 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v19, 1, v46) != 1)
    {
      v40 = v34;
      v39 = (id)sub_18AF4E7F8();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v19, v46);
      goto LABEL_19;
    }
LABEL_26:

    swift_release();
    __break(1u);
    return;
  }
  v39 = objc_msgSend(v23, sel_colorWithAlphaComponent_, 1.0);
  v40 = v28;
LABEL_19:
  v49 = (void *)objc_opt_self();
  v50 = objc_msgSend(v49, sel_mainScreen);
  objc_msgSend(v50, sel_bounds);
  v52 = v51;

  v53 = objc_msgSend(v49, sel_mainScreen);
  objc_msgSend(v53, sel_bounds);
  v55 = v54;

  if (v55 < v52)
    v52 = v55;
  v56 = objc_msgSend(v49, sel_mainScreen);
  objc_msgSend(v56, sel_bounds);
  v58 = v57;

  v59 = objc_msgSend(v49, sel_mainScreen);
  objc_msgSend(v59, sel_bounds);
  v61 = v60;

  if (v58 > v61)
    v62 = v58;
  else
    v62 = v61;
  v63 = v62 * 0.45;
  v64 = (void *)objc_opt_self();
  v65 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v66 = (_QWORD *)swift_allocObject();
  v66[2] = v65;
  v66[3] = sub_18AD5D7D8;
  v67 = v81;
  v68 = (uint64_t)v82;
  v66[4] = v78;
  v66[5] = v67;
  v66[6] = v39;
  v66[7] = v68;
  v69 = v80;
  v66[8] = v80;
  v66[9] = v33;
  aBlock[4] = sub_18AD5D854;
  aBlock[5] = v66;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18AD5B190;
  aBlock[3] = &block_descriptor_13;
  v70 = _Block_copy(aBlock);
  swift_retain();
  v71 = v81;
  v72 = v39;
  sub_18ACC022C(v68, v69);
  v73 = v33;
  swift_release();
  objc_msgSend(v64, sel_imageDataFromMetadata_size_completionHandler_, v73, v70, v52, v63);

  _Block_release(v70);
  sub_18ACB9CDC(v68, v69);

  sub_18ACB9CDC(v40, v77);
  swift_release();
}

uint64_t sub_18AD5D7AC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_18AD5D7D8(void *a1)
{
  uint64_t v1;

  sub_18AD5D0C0(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_18AD5D7E4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_18AD5D808()
{
  uint64_t v0;

  swift_release();
  swift_release();

  sub_18ACB9CDC(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  return swift_deallocObject();
}

void sub_18AD5D854(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_18AD5AF0C(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(void *))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(void **)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(void **)(v2 + 72));
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_18AD5D89C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_18AD26820();
  result = sub_18AF4F068();
  *a1 = v3;
  return result;
}

uint64_t sub_18AD5D8E8(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  sub_18AD26820();
  v2 = v1;
  return sub_18AF4F074();
}

BOOL sub_18AD5D978()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration)
      || *(_QWORD *)(v0 + OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData + 8) >> 60 != 15;
}

id sub_18AD5DB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  objc_super v14;

  v5 = (objc_class *)type metadata accessor for CNPosterPreviewViewConfiguration();
  v6 = (char *)objc_allocWithZone(v5);
  *(_OWORD *)&v6[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData] = xmmword_18AF889E0;
  swift_unknownObjectRetain_n();
  sub_18AF4E9A8();
  v7 = v6;
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (!v8)
  {
    swift_unknownObjectRelease();
    v8 = 0;
  }
  *(_QWORD *)&v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration] = v8;
  v9 = &v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_displayName];
  *(_QWORD *)v9 = a2;
  *((_QWORD *)v9 + 1) = a3;
  v10 = &v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor] = 0;
  v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP] = 0;
  v11 = &v7[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;

  v14.receiver = v7;
  v14.super_class = v5;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  swift_unknownObjectRelease();
  return v12;
}

void CNPosterPreviewViewConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNPosterPreviewViewConfiguration.__deallocating_deinit()
{
  return sub_18ACB677C(type metadata accessor for CNPosterPreviewViewConfiguration);
}

id sub_18AD5DEC4()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  return *v1;
}

void sub_18AD5DF64(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_18AD5DFB4(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_18AD5E014())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CNPosterPreviewViewWrapper.__allocating_init(with:contact:editingState:delegate:windowScene:)(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  id v11;
  id v12;

  v11 = objc_allocWithZone(v5);
  v12 = sub_18AD61C68(a1, a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v12;
}

id CNPosterPreviewViewWrapper.init(with:contact:editingState:delegate:windowScene:)(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;

  v8 = sub_18AD61C68(a1, a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v8;
}

uint64_t sub_18AD5E12C@<X0>(_BYTE *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char **v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t result;
  unint64_t v45;
  id v46;
  __int128 v47;

  swift_unknownObjectWeakInit();
  sub_18AF4F7DC();
  *(_BYTE *)(a4 + 24) = v47;
  *(_QWORD *)(a4 + 32) = *((_QWORD *)&v47 + 1);
  sub_18AF4F7DC();
  *(_BYTE *)(a4 + 40) = v47;
  *(_QWORD *)(a4 + 48) = *((_QWORD *)&v47 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF954D8);
  sub_18AF4F7DC();
  *(_OWORD *)(a4 + 56) = v47;
  sub_18AF4F7DC();
  *(_OWORD *)(a4 + 72) = v47;
  *(_QWORD *)(a4 + 120) = 0;
  *(_QWORD *)(a4 + 96) = 0;
  *(_QWORD *)(a4 + 104) = 0;
  *(_QWORD *)(a4 + 88) = 0;
  *(_BYTE *)(a4 + 112) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95508);
  sub_18AF4F7DC();
  *(_OWORD *)(a4 + 128) = v47;
  v8 = type metadata accessor for CNPosterPreviewView();
  v9 = (uint64_t *)(a4 + *(int *)(v8 + 64));
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  swift_storeEnumTagMultiPayload();
  v10 = a4 + *(int *)(v8 + 68);
  *(_QWORD *)v10 = swift_getKeyPath();
  *(_BYTE *)(v10 + 8) = 0;
  *(_QWORD *)a4 = a2;
  *(_QWORD *)(a4 + 8) = a3;
  swift_unknownObjectWeakAssign();
  v11 = *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID + 8];
  *(_QWORD *)(a4 + 88) = *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *(_QWORD *)(a4 + 96) = v11;
  v12 = a2;
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v13 = *(void **)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor];
  v14 = *(void **)(a4 + 104);
  *(_QWORD *)(a4 + 104) = v13;
  v15 = v13;

  *(_BYTE *)(a4 + 112) = a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP];
  v16 = *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText + 8];
  if (v16)
  {
    v17 = *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
    v18 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0)
      v18 = v17 & 0xFFFFFFFFFFFFLL;
    if (v18)
    {
      if (*(_QWORD *)(a4 + 8) == 1)
      {
        v19 = *(void **)a4;
        sub_18AF4E9A8();
        v20 = objc_msgSend(v19, sel_imageType);
        if (v20)
        {
          v21 = v20;
          sub_18AF4FC5C();

        }
        v22 = sub_18AD61B0C();
        swift_bridgeObjectRelease();
        if (v22 != 1)
        {
          swift_bridgeObjectRelease();
          goto LABEL_20;
        }
      }
      else
      {
        sub_18AF4E9A8();
      }
      objc_msgSend(v12, sel_mutableCopy);
      sub_18AF50154();
      swift_unknownObjectRelease();
      sub_18ACBE1B0(0, (unint64_t *)&qword_1EDF95440);
      swift_dynamicCast();
      v46 = v12;
      v23 = objc_msgSend((id)objc_opt_self(), sel_nameOrderForContact_, v12);
      sub_18AF4E9A8();
      v24 = sub_18AD16DE8(1);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      swift_bridgeObjectRelease();
      MEMORY[0x18D775E14](v24, v26, v28, v30);
      swift_bridgeObjectRelease();
      v31 = (void *)sub_18AF4FC38();
      swift_bridgeObjectRelease();
      v32 = &selRef_setGivenName_;
      if (v23 != (id)1)
        v32 = &selRef_setFamilyName_;
      objc_msgSend(0, *v32, v31);

      if (sub_18AF4FCB0() < 2)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v33 = sub_18AF4FCC8();
        v34 = sub_18AD5E914(v33, v17, v16);
        v36 = v35;
        v38 = v37;
        v40 = v39;
        swift_bridgeObjectRelease();
        MEMORY[0x18D775E14](v34, v36, v38, v40);
        swift_bridgeObjectRelease();
        v41 = (void *)sub_18AF4FC38();
        swift_bridgeObjectRelease();
        if (v23 == (id)1)
          objc_msgSend(0, sel_setFamilyName_, v41);
        else
          objc_msgSend(0, sel_setGivenName_, v41);

      }
      *(_QWORD *)(a4 + 120) = 0;
      v12 = v46;
    }
  }
LABEL_20:
  v42 = *(void **)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration];
  if (v42)
  {
    v43 = v42;

    swift_unknownObjectRelease();
    result = swift_release();
    *(_QWORD *)(a4 + 56) = v42;
    *(_QWORD *)(a4 + 64) = 0;
  }
  else
  {
    v45 = *(_QWORD *)&a1[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData + 8];
    if (v45 >> 60 != 15)
      __asm { BR              X10 }

    return swift_unknownObjectRelease();
  }
  return result;
}

id CNPosterPreviewViewWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CNPosterPreviewViewWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNPosterPreviewViewWrapper.__deallocating_deinit()
{
  return sub_18ACB677C(type metadata accessor for CNPosterPreviewViewWrapper);
}

unint64_t sub_18AD5E914(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_18AF4FCF8();
  __break(1u);
  return result;
}

void sub_18AD5E960()
{
  void *v0;
  id v1;
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_bounds);
  v3 = v2;

  v4 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;

  if (v6 >= v3)
    *(double *)&v7 = v3;
  else
    *(double *)&v7 = v6;
  qword_1EDF9A888 = v7;
}

void sub_18AD5E9FC()
{
  void *v0;
  id v1;
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_bounds);
  v3 = v2;

  v4 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;

  if (v3 > v6)
    *(double *)&v7 = v3;
  else
    *(double *)&v7 = v6;
  qword_1EDF9A890 = v7;
}

double sub_18AD5EA98()
{
  double v0;
  double result;

  if (qword_1EDF98278 != -1)
    swift_once();
  v0 = *(double *)&qword_1EDF9A888;
  if (qword_1EDF98280 != -1)
    swift_once();
  result = *(double *)&qword_1EDF9A890 * 0.55;
  *(double *)&qword_1EDF9A898 = v0 * 0.55;
  unk_1EDF9A8A0 = *(double *)&qword_1EDF9A890 * 0.55;
  return result;
}

uint64_t sub_18AD5EB2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)();
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t (*v61)(uint64_t, char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __n128 v65;
  char *v66;
  uint64_t (*v67)(char *, char *, uint64_t, __n128);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __n128 v71;
  char *v72;
  void (*v73)(char *, uint64_t, uint64_t, __n128);
  _QWORD *v74;
  _QWORD *v75;
  int *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(char *, uint64_t);
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  __int128 v104;
  unsigned __int8 v105;

  v96 = a2;
  v3 = type metadata accessor for CNPosterPreviewView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3, v6);
  v7 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v9);
  v97 = (uint64_t)&v81 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A920);
  v99 = *(_QWORD *)(v11 - 8);
  v100 = v11;
  v95 = *(_QWORD *)(v99 + 64);
  MEMORY[0x1E0C80A78](v11, v12);
  v93 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v14, v15);
  v92 = (char *)&v81 - v16;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A928);
  MEMORY[0x1E0C80A78](v98, v17);
  v91 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A930);
  v89 = *(_QWORD *)(v19 - 8);
  v90 = v19;
  MEMORY[0x1E0C80A78](v19, v20);
  v87 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A938);
  MEMORY[0x1E0C80A78](v88, v22);
  v24 = (char *)&v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v24 = sub_18AF4F0E0();
  *((_QWORD *)v24 + 1) = 0x4028000000000000;
  v24[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A940);
  sub_18AF4F35C();
  v101 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A948);
  sub_18ACBC6F4(&qword_1EDF9A950, &qword_1EDF9A948, MEMORY[0x1E0CDFB10]);
  sub_18AF4EC30();
  v25 = *(_QWORD *)(a1 + 32);
  LOBYTE(v102) = *(_BYTE *)(a1 + 24);
  v103 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95220);
  sub_18AF4F800();
  v81 = *((_QWORD *)&v104 + 1);
  v82 = v105;
  v86 = a1;
  v26 = v97;
  sub_18ACCDD64(a1, v97, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v27 = *(unsigned __int8 *)(v4 + 80);
  v28 = (v27 + 16) & ~v27;
  v85 = v28 + v5;
  v84 = v27 | 7;
  v29 = swift_allocObject();
  v83 = v28;
  sub_18AD62BC0(v26, v29 + v28);
  sub_18ACCDD64(a1, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v30 = swift_allocObject();
  sub_18AD62BC0((uint64_t)v7, v30 + v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A958);
  sub_18ACBC6F4(&qword_1EDF9A960, &qword_1EDF9A938, MEMORY[0x1E0CDFCC0]);
  v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A968);
  v32 = sub_18ACD6098(&qword_1EDF9A970, &qword_1EDF9A968, (uint64_t (*)(void))sub_18AD62C54, MEMORY[0x1E0CDC500]);
  *(_QWORD *)&v104 = v31;
  *((_QWORD *)&v104 + 1) = v32;
  swift_getOpaqueTypeConformance2();
  v33 = v87;
  sub_18AF4F5C0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18ACCDE68((uint64_t)v24, &qword_1EDF9A938);
  v34 = v86;
  v35 = v97;
  sub_18ACCDD64(v86, v97, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v36 = swift_allocObject();
  v37 = v83;
  sub_18AD62BC0(v35, v36 + v83);
  v39 = v89;
  v38 = v90;
  v40 = (uint64_t)v91;
  (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v91, v33, v90);
  v41 = (void (**)())(v40 + *(int *)(v98 + 36));
  *v41 = sub_18AD62CA0;
  v41[1] = (void (*)())v36;
  v41[2] = 0;
  v41[3] = 0;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v38);
  v104 = *(_OWORD *)(v34 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F7E8();
  v42 = v34;
  sub_18ACCDD64(v34, v35, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v43 = swift_allocObject();
  sub_18AD62BC0(v35, v43 + v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF954D8);
  sub_18AD62CE0();
  sub_18AD3F70C();
  v44 = v92;
  sub_18AF4F680();
  swift_release();

  sub_18ACCDE68(v40, &qword_1EDF9A928);
  v45 = v99;
  v46 = v93;
  (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v93, v44, v100);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A988);
  v48 = *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64);
  v49 = *(char **)(v47 - 8);
  MEMORY[0x1E0C80A78](v47, v50);
  v97 = (uint64_t)&v81 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v51, v52);
  v54 = (char *)&v81 - v53;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A990);
  MEMORY[0x1E0C80A78](v55, v56);
  v58 = (char *)&v81 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v58 = sub_18AF4F0E0();
  *((_QWORD *)v58 + 1) = 0x4028000000000000;
  v58[16] = 0;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A998);
  sub_18AD5FB6C(v42, (uint64_t)&v58[*(int *)(v59 + 44)]);
  sub_18AF4F374();
  sub_18ACBC6F4(&qword_1EDF9A9A0, &qword_1EDF9A990, MEMORY[0x1E0CDFCC0]);
  sub_18AF4F590();
  sub_18ACCDE68((uint64_t)v58, &qword_1EDF9A990);
  v60 = v49;
  v92 = v49;
  v61 = (uint64_t (*)(uint64_t, char *, uint64_t))*((_QWORD *)v49 + 4);
  v62 = v97;
  v63 = v61(v97, v54, v47);
  v65 = MEMORY[0x1E0C80A78](v63, v64);
  v66 = (char *)&v81 - v94;
  v67 = *(uint64_t (**)(char *, char *, uint64_t, __n128))(v45 + 16);
  v68 = v100;
  v69 = v67((char *)&v81 - v94, v46, v100, v65);
  v71 = MEMORY[0x1E0C80A78](v69, v70);
  v72 = (char *)&v81 - v98;
  v73 = (void (*)(char *, uint64_t, uint64_t, __n128))*((_QWORD *)v60 + 2);
  v73((char *)&v81 - v98, v62, v47, v71);
  v74 = v96;
  *v96 = 0;
  *((_BYTE *)v74 + 8) = 1;
  v75 = v74;
  v76 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9A8);
  ((void (*)(char *, char *, uint64_t))v67)((char *)v75 + v76[12], v66, v68);
  v77 = (uint64_t)v75 + v76[16];
  *(_QWORD *)v77 = 0;
  *(_BYTE *)(v77 + 8) = 1;
  ((void (*)(char *, char *, uint64_t))v73)((char *)v75 + v76[20], v72, v47);
  v78 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v92 + 1);
  v78(v62, v47);
  v79 = *(void (**)(char *, uint64_t))(v99 + 8);
  v79(v46, v68);
  v78((uint64_t)v72, v47);
  return ((uint64_t (*)(char *, uint64_t))v79)(v66, v68);
}

void sub_18AD5F328(uint64_t a1)
{
  void *v2;
  void *v3;

  LOBYTE(v3) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95220);
  sub_18AF4F7F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F7E8();
  if (v3)

  LOBYTE(v3) = v3 != 0;
  sub_18AF4F7F4();
  sub_18AF4F7E8();
  if (v3)
  {
    v2 = (void *)MEMORY[0x18D7779A4](a1 + 16);
    if (v2)
    {
      objc_msgSend(v2, sel_previewViewDidCreateWithPosterConfiguration_, v3);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

uint64_t sub_18AD5F43C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for CNExistingWallpaperEditorView(0);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (_QWORD *)((char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A968);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)sub_18AD60A70();

  if (!v10)
  {
    sub_18AF4FEF0();
    v11 = CNUILogPosters();
    sub_18AF4E8B8();

  }
  v19 = *(_OWORD *)(v1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F800();
  v12 = v20;
  v13 = v21;
  v14 = v22;
  result = sub_18AD60A70();
  if (result)
  {
    v16 = result;
    v17 = *(void **)v1;
    *(_QWORD *)((char *)v5 + *(int *)(v2 + 28)) = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
    swift_storeEnumTagMultiPayload();
    *v5 = v12;
    v5[1] = v13;
    v5[2] = v14;
    v5[3] = v16;
    v5[4] = v17;
    v18 = v17;
    LOBYTE(v16) = sub_18AF4F380();
    sub_18ACCDD64((uint64_t)v5, (uint64_t)v9, type metadata accessor for CNExistingWallpaperEditorView);
    v9[*(int *)(v6 + 36)] = v16;
    sub_18ACEF088((uint64_t)v5, type metadata accessor for CNExistingWallpaperEditorView);
    sub_18ACD6098(&qword_1EDF9A970, &qword_1EDF9A968, (uint64_t (*)(void))sub_18AD62C54, MEMORY[0x1E0CDC500]);
    sub_18AF4F6B0();
    return sub_18ACCDE68((uint64_t)v9, &qword_1EDF9A968);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_18AD5F654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  id v37;
  __int128 aBlock;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  uint64_t (*v41)();
  uint64_t v42;
  void *v43;

  v1 = v0;
  v2 = type metadata accessor for CNPosterPreviewView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2, v5);
  v6 = (id *)((char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v34 - v9;
  v12 = v0 + *(int *)(v11 + 68);
  v13 = *(id *)v12;
  v14 = *(_BYTE *)(v12 + 8);
  sub_18ACFFE7C(*(id *)v12, v14);
  v15 = (void *)sub_18ACCACB0(v13, v14);
  sub_18ACCDF90(v13, v14);
  if (v15)
  {
    aBlock = *(_OWORD *)(v1 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
    sub_18AF4F7E8();
    v16 = v43;
    if (v43)
    {
      v17 = (void *)objc_opt_self();
      v18 = *(id *)v1;
      sub_18ACCDD64(v1, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      v19 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v20 = swift_allocObject();
      sub_18AD62BC0((uint64_t)v10, v20 + v19);
      v41 = sub_18AD632E8;
      v42 = v20;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v39 = sub_18ACD7824;
      v40 = &block_descriptor_14;
      v21 = _Block_copy(&aBlock);
      v22 = v16;
      swift_release();
      objc_msgSend(v17, sel_incomingCallSnapshotForConfiguration_contact_includingCallButtons_windowScene_completionBlock_, v22, v18, 1, v15, v21);

      _Block_release(v21);
      v23 = v22;
    }
    else
    {
      if (qword_1EDF949F0 != -1)
        swift_once();
      v37 = (id)qword_1EDF949E8;
      if (*(_QWORD *)(v1 + 8) == 1)
      {
        v24 = objc_msgSend(*(id *)v1, sel_imageType);
        if (v24)
        {
          v25 = v24;
          sub_18AF4FC5C();

        }
        v36 = sub_18AD61B0C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v36 = 1;
      }
      v26 = *(void **)(v1 + 120);
      sub_18ACCDD64(v1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      if (v26)
        v27 = v26;
      else
        v27 = *v6;
      v28 = v26;
      sub_18ACEF088((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      v30 = *(_QWORD *)(v1 + 96);
      v29 = *(void **)(v1 + 104);
      v35 = *(_QWORD *)(v1 + 88);
      v31 = *(unsigned __int8 *)(v1 + 112);
      sub_18ACCDD64(v1, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      v32 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      v33 = swift_allocObject();
      sub_18AD62BC0((uint64_t)v10, v33 + v32);
      *(_QWORD *)(v33 + ((v4 + v32 + 7) & 0xFFFFFFFFFFFFFFF8)) = v15;
      v23 = v37;
      v22 = v15;
      sub_18AD5D1BC(v36, v27, v29, v35, v30, v31, (uint64_t)v23, (void (*)(void))sub_18AD63294, v33, v23, v36);
      swift_release();

    }
  }
}

void sub_18AD5F9D0()
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
  char *v9;
  uint64_t v10;
  id v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = type metadata accessor for CNPosterPreviewView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x1E0C80A78](v1, v4);
  v5 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0 + *(int *)(v1 + 68);
  v11 = *(id *)v10;
  v12 = *(_BYTE *)(v10 + 8);
  sub_18ACFFE7C(*(id *)v10, v12);
  v13 = (void *)sub_18ACCACB0(v11, v12);
  sub_18ACCDF90(v11, v12);
  if (v13)
  {
    v14 = sub_18AF4FDE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
    sub_18ACCDD64(v0, (uint64_t)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    sub_18AF4FDC4();
    v15 = v13;
    v16 = sub_18AF4FDB8();
    v17 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    v18 = (v3 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
    v19 = swift_allocObject();
    v20 = MEMORY[0x1E0DF06E8];
    *(_QWORD *)(v19 + 16) = v16;
    *(_QWORD *)(v19 + 24) = v20;
    sub_18AD62BC0((uint64_t)v5, v19 + v17);
    *(_QWORD *)(v19 + v18) = v15;
    sub_18ACE3AB8((uint64_t)v9, (uint64_t)&unk_1EDF9AA08, v19);
    swift_release();

  }
}

uint64_t sub_18AD5FB6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v71 = a2;
  v3 = type metadata accessor for CNPosterPreviewView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3, v6);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9B0);
  v70 = *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64);
  MEMORY[0x1E0C80A78](v65, v7);
  v69 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  v72 = (uint64_t)&v61 - v69;
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v61 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9B8);
  v62 = *(_QWORD *)(v13 - 8);
  v63 = v13;
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9C0);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17, v19);
  v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = (uint64_t)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18ACCDD64(a1, v64, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v22 = *(unsigned __int8 *)(v4 + 80);
  v67 = ((v22 + 16) & ~v22) + v5;
  v68 = (v22 + 16) & ~v22;
  v23 = v68;
  v66 = v22 | 7;
  v24 = swift_allocObject();
  sub_18AD62BC0((uint64_t)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  v73 = a1;
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9C8);
  sub_18ACD6098(&qword_1EDF9A9D0, &qword_1EDF9A9C8, (uint64_t (*)(void))sub_18AD62E44, MEMORY[0x1E0CDA228]);
  sub_18AF4F818();
  v26 = sub_18AF4F2C0();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26, v28);
  v30 = (char *)&v61 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4F2B4();
  sub_18AD62EA8();
  sub_18ACD59B0();
  sub_18AF4F560();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  LOBYTE(v21) = sub_18AD600EC();
  KeyPath = swift_getKeyPath();
  v32 = swift_allocObject();
  *(_BYTE *)(v32 + 16) = (v21 & 1) == 0;
  v34 = v62;
  v33 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v12, v16, v63);
  v35 = (uint64_t *)&v12[*(int *)(v65 + 36)];
  *v35 = KeyPath;
  v35[1] = (uint64_t)sub_18ACDFAC8;
  v35[2] = v32;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v16, v33);
  sub_18ACD5C10((uint64_t)v12, v72, &qword_1EDF9A9B0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9F0);
  v36 = *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64);
  MEMORY[0x1E0C80A78](v65, v37);
  v38 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
  v39 = (char *)&v61 - v38;
  MEMORY[0x1E0C80A78](v40, v41);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98BE8);
  v43 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42, v44);
  v46 = (char *)&v61 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = v25;
  v48 = v64;
  sub_18ACCDD64(v47, v64, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v49 = swift_allocObject();
  sub_18AD62BC0(v48, v49 + v68);
  sub_18AF4F818();
  if ((sub_18AD601F0() & 1) != 0)
    v50 = 1.0;
  else
    v50 = 0.0;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))((char *)&v61 - v38, v46, v42);
  *(double *)((char *)&v61 + *(int *)(v65 + 36) - v38) = v50;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v42);
  v51 = sub_18ACD5C10((uint64_t)&v61 - v38, (uint64_t)&v61 - v38, &qword_1EDF9A9F0);
  MEMORY[0x1E0C80A78](v51, v52);
  v53 = (char *)&v61 - v69;
  v54 = v72;
  v55 = sub_18ACCDEA4(v72, (uint64_t)&v61 - v69, &qword_1EDF9A9B0);
  MEMORY[0x1E0C80A78](v55, v56);
  v57 = (char *)&v61 - v38;
  sub_18ACCDEA4((uint64_t)&v61 - v38, (uint64_t)&v61 - v38, &qword_1EDF9A9F0);
  v58 = v71;
  sub_18ACCDEA4((uint64_t)v53, v71, &qword_1EDF9A9B0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A9F8);
  sub_18ACCDEA4((uint64_t)v57, v58 + *(int *)(v59 + 48), &qword_1EDF9A9F0);
  sub_18ACCDE68((uint64_t)v39, &qword_1EDF9A9F0);
  sub_18ACCDE68(v54, &qword_1EDF9A9B0);
  sub_18ACCDE68((uint64_t)v57, &qword_1EDF9A9F0);
  return sub_18ACCDE68((uint64_t)v53, &qword_1EDF9A9B0);
}

uint64_t sub_18AD600EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  __int128 v8;
  id v9;

  v1 = v0;
  v2 = type metadata accessor for CNPosterPreviewView();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F7E8();
  v6 = v9;

  sub_18ACCDD64(v1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  if (v6)
  {
    sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  }
  else
  {
    v8 = *(_OWORD *)(v5 + 72);
    sub_18AF4F7E8();
    sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    if (!v9)
      return 0;

  }
  return 1;
}

uint64_t sub_18AD601F0()
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
  uint64_t (*v10)(_QWORD);
  id v11;
  uint64_t v12;
  char v13;
  __int128 v15;
  id v16;

  v1 = type metadata accessor for CNPosterPreviewView();
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(v0 + 8);
  sub_18ACCDD64(v0, (uint64_t)&v15 - v7, v10);
  if (v9 == 1)
  {
    v15 = *(_OWORD *)(v8 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
    sub_18AF4F7E8();
    v11 = v16;

    sub_18ACCDD64((uint64_t)v8, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    if (v11)
    {
      v12 = *((_QWORD *)v4 + 6);
      LOBYTE(v15) = v4[40];
      *((_QWORD *)&v15 + 1) = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95220);
      sub_18AF4F7E8();
      sub_18ACEF088((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      sub_18ACEF088((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      v13 = v16 ^ 1;
    }
    else
    {
      sub_18ACEF088((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      sub_18ACEF088((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      v13 = 1;
    }
  }
  else
  {
    sub_18ACEF088((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    v13 = 0;
  }
  return v13 & 1;
}

void sub_18AD6035C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 aBlock;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  uint64_t (*v19)();
  uint64_t v20;
  void *v21;

  v6 = type metadata accessor for CNPosterPreviewView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6, v9);
  aBlock = *(_OWORD *)(a2 + 72);
  v21 = a1;
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F7F4();
  v11 = (void *)objc_opt_self();
  v12 = *(_QWORD *)a2;
  sub_18ACCDD64(a2, (uint64_t)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  sub_18AD62BC0((uint64_t)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  v19 = sub_18AD632E8;
  v20 = v14;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v17 = sub_18ACD7824;
  v18 = &block_descriptor_45;
  v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_incomingCallSnapshotForConfiguration_contact_includingCallButtons_windowScene_completionBlock_, v10, v12, 1, a3, v15);
  _Block_release(v15);
}

uint64_t sub_18AD604E0(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95230);
  return sub_18AF4F7F4();
}

uint64_t sub_18AD6052C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[11] = a4;
  v5[12] = a5;
  v6 = sub_18AF4EE1C();
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v5[16] = swift_task_alloc();
  v5[17] = sub_18AF4FDC4();
  v5[18] = sub_18AF4FDB8();
  v5[19] = sub_18AF4FD88();
  v5[20] = v7;
  return swift_task_switch();
}

uint64_t sub_18AD605D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;
  void (*v8)(uint64_t, uint64_t);
  _QWORD *v9;

  v1 = v0[16];
  v2 = v0[14];
  v3 = v0[15];
  v4 = v0[13];
  v5 = (uint64_t *)v0[11];
  type metadata accessor for CNPosterOnboardingSettingsAnimationFactory();
  swift_initStaticObject();
  v6 = *v5;
  type metadata accessor for CNPosterPreviewView();
  sub_18ACCAC7C(v1);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v3, *MEMORY[0x1E0CD9A98], v4);
  v7 = sub_18AF4EE10();
  v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v3, v4);
  v8(v1, v4);
  v0[21] = sub_18AF4FDB8();
  v9 = (_QWORD *)swift_task_alloc();
  v0[22] = v9;
  *v9 = v0;
  v9[1] = sub_18AD606F4;
  return sub_18ACBE1E8((uint64_t)(v0 + 2), v6, v7 & 1, v0[12], 0);
}

uint64_t sub_18AD606F4()
{
  id **v0;
  id *v1;

  v1 = *v0;
  swift_task_dealloc();

  sub_18ACD5C10((uint64_t)(v1 + 3), (uint64_t)(v1 + 7), &qword_1EDF95418);
  sub_18ACB9160(v1 + 7);
  sub_18ACD5C10((uint64_t)(v1 + 4), (uint64_t)(v1 + 8), &qword_1EDF95418);
  sub_18ACB9160(v1 + 8);
  sub_18ACD5C10((uint64_t)(v1 + 5), (uint64_t)(v1 + 9), &qword_1EDF95418);
  sub_18ACB9160(v1 + 9);
  sub_18ACD5C10((uint64_t)(v1 + 6), (uint64_t)(v1 + 10), &qword_1EDF95418);
  sub_18ACB9160(v1 + 10);
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD607F8()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_18AD60830()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_18AD60874()
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
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD);
  id v12;
  uint64_t v13;
  void *result;
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  id v19;

  v1 = v0;
  v2 = type metadata accessor for CNPosterPreviewView();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v18 - v8;
  v10 = *(_QWORD *)(v0 + 8);
  sub_18ACCDD64(v1, (uint64_t)&v18 - v8, v11);
  if (v10 == 1)
  {
    v18 = *(_OWORD *)(v9 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
    sub_18AF4F7E8();
    v12 = v19;

    sub_18ACCDD64((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    if (!v12)
    {
      sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      sub_18ACEF088((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
      goto LABEL_9;
    }
    v13 = *((_QWORD *)v5 + 6);
    LOBYTE(v18) = v5[40];
    *((_QWORD *)&v18 + 1) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95220);
    sub_18AF4F7E8();
    sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    sub_18ACEF088((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    if ((v19 & 1) == 0)
    {
LABEL_9:
      result = (void *)sub_18AD60A70();
      if (result)
      {

        v17 = *(_QWORD *)(v1 + 32);
        LOBYTE(v18) = *(_BYTE *)(v1 + 24);
        *((_QWORD *)&v18 + 1) = v17;
        LOBYTE(v19) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95220);
        return (void *)sub_18AF4F7F4();
      }
      return result;
    }
  }
  else
  {
    sub_18ACEF088((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  }
  result = (void *)MEMORY[0x18D7779A4](v1 + 16);
  if (result)
  {
    v15 = result;
    v18 = *(_OWORD *)(v1 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
    sub_18AF4F7E8();
    v16 = v19;
    objc_msgSend(v15, sel_previewViewDidFinishWithPosterConfiguration_, v19);

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_18AD60A70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = v0;
  v2 = type metadata accessor for CNPosterPreviewView();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_OWORD *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A978);
  sub_18AF4F7E8();
  v6 = v9;
  sub_18ACCDD64(v1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  if (v6)
  {
    sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  }
  else
  {
    v8 = *(_OWORD *)(v5 + 72);
    sub_18AF4F7E8();
    sub_18ACEF088((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
    return v9;
  }
  return v6;
}

uint64_t sub_18AD60B60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[32];
  _BYTE v27[215];

  v2 = sub_18AF4F0A4();
  sub_18AD60CD4((uint64_t)v27);
  v25 = *(_OWORD *)&v27[160];
  *(_OWORD *)v26 = *(_OWORD *)&v27[176];
  *(_OWORD *)&v26[9] = *(_OWORD *)&v27[185];
  v21 = *(_OWORD *)&v27[96];
  v22 = *(_OWORD *)&v27[112];
  v23 = *(_OWORD *)&v27[128];
  v24 = *(_OWORD *)&v27[144];
  v17 = *(_OWORD *)&v27[32];
  v18 = *(_OWORD *)&v27[48];
  v19 = *(_OWORD *)&v27[64];
  v20 = *(_OWORD *)&v27[80];
  v15 = *(_OWORD *)v27;
  v16 = *(_OWORD *)&v27[16];
  v3 = sub_18AF4F398();
  result = sub_18AF4EC24();
  *(_OWORD *)&v27[151] = v24;
  *(_OWORD *)&v27[167] = v25;
  *(_OWORD *)&v27[183] = *(_OWORD *)v26;
  *(_OWORD *)&v27[199] = *(_OWORD *)&v26[16];
  *(_OWORD *)&v27[87] = v20;
  *(_OWORD *)&v27[103] = v21;
  *(_OWORD *)&v27[119] = v22;
  *(_OWORD *)&v27[135] = v23;
  *(_OWORD *)&v27[23] = v16;
  *(_OWORD *)&v27[39] = v17;
  *(_OWORD *)&v27[55] = v18;
  *(_OWORD *)&v27[71] = v19;
  *(_OWORD *)&v27[7] = v15;
  v5 = *(_OWORD *)&v27[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v27[160];
  *(_OWORD *)(a1 + 193) = v5;
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v27[192];
  v6 = *(_OWORD *)&v27[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v27[96];
  *(_OWORD *)(a1 + 129) = v6;
  v7 = *(_OWORD *)&v27[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v27[128];
  *(_OWORD *)(a1 + 161) = v7;
  v8 = *(_OWORD *)&v27[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v27[32];
  *(_OWORD *)(a1 + 65) = v8;
  v9 = *(_OWORD *)&v27[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v27[64];
  *(_OWORD *)(a1 + 97) = v9;
  v10 = *(_OWORD *)&v27[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v27;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)&v27[207];
  *(_OWORD *)(a1 + 33) = v10;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 232) = v3;
  *(_QWORD *)(a1 + 240) = v11;
  *(_QWORD *)(a1 + 248) = v12;
  *(_QWORD *)(a1 + 256) = v13;
  *(_QWORD *)(a1 + 264) = v14;
  *(_BYTE *)(a1 + 272) = 0;
  return result;
}

uint64_t sub_18AD60CD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  void *v4;
  id v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF95230);
  sub_18AF4F800();
  if (qword_1EDF98288 != -1)
    swift_once();
  sub_18AF4F974();
  sub_18AF4ECCC();
  v2 = sub_18AF4F98C();
  sub_18AF4F7E8();
  v3 = sub_18AF4F3A4();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_mainScreen);
  objc_msgSend(v5, sel_bounds);

  v6 = objc_msgSend(v4, sel_mainScreen);
  objc_msgSend(v6, sel_bounds);

  result = sub_18AF4EC24();
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v14;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = v15;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = v13;
  *(_BYTE *)(a1 + 104) = v14;
  *(_QWORD *)(a1 + 112) = v15;
  *(_BYTE *)(a1 + 120) = v16;
  *(_QWORD *)(a1 + 128) = v17;
  *(_QWORD *)(a1 + 136) = v18;
  *(_QWORD *)(a1 + 144) = v2;
  *(_QWORD *)(a1 + 152) = v12;
  *(_BYTE *)(a1 + 160) = v3;
  *(_QWORD *)(a1 + 168) = v8;
  *(_QWORD *)(a1 + 176) = v9;
  *(_QWORD *)(a1 + 184) = v10;
  *(_QWORD *)(a1 + 192) = v11;
  *(_BYTE *)(a1 + 200) = 0;
  return result;
}

double sub_18AD60F04@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
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
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double result;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  __int128 v54;

  v2 = sub_18AF4FC2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD601F0();
  sub_18AF4FBE4();
  v7 = sub_18ACC13F4((uint64_t)v6, MEMORY[0x1E0DEE9D8]);
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(_QWORD *)&v30[0] = v7;
  *((_QWORD *)&v30[0] + 1) = v9;
  sub_18ACB7660();
  v10 = sub_18AF4F518();
  v12 = v11;
  v14 = v13 & 1;
  sub_18AF4F4A0();
  v15 = sub_18AF4F500();
  v29 = v16;
  LOBYTE(v2) = v17;
  v19 = v18;
  swift_release();
  sub_18ACD5A1C(v10, v12, v14);
  swift_bridgeObjectRelease();
  sub_18AF4F974();
  sub_18AF4ECCC();
  v20 = v29;
  v46 = v15;
  v47 = v29;
  v48 = v2 & 1;
  v49 = v19;
  v50 = v41;
  v51 = v42;
  v52 = v43;
  v53 = v44;
  v54 = v45;
  sub_18AF4F974();
  sub_18AD652D8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v30, 0.0, 1, 0.0, 1);
  sub_18ACD5A1C(v15, v20, v2 & 1);
  swift_bridgeObjectRelease();
  v21 = v38;
  a1[8] = v37;
  a1[9] = v21;
  v22 = v40;
  a1[10] = v39;
  a1[11] = v22;
  v23 = v34;
  a1[4] = v33;
  a1[5] = v23;
  v24 = v36;
  a1[6] = v35;
  a1[7] = v24;
  v25 = v30[1];
  *a1 = v30[0];
  a1[1] = v25;
  result = *(double *)&v31;
  v27 = v32;
  a1[2] = v31;
  a1[3] = v27;
  return result;
}

void *sub_18AD6117C(uint64_t a1)
{
  void *result;

  result = (void *)MEMORY[0x18D7779A4](a1 + 16);
  if (result)
  {
    objc_msgSend(result, sel_previewViewDidSelectUseDifferentPoster);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_18AD611C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  _QWORD v26[4];

  v2 = sub_18AF4FC2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4FBE4();
  v7 = sub_18ACC13F4((uint64_t)v6, MEMORY[0x1E0DEE9D8]);
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v26[2] = v7;
  v26[3] = v9;
  sub_18ACB7660();
  v10 = sub_18AF4F518();
  v12 = v11;
  LOBYTE(v9) = v13 & 1;
  sub_18AF4F3D4();
  v14 = sub_18AF4F500();
  v16 = v15;
  v18 = v17;
  swift_release();
  sub_18ACD5A1C(v10, v12, v9);
  swift_bridgeObjectRelease();
  sub_18AF4F428();
  v19 = sub_18AF4F4B8();
  v21 = v20;
  LOBYTE(v7) = v22;
  v24 = v23;
  sub_18ACD5A1C(v14, v16, v18 & 1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v19;
  *(_QWORD *)(a1 + 8) = v21;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v24;
  return result;
}

uint64_t sub_18AD61358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A908);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = sub_18AF4F0E0();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A910);
  sub_18AD5EB2C(v2, &v7[*(int *)(v8 + 44)]);
  LOBYTE(v2) = sub_18AF4F398();
  sub_18AF4EC24();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  sub_18ACCDEA4((uint64_t)v7, a1, &qword_1EDF9A908);
  v17 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A918) + 36);
  *(_BYTE *)v17 = v2;
  *(_QWORD *)(v17 + 8) = v10;
  *(_QWORD *)(v17 + 16) = v12;
  *(_QWORD *)(v17 + 24) = v14;
  *(_QWORD *)(v17 + 32) = v16;
  *(_BYTE *)(v17 + 40) = 0;
  return sub_18ACCDE68((uint64_t)v7, &qword_1EDF9A908);
}

uint64_t sub_18AD6145C()
{
  return sub_18AF4EF24();
}

uint64_t sub_18AD6147C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_18AF4EE1C();
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  return sub_18AF4EF30();
}

id sub_18AD614F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, char a9, uint64_t a10, uint64_t a11)
{
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  id v31;
  objc_super v34;

  v13 = a5;
  v14 = a4;
  v17 = a11;
  v18 = (uint64_t *)&v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData];
  *v18 = a2;
  v18[1] = a3;
  if (a1)
  {
    v19 = a7;
    v20 = v11;
    sub_18ACD15B4(a2, a3);
    swift_unknownObjectRetain();
    objc_opt_self();
    v21 = swift_dynamicCastObjCClass();
    if (!v21)
    {
      swift_unknownObjectRelease();
      v21 = 0;
    }
    v22 = a6;
    v23 = a9;
  }
  else
  {
    v19 = a7;
    v27 = v11;
    sub_18ACD15B4(a2, a3);
    v23 = a9;
    v13 = a5;
    v14 = a4;
    v22 = a6;
    v17 = a11;
    v21 = 0;
  }
  *(_QWORD *)&v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration] = v21;
  v28 = &v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_displayName];
  *(_QWORD *)v28 = v14;
  *((_QWORD *)v28 + 1) = v13;
  v29 = &v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *(_QWORD *)v29 = v22;
  *((_QWORD *)v29 + 1) = v19;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor] = a8;
  v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP] = v23 & 1;
  v30 = &v11[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
  *(_QWORD *)v30 = a10;
  *((_QWORD *)v30 + 1) = v17;
  v31 = a8;

  v34.receiver = v11;
  v34.super_class = (Class)type metadata accessor for CNPosterPreviewViewConfiguration();
  return objc_msgSendSuper2(&v34, sel_init);
}

id sub_18AD6167C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  objc_class *v12;
  _BYTE *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  objc_super v19;

  v12 = (objc_class *)type metadata accessor for CNPosterPreviewViewConfiguration();
  v13 = objc_allocWithZone(v12);
  *(_OWORD *)&v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData] = xmmword_18AF889E0;
  *(_QWORD *)&v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration] = 0;
  v14 = &v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_displayName];
  *v14 = a4;
  v14[1] = a5;
  v15 = &v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *v15 = a1;
  v15[1] = a2;
  *(_QWORD *)&v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor] = a3;
  v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP] = a6;
  v16 = &v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
  *v16 = 0;
  v16[1] = 0;
  v19.receiver = v13;
  v19.super_class = v12;
  sub_18AF4E9A8();
  sub_18AF4E9A8();
  v17 = a3;
  return objc_msgSendSuper2(&v19, sel_init);
}

id sub_18AD6176C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  objc_class *v16;
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  objc_super v23;

  v16 = (objc_class *)type metadata accessor for CNPosterPreviewViewConfiguration();
  v17 = objc_allocWithZone(v16);
  *(_OWORD *)&v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData] = xmmword_18AF889E0;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration] = 0;
  v18 = &v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_displayName];
  *v18 = a4;
  v18[1] = a5;
  v19 = &v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *v19 = a1;
  v19[1] = a2;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor] = a3;
  v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP] = a6;
  v20 = &v17[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
  *v20 = a7;
  v20[1] = a8;
  v23.receiver = v17;
  v23.super_class = v16;
  sub_18AF4E9A8();
  sub_18AF4E9A8();
  v21 = a3;
  sub_18AF4E9A8();
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t type metadata accessor for CNPosterPreviewViewConfiguration()
{
  return objc_opt_self();
}

id sub_18AD61894(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  objc_class *v12;
  char *v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  char *v27;
  id v28;
  objc_super v30;
  id v31[2];

  v31[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_self();
  v9 = (void *)sub_18AF4E474();
  v31[0] = 0;
  v10 = objc_msgSend(v8, sel_unarchiveCNConfigurationFromData_error_, v9, v31);

  v11 = v31[0];
  if (!v10)
  {
    v20 = v31[0];
    v21 = (void *)sub_18AF4E42C();

    swift_willThrow();
    sub_18AF4FEF0();
    v22 = CNUILogPosters();
    sub_18AF4E8B8();

    v12 = (objc_class *)type metadata accessor for CNPosterPreviewViewConfiguration();
    v23 = (char *)objc_allocWithZone(v12);
    v24 = (uint64_t *)&v23[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData];
    *v24 = a1;
    v24[1] = a2;
    sub_18AF4E9A8();
    sub_18ACC022C(a1, a2);
    v18 = v23;
    goto LABEL_5;
  }
  v12 = (objc_class *)type metadata accessor for CNPosterPreviewViewConfiguration();
  v13 = (char *)objc_allocWithZone(v12);
  v14 = (uint64_t *)&v13[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterArchiveData];
  *v14 = a1;
  v14[1] = a2;
  v15 = v10;
  v16 = v11;
  v17 = v15;
  sub_18AF4E9A8();
  sub_18ACC022C(a1, a2);
  v18 = v13;
  objc_opt_self();
  v19 = swift_dynamicCastObjCClass();
  if (!v19)
  {

LABEL_5:
    v19 = 0;
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_posterConfiguration] = v19;
  v25 = &v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_displayName];
  *(_QWORD *)v25 = a3;
  *((_QWORD *)v25 + 1) = a4;
  v26 = &v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_photoAssetID];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_backgroundColor] = 0;
  v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_isEditingSNaP] = 0;
  v27 = &v18[OBJC_IVAR____TtC10ContactsUI32CNPosterPreviewViewConfiguration_monogramText];
  *(_QWORD *)v27 = 0;
  *((_QWORD *)v27 + 1) = 0;

  type metadata accessor for CNPosterPreviewViewConfiguration();
  v30.receiver = v18;
  v30.super_class = v12;
  v28 = objc_msgSendSuper2(&v30, sel_init);
  swift_unknownObjectRelease();

  return v28;
}

uint64_t sub_18AD61B0C()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v1 = objc_msgSend(*v0, sel_imageType);
  if (!v1)
  {
    sub_18AF4FC5C();
    goto LABEL_10;
  }
  v2 = v1;
  v3 = sub_18AF4FC5C();
  v5 = v4;

  v6 = sub_18AF4FC5C();
  if (!v5)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    sub_18AF4FC5C();
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v6 == v3 && v5 == v7)
  {
    v10 = 2;
    swift_bridgeObjectRelease_n();
    return v10;
  }
  v9 = sub_18AF50418();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    if (sub_18AF4FC5C() == v3 && v5 == v11)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
    v13 = sub_18AF50418();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = 0;
    if ((v13 & 1) != 0)
      return v10;
    return 1;
  }
  swift_bridgeObjectRelease();
  return 2;
}

id sub_18AD61C68(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  id v22;
  _BYTE *v23;
  uint64_t KeyPath;
  uint64_t *v25;
  id v26;
  id v27;
  objc_class *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;

  v32 = a3;
  v9 = type metadata accessor for CNPosterPreviewView();
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A8E8);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v31 - v19;
  v21 = v5;
  swift_unknownObjectRetain();
  v22 = a2;
  v23 = a1;
  sub_18AD5E12C(v23, v22, v32, (uint64_t)v12);
  KeyPath = swift_getKeyPath();
  sub_18ACCDD64((uint64_t)v12, (uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  v25 = (uint64_t *)&v20[*(int *)(v13 + 36)];
  *v25 = KeyPath;
  v25[1] = (uint64_t)a5;
  v26 = a5;
  sub_18ACEF088((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for CNPosterPreviewView);
  sub_18ACCDEA4((uint64_t)v20, (uint64_t)v16, &qword_1EDF9A8E8);
  v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9A8F0));
  *(_QWORD *)&v21[OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController] = sub_18AF4F134();

  v28 = (objc_class *)type metadata accessor for CNPosterPreviewViewWrapper();
  v33.receiver = v21;
  v33.super_class = v28;
  v29 = objc_msgSendSuper2(&v33, sel_init);
  sub_18ACCDE68((uint64_t)v20, &qword_1EDF9A8E8);
  return v29;
}

uint64_t type metadata accessor for CNPosterPreviewViewWrapper()
{
  return objc_opt_self();
}

id sub_18AD61E4C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC10ContactsUI26CNPosterPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for CNPosterPreviewViewConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNPosterPreviewViewConfiguration.hasExistingPoster.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of static CNPosterPreviewViewConfiguration.configurationForNewPoster(withPhotoAssetID:backgroundColor:displayName:isEditingSNaP:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static CNPosterPreviewViewConfiguration.configurationForNewPoster(withPhotoAssetID:backgroundColor:displayName:isEditingSNaP:monogramText:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of static CNPosterPreviewViewConfiguration.configurationForExistingPosterConfiguration(_:displayName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static CNPosterPreviewViewConfiguration.configurationForPosterArchiveData(_:displayName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t method lookup function for CNPosterPreviewViewWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNPosterPreviewViewWrapper.hostingController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CNPosterPreviewViewWrapper.hostingController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNPosterPreviewViewWrapper.hostingController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CNPosterPreviewViewWrapper.__allocating_init(with:contact:editingState:delegate:windowScene:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for CNPosterPreviewView()
{
  uint64_t result;

  result = qword_1EDF9A8F8;
  if (!qword_1EDF9A8F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18AD61F8C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_18AD26820();
  result = sub_18AF4F068();
  *a1 = v3;
  return result;
}

uint64_t sub_18AD61FDC()
{
  return sub_18AF4EF24();
}

char *sub_18AD62000(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  char v24;
  char *v26;
  char *v27;
  char *v28;
  char *v29;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = v5;
    swift_unknownObjectWeakCopyInit();
    a1[24] = *((_BYTE *)a2 + 24);
    *((_QWORD *)a1 + 4) = a2[4];
    a1[40] = *((_BYTE *)a2 + 40);
    v9 = a2[7];
    *((_QWORD *)a1 + 6) = a2[6];
    *((_QWORD *)a1 + 7) = v9;
    v10 = a2[9];
    *((_QWORD *)a1 + 8) = a2[8];
    *((_QWORD *)a1 + 9) = v10;
    v11 = a2[11];
    *((_QWORD *)a1 + 10) = a2[10];
    *((_QWORD *)a1 + 11) = v11;
    v27 = a2[13];
    *((_QWORD *)a1 + 12) = a2[12];
    *((_QWORD *)a1 + 13) = v27;
    a1[112] = *((_BYTE *)a2 + 112);
    v26 = a2[15];
    v28 = a2[16];
    *((_QWORD *)a1 + 15) = v26;
    *((_QWORD *)a1 + 16) = v28;
    v12 = *(int *)(a3 + 64);
    v29 = &a1[v12];
    v13 = (char **)((char *)a2 + v12);
    *((_QWORD *)a1 + 17) = a2[17];
    swift_retain();
    swift_retain();
    v14 = v9;
    swift_retain();
    v15 = v10;
    swift_retain();
    sub_18AF4E9A8();
    v16 = v27;
    v17 = v26;
    v18 = v28;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_18AF4EE1C();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v29, v13, v19);
    }
    else
    {
      *(_QWORD *)v29 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v20 = *(int *)(a3 + 68);
    v21 = &a1[v20];
    v22 = (uint64_t)a2 + v20;
    v23 = *(id *)v22;
    v24 = *(_BYTE *)(v22 + 8);
    sub_18ACFFE7C(*(id *)v22, v24);
    *(_QWORD *)v21 = v23;
    v21[8] = v24;
  }
  return a1;
}

void sub_18AD621F0(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  v4 = (char *)a1 + *(int *)(a2 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_18AF4EE1C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_18ACCDF90(*(id *)((char *)a1 + *(int *)(a2 + 68)), *((_BYTE *)a1 + *(int *)(a2 + 68) + 8));
}

uint64_t sub_18AD622E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  void *v26;
  void *v27;
  _QWORD *v28;

  v5 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = v5;
  swift_unknownObjectWeakCopyInit();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v9;
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  v26 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v26;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v11 = *(void **)(a2 + 120);
  v27 = *(void **)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v11;
  *(_QWORD *)(a1 + 128) = v27;
  v12 = *(int *)(a3 + 64);
  v28 = (_QWORD *)(a1 + v12);
  v13 = (_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_retain();
  v14 = v8;
  swift_retain();
  v15 = v9;
  swift_retain();
  sub_18AF4E9A8();
  v16 = v26;
  v17 = v11;
  v18 = v27;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_18AF4EE1C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v28, v13, v19);
  }
  else
  {
    *v28 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v20 = *(int *)(a3 + 68);
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = *(id *)v22;
  v24 = *(_BYTE *)(v22 + 8);
  sub_18ACFFE7C(*(id *)v22, v24);
  *(_QWORD *)v21 = v23;
  *(_BYTE *)(v21 + 8) = v24;
  return a1;
}

uint64_t sub_18AD624A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char v32;
  void *v33;
  char v34;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectWeakCopyAssign();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  v9 = *(void **)(a1 + 56);
  v10 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  v12 = *(void **)(a1 + 72);
  v13 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v13;
  v14 = v13;

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  v15 = *(void **)(a1 + 104);
  v16 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v16;
  v17 = v16;

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v18 = *(void **)(a1 + 120);
  v19 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v19;
  v20 = v19;

  v21 = *(void **)(a1 + 128);
  v22 = *(void **)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v22;
  v23 = v22;

  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v24 = *(int *)(a3 + 64);
    v25 = (_QWORD *)(a1 + v24);
    v26 = (_QWORD *)(a2 + v24);
    sub_18ACCDE68(a1 + v24, (uint64_t *)&unk_1EDF94D40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v27 = sub_18AF4EE1C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    }
    else
    {
      *v25 = *v26;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v28 = *(int *)(a3 + 68);
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = *(id *)v30;
  v32 = *(_BYTE *)(v30 + 8);
  sub_18ACFFE7C(*(id *)v30, v32);
  v33 = *(void **)v29;
  v34 = *(_BYTE *)(v29 + 8);
  *(_QWORD *)v29 = v31;
  *(_BYTE *)(v29 + 8) = v32;
  sub_18ACCDF90(v33, v34);
  return a1;
}

uint64_t sub_18AD626D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_unknownObjectWeakTakeInit();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v7 = *(int *)(a3 + 64);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_18AF4EE1C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = *(int *)(a3 + 68);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t sub_18AD627F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  char v23;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectWeakTakeAssign();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  v8 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  v9 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v11 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);

  v12 = *(void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);

  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release();
  if (a1 != a2)
  {
    v13 = *(int *)(a3 + 64);
    v14 = (void *)(a1 + v13);
    v15 = (const void *)(a2 + v13);
    sub_18ACCDE68(a1 + v13, (uint64_t *)&unk_1EDF94D40);
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_18AF4EE1C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = *(int *)(a3 + 68);
  v19 = a1 + v18;
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  LOBYTE(v20) = *((_BYTE *)v20 + 8);
  v22 = *(void **)v19;
  v23 = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v19 = v21;
  *(_BYTE *)(v19 + 8) = (_BYTE)v20;
  sub_18ACCDF90(v22, v23);
  return a1;
}

uint64_t sub_18AD629D4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18AD629E0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94D58);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 64)], a2, v8);
  }
}

uint64_t sub_18AD62A60()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_18AD62A6C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF94D58);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 64)], a2, a2, v7);
  }
  return result;
}

void sub_18AD62AE4()
{
  unint64_t v0;

  sub_18AD11094();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_18AD62BA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18AD62BB4@<X0>(uint64_t a1@<X8>)
{
  return sub_18AD60B60(a1);
}

uint64_t sub_18AD62BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CNPosterPreviewView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18AD62C04()
{
  return sub_18AD62F1C((uint64_t (*)(uint64_t))sub_18AD5F328);
}

uint64_t sub_18AD62C14()
{
  type metadata accessor for CNPosterPreviewView();
  return sub_18AD5F43C();
}

unint64_t sub_18AD62C54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF997A0;
  if (!qword_1EDF997A0)
  {
    v1 = type metadata accessor for CNExistingWallpaperEditorView(255);
    result = MEMORY[0x18D777800](&unk_18AF87158, v1);
    atomic_store(result, (unint64_t *)&qword_1EDF997A0);
  }
  return result;
}

void sub_18AD62CA0()
{
  type metadata accessor for CNPosterPreviewView();
  sub_18AD5F654();
  sub_18AD5F9D0();
}

unint64_t sub_18AD62CE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  result = qword_1EDF9A980;
  if (!qword_1EDF9A980)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A928);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A938);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A958);
    v4 = sub_18ACBC6F4(&qword_1EDF9A960, &qword_1EDF9A938, MEMORY[0x1E0CDFCC0]);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A968);
    sub_18ACD6098(&qword_1EDF9A970, &qword_1EDF9A968, (uint64_t (*)(void))sub_18AD62C54, MEMORY[0x1E0CDC500]);
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = v4;
    v5[5] = swift_getOpaqueTypeConformance2();
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x1E0CDC8B0];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1EDF9A980);
  }
  return result;
}

void *sub_18AD62E04()
{
  type metadata accessor for CNPosterPreviewView();
  return sub_18AD60874();
}

double sub_18AD62E3C@<D0>(_OWORD *a1@<X8>)
{
  return sub_18AD60F04(a1);
}

unint64_t sub_18AD62E44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9A9D8;
  if (!qword_1EDF9A9D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A9E0);
    v2[0] = MEMORY[0x1E0CDDD58];
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9A9D8);
  }
  return result;
}

unint64_t sub_18AD62EA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF9A9E8;
  if (!qword_1EDF9A9E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A9C0);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CDFA50], v1);
    atomic_store(result, (unint64_t *)&qword_1EDF9A9E8);
  }
  return result;
}

uint64_t sub_18AD62EFC()
{
  return swift_deallocObject();
}

uint64_t sub_18AD62F10()
{
  return sub_18AD62F1C((uint64_t (*)(uint64_t))sub_18AD6117C);
}

uint64_t sub_18AD62F1C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CNPosterPreviewView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_18AD62F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for CNPosterPreviewView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_18AF4EE1C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_18ACCDF90(*(id *)(v0 + v3 + *(int *)(v1 + 68)), *(_BYTE *)(v0 + v3 + *(int *)(v1 + 68) + 8));

  return swift_deallocObject();
}

uint64_t sub_18AD630A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(type metadata accessor for CNPosterPreviewView() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_18ACBFE40;
  return sub_18AD6052C(a1, v6, v7, v8, v9);
}

uint64_t sub_18AD6314C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for CNPosterPreviewView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_18AF4EE1C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_18ACCDF90(*(id *)(v0 + v3 + *(int *)(v1 + 68)), *(_BYTE *)(v0 + v3 + *(int *)(v1 + 68) + 8));

  return swift_deallocObject();
}

void sub_18AD63294(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for CNPosterPreviewView() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_18AD6035C(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t objectdestroyTm_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for CNPosterPreviewView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  v4 = (char *)v3 + *(int *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF94D40);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_18AF4EE1C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_18ACCDF90(*(id *)((char *)v3 + *(int *)(v1 + 68)), *((_BYTE *)v3 + *(int *)(v1 + 68) + 8));
  return swift_deallocObject();
}

uint64_t sub_18AD6343C(void *a1)
{
  type metadata accessor for CNPosterPreviewView();
  return sub_18AD604E0(a1);
}

unint64_t sub_18AD63494()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9AA10;
  if (!qword_1EDF9AA10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9A918);
    v2[0] = sub_18ACBC6F4(&qword_1EDF9AA18, &qword_1EDF9A908, MEMORY[0x1E0CDFCC0]);
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AA10);
  }
  return result;
}

uint64_t sub_18AD63524(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, id);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, id))(a1 + 32);
  if (a2)
  {
    v5 = sub_18AF4FC5C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, v8);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_18AD635A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  void *v6;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3880]), sel_init);
  objc_msgSend(v4, sel_setSourceType_, *(_QWORD *)(v2 + *(int *)(a2 + 28)));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AAA8);
  sub_18AF4F344();
  objc_msgSend(v4, sel_setDelegate_, v6);

  return v4;
}

uint64_t sub_18AD6363C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t result;
  objc_super v11;

  MEMORY[0x1E0C80A78](a1, a2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AD6474C(v3, (uint64_t)v6);
  v7 = (objc_class *)type metadata accessor for CNPhotoPickerCoordinator(0);
  v8 = objc_allocWithZone(v7);
  sub_18AD6474C((uint64_t)v6, (uint64_t)v8 + OBJC_IVAR____TtC10ContactsUI24CNPhotoPickerCoordinator_picker);
  v11.receiver = v8;
  v11.super_class = v7;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  result = sub_18AD64790((uint64_t)v6);
  *a3 = v9;
  return result;
}

uint64_t sub_18AD636EC()
{
  sub_18ACB7AD8(&qword_1EDF9AAB0, type metadata accessor for CNWallpaperPhotoPickerView, (uint64_t)&unk_18AF8ABC0);
  return sub_18AF4F320();
}

uint64_t sub_18AD63758()
{
  sub_18ACB7AD8(&qword_1EDF9AAB0, type metadata accessor for CNWallpaperPhotoPickerView, (uint64_t)&unk_18AF8ABC0);
  return sub_18AF4F2F0();
}

void sub_18AD637C4()
{
  sub_18ACB7AD8(&qword_1EDF9AAB0, type metadata accessor for CNWallpaperPhotoPickerView, (uint64_t)&unk_18AF8ABC0);
  sub_18AF4F314();
  __break(1u);
}

uint64_t sub_18AD63800(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __n128 v22;
  _QWORD v24[3];
  __int128 v25;
  __int128 v26;
  void *v27;

  v6 = type metadata accessor for CNWallpaperPhotoPickerView(0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1 + OBJC_IVAR____TtC10ContactsUI24CNPhotoPickerCoordinator_picker;
  sub_18AD6474C(v10, (uint64_t)v9);
  v11 = *((_QWORD *)v9 + 2);
  v25 = *(_OWORD *)v9;
  *(_QWORD *)&v26 = v11;
  v27 = a2;
  v12 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF952F0);
  sub_18AF4F8B4();
  sub_18AD64790((uint64_t)v9);
  sub_18AD6474C(v10, (uint64_t)v9);
  swift_beginAccess();
  v14 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(a3 + 24);
  v15 = *((_QWORD *)v9 + 4);
  *(_QWORD *)&v25 = *((_QWORD *)v9 + 3);
  *((_QWORD *)&v25 + 1) = v15;
  v26 = *(_OWORD *)(v9 + 40);
  v24[1] = v14;
  v24[2] = v13;
  sub_18AF4E9A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AAB8);
  sub_18AF4F8B4();
  sub_18AD64790((uint64_t)v9);
  sub_18AD6474C(v10, (uint64_t)v9);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18ACCA82C((uint64_t)v19);
  sub_18AD64790((uint64_t)v9);
  v20 = sub_18AF4EE64();
  v22 = MEMORY[0x1E0C80A78](v20, v21);
  MEMORY[0x18D775A24](v16, v22);
  sub_18AF4EE58();
  sub_18AF4F8B4();
  return sub_18ACCDE68((uint64_t)v19, &qword_1EDF97780);
}

uint64_t sub_18AD639F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v11 = sub_18AF4FB54();
  v25 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_18AF4FB6C();
  v15 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24, v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  sub_18ACBE1B0(0, &qword_1EDF95460);
  v19 = (void *)sub_18AF4FF38();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a5;
  *(_QWORD *)(v20 + 24) = a6;
  aBlock[4] = sub_18ACC54C4;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18ACC449C;
  aBlock[3] = &block_descriptor_13;
  v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_18AF4FB60();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_18ACB7AD8((unint64_t *)&unk_1EDF95340, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF95390);
  sub_18ACC6930();
  sub_18AF50178();
  MEMORY[0x18D7760CC](0, v18, v14, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v24);
}

id sub_18AD63CF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNPhotoPickerCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18AD63D34()
{
  return type metadata accessor for CNPhotoPickerCoordinator(0);
}

uint64_t type metadata accessor for CNPhotoPickerCoordinator(uint64_t a1)
{
  return sub_18ACC25F0(a1, (uint64_t *)&unk_1EDF9AA90);
}

uint64_t sub_18AD63D50()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CNWallpaperPhotoPickerView(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for CNWallpaperPhotoPickerView(uint64_t a1)
{
  return sub_18ACC25F0(a1, (uint64_t *)&unk_1EDF97740);
}

uint64_t *sub_18AD63DD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = (void *)a2[2];
    a1[1] = a2[1];
    a1[2] = (uint64_t)v8;
    v9 = a2[4];
    a1[3] = a2[3];
    a1[4] = v9;
    v10 = a2[6];
    v11 = *(int *)(a3 + 24);
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    a1[5] = a2[5];
    a1[6] = v10;
    swift_retain();
    swift_retain();
    v14 = v8;
    swift_retain();
    swift_retain();
    sub_18AF4E9A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v12 = *v13;
    if (EnumCaseMultiPayload == 1)
    {
      v12[1] = v13[1];
      swift_retain();
      swift_retain();
      v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
      v17 = (char *)v12 + v16;
      v18 = (char *)v13 + v16;
      v19 = sub_18AF4EE64();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
    swift_unknownObjectWeakCopyInit();
  }
  return a1;
}

uint64_t sub_18AD63F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v6 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
    v7 = sub_18AF4EE64();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  return swift_unknownObjectWeakDestroy();
}

_QWORD *sub_18AD6400C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v8 = (void *)a2[2];
  v7 = a2[3];
  a1[2] = v8;
  a1[3] = v7;
  v9 = a2[5];
  a1[4] = a2[4];
  a1[5] = v9;
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  a1[6] = a2[6];
  swift_retain();
  swift_retain();
  v13 = v8;
  swift_retain();
  swift_retain();
  sub_18AF4E9A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *v11 = *v12;
  if (EnumCaseMultiPayload == 1)
  {
    v11[1] = v12[1];
    swift_retain();
    swift_retain();
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
    v16 = (char *)v11 + v15;
    v17 = (char *)v12 + v15;
    v18 = sub_18AF4EE64();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_unknownObjectWeakCopyInit();
  return a1;
}

_QWORD *sub_18AD64158(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = (void *)a1[2];
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = v7;

  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 24);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    sub_18ACCDE68((uint64_t)a1 + v9, &qword_1EDF982D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v10 = *v11;
    if (EnumCaseMultiPayload == 1)
    {
      v10[1] = v11[1];
      swift_retain();
      swift_retain();
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
      v14 = (char *)v10 + v13;
      v15 = (char *)v11 + v13;
      v16 = sub_18AF4EE64();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_unknownObjectWeakCopyAssign();
  return a1;
}

uint64_t sub_18AD64304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v6 = *(int *)(a3 + 24);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = v8[1];
    *v7 = *v8;
    v7[1] = v10;
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
    v12 = (char *)v7 + v11;
    v13 = (char *)v8 + v11;
    v14 = sub_18AF4EE64();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_QWORD *)(a1 + *(int *)(a3 + 28)) = *(_QWORD *)(a2 + *(int *)(a3 + 28));
  swift_unknownObjectWeakTakeInit();
  return a1;
}

_QWORD *sub_18AD64414(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = (void *)a1[2];
  a1[2] = a2[2];

  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  v7 = a2[6];
  a1[5] = a2[5];
  a1[6] = v7;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    sub_18ACCDE68((uint64_t)a1 + v8, &qword_1EDF982D0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF982D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = v10[1];
      *v9 = *v10;
      v9[1] = v12;
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97780) + 32);
      v14 = (char *)v9 + v13;
      v15 = (char *)v10 + v13;
      v16 = sub_18AF4EE64();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_unknownObjectWeakTakeAssign();
  return a1;
}

uint64_t sub_18AD6457C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18AD64588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AAA0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_18AD64608()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_18AD64614(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AAA0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_18AD6468C()
{
  unint64_t v0;

  sub_18ACDBBE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_18AD64720()
{
  return sub_18ACB7AD8((unint64_t *)&unk_1EDF97730, type metadata accessor for CNWallpaperPhotoPickerView, (uint64_t)&unk_18AF8AB70);
}

uint64_t sub_18AD6474C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CNWallpaperPhotoPickerView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18AD64790(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CNWallpaperPhotoPickerView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_18AD647CC(uint64_t a1)
{
  char *v1;
  char *v2;
  id v4;
  unint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  char *v14;
  id v15;
  char *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  _QWORD *v21;
  void *v22;

  if (!*(_QWORD *)(a1 + 16))
  {
    v18 = 0u;
    v19 = 0u;
    goto LABEL_9;
  }
  v2 = v1;
  v4 = (id)*MEMORY[0x1E0DC4CA0];
  v5 = sub_18AD48C7C((uint64_t)v4);
  if ((v6 & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;

    goto LABEL_9;
  }
  sub_18ACB8738(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)&v18);

  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_9:
    sub_18ACCDE68((uint64_t)&v18, (uint64_t *)&unk_1EDF955B0);
    return;
  }
  sub_18ACBE1B0(0, &qword_1EDF99E80);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = v22;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)(v8 + 24) = 0;
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v2;
    v9[3] = v7;
    v9[4] = v8;
    v10 = &v2[OBJC_IVAR____TtC10ContactsUI24CNPhotoPickerCoordinator_picker];
    if (*(_QWORD *)&v10[*(int *)(type metadata accessor for CNWallpaperPhotoPickerView(0) + 28)] == 1)
    {
      v11 = (void *)objc_opt_self();
      v12 = (_QWORD *)swift_allocObject();
      v12[2] = v8;
      v12[3] = sub_18AD64A88;
      v12[4] = v9;
      v20 = sub_18AD64AC0;
      v21 = v12;
      *(_QWORD *)&v18 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v18 + 1) = 1107296256;
      *(_QWORD *)&v19 = sub_18AD63524;
      *((_QWORD *)&v19 + 1) = &block_descriptor_15;
      v13 = _Block_copy(&v18);
      swift_retain_n();
      v14 = v2;
      v15 = v7;
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_createAssetFromImage_completionHandler_, v15, v13);
      swift_release();

      _Block_release(v13);
      swift_release();
    }
    else
    {
      swift_retain();
      v16 = v2;
      v17 = v7;
      sub_18AD63800((uint64_t)v16, v17, v8);
      swift_release();
      swift_release();

    }
  }
}

uint64_t sub_18AD64A30()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_18AD64A54()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18AD64A88()
{
  uint64_t v0;

  return sub_18AD63800(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_18AD64A94()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18AD64AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_18AD639F4(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t sub_18AD64AE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18AD64B10@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18AF4FEFC();
    v31 = (void *)sub_18AF4F350();
    sub_18AF4E8B8();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_18AF4EE88();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_18ACD5BB4(a16, v22, v21 & 1);
  return sub_18AF4E9A8();
}

uint64_t sub_18AD64CF0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18AF4FEFC();
    v23 = (void *)sub_18AF4F350();
    sub_18AF4E8B8();

  }
  sub_18AF4EE88();
  v24 = v13[7];
  a9[6] = v13[6];
  a9[7] = v24;
  v25 = v13[8];
  v26 = v13[3];
  a9[2] = v13[2];
  a9[3] = v26;
  v27 = v13[5];
  a9[4] = v13[4];
  a9[5] = v27;
  v28 = v13[1];
  *a9 = *v13;
  a9[1] = v28;
  a9[12] = v33;
  a9[13] = v34;
  a9[14] = v35;
  a9[15] = v36;
  a9[8] = v25;
  a9[9] = v30;
  a9[10] = v31;
  a9[11] = v32;
  return sub_18AD69B88((uint64_t)v13);
}

uint64_t sub_18AD64EAC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18AF4FEFC();
    v23 = (void *)sub_18AF4F350();
    sub_18AF4E8B8();

  }
  sub_18AF4EE88();
  v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return sub_18AD69B88((uint64_t)v13);
}

double sub_18AD6505C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_18AD6510C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1EDF94DE0, &qword_1EDF94ED8).n128_u64[0];
  return result;
}

double sub_18AD650B4@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_18AD6510C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1EDF94FA0, &qword_1EDF95050).n128_u64[0];
  return result;
}

__n128 sub_18AD6510C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  _OWORD *v29;
  __n128 result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v19 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18AF4FEFC();
    v28 = (void *)sub_18AF4F350();
    sub_18AF4E8B8();

    v19 = a17;
  }
  sub_18AF4EE88();
  sub_18ACCDEA4(v17, a9, a16);
  v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *v29 = v31;
  v29[1] = v32;
  result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_18AD652D8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18AF4FEFC();
    v23 = (void *)sub_18AF4F350();
    sub_18AF4E8B8();

  }
  sub_18AF4EE88();
  v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  v25 = v13[4];
  v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[11] = v34;
  a9[4] = v25;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_18AD69B88((uint64_t)v13);
}

uint64_t sub_18AD65484(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_18AD654A4(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t GroupVisualizerType.rawValue.getter(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      return 0x53474E4954544553;
    case 2:
      return 0x4F495443454C4553;
    case 1:
      return 0x4452414F424E4FLL;
  }
  result = sub_18AF5043C();
  __break(1u);
  return result;
}

uint64_t GroupVisualizerType.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  return sub_18AD681F4(a1, a2);
}

uint64_t sub_18AD65590(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  if (*a1)
  {
    if (v2 == 2)
    {
      v4 = 0x4F495443454C4553;
      v5 = 0xE90000000000004ELL;
      if (!v3)
      {
LABEL_11:
        v6 = 0xE800000000000000;
        if (v4 != 0x53474E4954544553)
          goto LABEL_17;
LABEL_15:
        if (v5 == v6)
        {
          v7 = 1;
LABEL_18:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v7 & 1;
        }
LABEL_17:
        v7 = sub_18AF50418();
        goto LABEL_18;
      }
    }
    else
    {
      if (v2 != 1)
        goto LABEL_19;
      v5 = 0xE700000000000000;
      v4 = 0x4452414F424E4FLL;
      if (!v3)
        goto LABEL_11;
    }
  }
  else
  {
    v5 = 0xE800000000000000;
    v4 = 0x53474E4954544553;
    if (!v3)
      goto LABEL_11;
  }
  if (v3 == 2)
  {
    v6 = 0xE90000000000004ELL;
    if (v4 != 0x4F495443454C4553)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (v3 == 1)
  {
    v6 = 0xE700000000000000;
    if (v4 != 0x4452414F424E4FLL)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_19:
  result = sub_18AF5043C();
  __break(1u);
  return result;
}

uint64_t sub_18AD656FC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  sub_18AF504B4();
  if (!v1 || v1 == 2 || v1 == 1)
  {
    sub_18AF4FCA4();
    swift_bridgeObjectRelease();
    return sub_18AF504E4();
  }
  else
  {
    result = sub_18AF5043C();
    __break(1u);
  }
  return result;
}

uint64_t sub_18AD657C8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  if (!*v0 || v1 == 2 || v1 == 1)
  {
    sub_18AF4FCA4();
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = sub_18AF5043C();
    __break(1u);
  }
  return result;
}

uint64_t sub_18AD65874()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  sub_18AF504B4();
  if (!v1 || v1 == 2 || v1 == 1)
  {
    sub_18AF4FCA4();
    swift_bridgeObjectRelease();
    return sub_18AF504E4();
  }
  else
  {
    result = sub_18AF5043C();
    __break(1u);
  }
  return result;
}

uint64_t sub_18AD6593C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_18AD681F4(*a1, a1[1]);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_18AD65970@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *v1;
  if (!*v1)
  {
    v3 = 0xE800000000000000;
    v4 = 0x53474E4954544553;
    goto LABEL_7;
  }
  if (v2 == 2)
  {
    v3 = 0xE90000000000004ELL;
    v4 = 0x4F495443454C4553;
LABEL_7:
    *a1 = v4;
    a1[1] = v3;
    return result;
  }
  if (v2 == 1)
  {
    v3 = 0xE700000000000000;
    v4 = 0x4452414F424E4FLL;
    goto LABEL_7;
  }
  result = sub_18AF5043C();
  __break(1u);
  return result;
}

id CNContactGroupVisualizerViewWrapper.hostingController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController);
}

id CNContactGroupVisualizerViewWrapper.__allocating_init(type:contacts:limitContactsCount:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return CNContactGroupVisualizerViewWrapper.init(type:contacts:limitContactsCount:)(a1, a2, a3);
}

id CNContactGroupVisualizerViewWrapper.init(type:contacts:limitContactsCount:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  id v13;
  char *v15;
  objc_super v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v4 = v3;
  if (a2)
  {
    if (a2 >> 62)
    {
      v15 = v4;
      sub_18AF4E9A8();
      v7 = sub_18AF50328();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v8 = v4;
    }
    v17 = a1;
    v18 = a2;
    v19 = v7;
  }
  else
  {
    v9 = (unint64_t)a3 >> 63;
    v10 = (void *)(a3 & ~(a3 >> 63));
    v11 = v4;
    v17 = a1;
    v18 = (unint64_t)sub_18AD68368(v10, v9);
    v19 = v12;
  }
  v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9AAF8));
  *(_QWORD *)&v4[OBJC_IVAR____TtC10ContactsUI35CNContactGroupVisualizerViewWrapper_hostingController] = sub_18AF4F134();

  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for CNContactGroupVisualizerViewWrapper();
  return objc_msgSendSuper2(&v16, sel_init);
}

id CNContactGroupVisualizerViewWrapper.__allocating_init(type:contacts:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  void *v6;
  id v7;

  v5 = objc_allocWithZone(v2);
  if (a2)
  {
    sub_18ACF5E38();
    v6 = (void *)sub_18AF4FD28();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v5, sel_initWithType_contacts_limitContactsCount_, a1, v6, -1);

  return v7;
}

id CNContactGroupVisualizerViewWrapper.init(type:contacts:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;

  if (a2)
  {
    sub_18ACF5E38();
    v4 = (void *)sub_18AF4FD28();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v2, sel_initWithType_contacts_limitContactsCount_, a1, v4, -1);

  return v5;
}

uint64_t sub_18AD65D4C(void *a1, _BYTE *a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  id v9;
  uint64_t result;
  uint64_t v11;

  v9 = a1;
  MEMORY[0x18D775E98]();
  if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_18AF4FD58();
  sub_18AF4FD70();
  result = sub_18AF4FD4C();
  v11 = *a4 + 1;
  if (__OFADD__(*a4, 1))
  {
    __break(1u);
  }
  else
  {
    *a4 = v11;
    if (v11 == a5)
      *a2 = 1;
  }
  return result;
}

id CNContactGroupVisualizerViewWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CNContactGroupVisualizerViewWrapper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNContactGroupVisualizerViewWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNContactGroupVisualizerViewWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18AD65EA8()
{
  uint64_t v0;

  v0 = sub_18AF4E900();
  __swift_allocate_value_buffer(v0, qword_1EDF9AAC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDF9AAC0);
  return sub_18AF4E8F4();
}

uint64_t sub_18AD65F24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_18AF4E900();
  __swift_allocate_value_buffer(v0, qword_1EDF9AAD8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EDF9AAD8);
  if (qword_1EDF98290 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EDF9AAC0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_18AD65FB4()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_18AD65FD8(uint64_t a1)
{
  void **v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v7;

  v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ACB0);
  sub_18AF4F290();
  v4 = *(id *)(v7 + 16);
  swift_release();
  v5 = objc_msgSend(v4, sel_view);

  sub_18AD69028(a1, v3);
  return v5;
}

void sub_18AD66068(uint64_t a1, uint64_t a2)
{
  void **v2;

  sub_18AD69028(a2, *v2);
}

void sub_18AD66074(uint64_t *a1@<X8>)
{
  uint64_t v2;
  id v3;
  id v4;

  type metadata accessor for ContactAvatarView.Coordinator();
  v2 = swift_allocObject();
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultSettings);
  v4 = objc_msgSend(objc_allocWithZone((Class)CNAvatarViewController), sel_initWithSettings_, v3);

  *(_QWORD *)(v2 + 16) = v4;
  *a1 = v2;
}

uint64_t sub_18AD66100()
{
  sub_18AD6A068();
  return sub_18AF4F1B8();
}

uint64_t sub_18AD66154()
{
  sub_18AD6A068();
  return sub_18AF4F164();
}

void sub_18AD661A8()
{
  sub_18AD6A068();
  sub_18AF4F1AC();
  __break(1u);
}

void sub_18AD661CC(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;

  if ((a2 & 1) != 0)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v20 = 0.0;
    v21 = 0;
    v12 = 1;
  }
  else
  {
    v13 = a1;
    sub_18AF4F974();
    sub_18AF4ECCC();
    v7 = v22;
    v8 = v23;
    v9 = v24;
    v10 = v25;
    v11 = v26;
    v21 = v27;
    v20 = a4 * 0.25;
    v12 = (uint64_t)a1;
  }
  v14 = a1;
  sub_18AF4F974();
  sub_18AF4ECCC();
  v19 = sub_18AF4F380();
  sub_18AF4EC24();
  *(_QWORD *)a3 = v12;
  *(_QWORD *)(a3 + 8) = v7;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_QWORD *)(a3 + 32) = v10;
  *(_QWORD *)(a3 + 40) = v11;
  *(_QWORD *)(a3 + 48) = v21;
  *(double *)(a3 + 56) = v20;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = 0;
  *(double *)(a3 + 80) = v20;
  *(_QWORD *)(a3 + 88) = a1;
  *(_QWORD *)(a3 + 96) = v28;
  *(_BYTE *)(a3 + 104) = v29;
  *(_QWORD *)(a3 + 112) = v30;
  *(_BYTE *)(a3 + 120) = v31;
  *(_QWORD *)(a3 + 128) = v32;
  *(_QWORD *)(a3 + 136) = v33;
  *(_BYTE *)(a3 + 144) = v19;
  *(_QWORD *)(a3 + 152) = v15;
  *(_QWORD *)(a3 + 160) = v16;
  *(_QWORD *)(a3 + 168) = v17;
  *(_QWORD *)(a3 + 176) = v18;
  *(_BYTE *)(a3 + 184) = 0;
  sub_18ACBC764((id)v12);
  sub_18ACBC774((id)v12);
}

double sub_18AD663B8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  double v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  _OWORD v20[10];
  _OWORD v21[2];

  v3 = *(void **)v1;
  v4 = *(double *)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = sub_18AF4F974();
  v8 = v7;
  sub_18AD661CC(v3, v5, (uint64_t)v20, v4);
  sub_18AF4F980();
  sub_18AF4ECCC();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v20[9];
  *(_OWORD *)(a1 + 144) = v20[8];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v21[0];
  *(_OWORD *)(a1 + 185) = *(_OWORD *)((char *)v21 + 9);
  v10 = v20[5];
  *(_OWORD *)(a1 + 80) = v20[4];
  *(_OWORD *)(a1 + 96) = v10;
  v11 = v20[7];
  *(_OWORD *)(a1 + 112) = v20[6];
  *(_OWORD *)(a1 + 128) = v11;
  v12 = v20[1];
  *(_OWORD *)(a1 + 16) = v20[0];
  *(_OWORD *)(a1 + 32) = v12;
  v13 = v20[3];
  *(_OWORD *)(a1 + 48) = v20[2];
  *(_OWORD *)(a1 + 64) = v13;
  *(_QWORD *)(a1 + 208) = v15;
  *(_BYTE *)(a1 + 216) = v16;
  *(_QWORD *)(a1 + 224) = v17;
  *(_BYTE *)(a1 + 232) = v18;
  result = *(double *)&v19;
  *(_OWORD *)(a1 + 240) = v19;
  return result;
}

uint64_t sub_18AD664BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(unint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_18AF50304();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = sub_18AF4F938();
      v5 = sub_18AF4FD64();
      *(_QWORD *)(v5 + 16) = a2;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16);
      v8(v5 + v7, a1, v4);
      v9 = a2 - 1;
      if (a2 != 1)
      {
        v10 = *(_QWORD *)(v6 + 72);
        v11 = v5 + v10 + v7;
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      v5 = MEMORY[0x1E0DEE9D8];
    }
    v12 = sub_18AF4F938();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return v5;
  }
  return result;
}

void sub_18AD665EC(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  _QWORD *v26;
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
  char *v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  int v46;

  v3 = sub_18AF4F23C();
  MEMORY[0x1E0C80A78](v3, v4);
  v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = *(_QWORD *)(v1 + 32);
  if ((unsigned __int128)(v8 * (__int128)v9) >> 64 == (v8 * v9) >> 63)
  {
    v10 = *(_QWORD *)(v1 + 48);
    if ((*(_BYTE *)(v1 + 64) & 1) == 0 || !__OFSUB__(v8 * v9, 1))
    {
      v40[0] = v7;
      v40[1] = v5;
      v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC08);
      v45 = v40;
      MEMORY[0x1E0C80A78](v44, v11);
      v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC10);
      v43 = v40;
      v14 = *(_QWORD *)(v42 - 8);
      MEMORY[0x1E0C80A78](v42, v15);
      v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = sub_18AF4F938();
      MEMORY[0x1E0C80A78](v18, v19);
      v21 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = sub_18AF4F92C();
      v24 = MEMORY[0x1E0C80A78](v22, v23);
      v41 = a1;
      v26 = (_QWORD *)((char *)v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
      *v26 = v10;
      v26[1] = 0x7FF0000000000000;
      (*(void (**)(_QWORD *, _QWORD, __n128))(v27 + 104))(v26, *MEMORY[0x1E0CE0108], v24);
      sub_18AF4F944();
      v28 = sub_18AD664BC((uint64_t)v21, v9);
      MEMORY[0x1E0C80A78](v28, v29);
      sub_18AF4F0E0();
      v46 = 0;
      sub_18ACB7AD8(&qword_1EDF9AC18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDBDB8], MEMORY[0x1E0CDBDD8]);
      sub_18AF50538();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC20);
      sub_18AD697D4();
      sub_18AF4F9BC();
      LOBYTE(v26) = sub_18AF4F38C();
      sub_18AF4EC24();
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v38 = v42;
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v13, v17, v42);
      v39 = &v13[*(int *)(v44 + 36)];
      *v39 = (char)v26;
      *((_QWORD *)v39 + 1) = v31;
      *((_QWORD *)v39 + 2) = v33;
      *((_QWORD *)v39 + 3) = v35;
      *((_QWORD *)v39 + 4) = v37;
      v39[40] = 0;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v38);
      sub_18ACD5C10((uint64_t)v13, v41, &qword_1EDF9AC08);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_18AD6694C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  char v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(void);
  uint64_t v59;
  char *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC20);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF951B0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC48);
  v86 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18, v19);
  v87 = (char *)v73 - v20;
  v21 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 >> 62)
  {
    sub_18AD69850(a1);
    v71 = sub_18AF50328();
    sub_18AD69878(a1);
    if (v71)
      goto LABEL_3;
LABEL_9:
    v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9AC38);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(a3, 1, 1, v72);
  }
  if (!*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_9;
LABEL_3:
  v84 = v17;
  v82 = v14;
  sub_18AD69850(a1);
  v22 = sub_18AD16E70(a2, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  sub_18AD69878(a1);
  v88 = v22;
  v89 = v24;
  v90 = v26;
  v91 = v28;
  swift_getKeyPath();
  v29 = swift_allocObject();
  v30 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v29 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v29 + 64) = v30;
  *(_BYTE *)(v29 + 80) = *(_BYTE *)(a1 + 64);
  v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 32) = v31;
  sub_18AD69850(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC50);
  sub_18ACBC6F4(&qword_1EDF9AC58, &qword_1EDF9AC50, MEMORY[0x1E0DEBF80]);
  sub_18ACB7AD8(&qword_1EDF9AC60, (uint64_t (*)(uint64_t))sub_18ACF5E38, MEMORY[0x1E0DEFCF8]);
  sub_18AD698E0();
  sub_18AF4F8F0();
  v32 = *(_BYTE *)(a1 + 64);
  v83 = a3;
  v85 = v9;
  if ((v32 & 1) == 0)
  {
    v80 = 0;
    v81 = 0;
    v33 = 0;
    v78 = 0;
    v79 = 0;
    KeyPath = 0;
    v35 = 0;
    v36 = 0;
    v76 = 0;
    v77 = 0;
    v75 = 0;
LABEL_7:
    v58 = *(void (**)(void))(v86 + 16);
    v59 = v82;
    ((void (*)(char *, char *, uint64_t))v58)(v84, v87, v82);
    v60 = v85;
    v58();
    v61 = (uint64_t *)&v60[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AC70) + 48)];
    v63 = v80;
    v62 = v81;
    *v61 = v81;
    v61[1] = v63;
    v73[2] = v36;
    v74 = v33;
    v64 = v79;
    v61[2] = v33;
    v61[3] = v64;
    v61[4] = KeyPath;
    v61[5] = v35;
    v61[6] = 0;
    v61[7] = v36;
    v73[1] = KeyPath;
    v65 = v78;
    v67 = v76;
    v66 = v77;
    v61[8] = v78;
    v61[9] = v66;
    v61[10] = v65;
    v61[11] = v67;
    v61[12] = v75;
    sub_18AD69924(v62, v63, v33, v64);
    v68 = *(void (**)(char *, uint64_t))(v86 + 8);
    v68(v87, v59);
    sub_18AD69994(v62, v63, v74, v64);
    v68(v84, v59);
    v69 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9AC38);
    v70 = (uint64_t)v85;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v85, 0, 1, v69);
    return sub_18ACD5C10(v70, v83, &qword_1EDF9AC20);
  }
  v37 = *(_QWORD *)(a1 + 40);
  result = v37 - a2;
  if (!__OFSUB__(v37, a2))
  {
    v88 = sub_18AD69A04(result);
    v89 = v39;
    sub_18ACB7660();
    v40 = sub_18AF4F518();
    v42 = v41;
    v44 = v43 & 1;
    sub_18AF4F6EC();
    v45 = sub_18AF4F4C4();
    v47 = v46;
    v49 = v48;
    swift_release();
    sub_18ACD5A1C(v40, v42, v44);
    swift_bridgeObjectRelease();
    v50 = sub_18AF4F404();
    v51 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56);
    v78 = 1;
    v51(v13, 1, 1, v50);
    sub_18AF4F44C();
    sub_18ACCDE68((uint64_t)v13, &qword_1EDF951B0);
    v52 = sub_18AF4F500();
    v80 = v53;
    v81 = v52;
    v55 = v54;
    v79 = v56;
    swift_release();
    v33 = v55 & 1;
    sub_18ACD5A1C(v45, v47, v49 & 1);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v36 = swift_getKeyPath();
    v77 = swift_getKeyPath();
    v57 = swift_getKeyPath();
    v75 = 0x3FDCCCCCCCCCCCCDLL;
    v76 = v57;
    v35 = 2;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

void sub_18AD66F04(uint64_t a1@<X8>)
{
  sub_18AD665EC(a1);
}

uint64_t sub_18AD66F44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[312];
  _QWORD v59[40];
  char v60;

  v53 = a2;
  v54 = a3;
  v6 = sub_18AF4F95C();
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  v50 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB18);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB20);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB28);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21, v22);
  v24 = (char *)&v49 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB30);
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = (char *)&v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = a4;
  v57 = v17;
  v55 = v29;
  if (!a1)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    v31 = sub_18AF4F0E0();
    sub_18AD673DC(v53, v54, (uint64_t)v58);
    v60 = 1;
    memcpy((char *)v59 + 7, v58, 0x138uLL);
    *(_QWORD *)v28 = v31;
    *((_QWORD *)v28 + 1) = 0;
    v28[16] = 1;
    memcpy(v28 + 17, v59, 0x13FuLL);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB48);
    sub_18ACBC6F4(&qword_1EDF9AB50, &qword_1EDF9AB48, MEMORY[0x1E0CDFCC0]);
    sub_18AD68F20();
    return sub_18AF4F1D0();
  }
  if (a1 == 1 || a1 == 2)
  {
    v30 = sub_18AF50418();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
      goto LABEL_7;
    *(_QWORD *)v12 = sub_18AF4F0E0();
    *((_QWORD *)v12 + 1) = 0;
    v12[16] = 1;
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB38);
    sub_18AD67800(a1, v53, v54, (uint64_t)&v12[*(int *)(v33 + 44)]);
    v34 = sub_18AF4F38C();
    sub_18AF4EC24();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    sub_18ACCDEA4((uint64_t)v12, (uint64_t)v16, &qword_1EDF9AB18);
    v43 = &v16[*(int *)(v13 + 36)];
    *v43 = v34;
    *((_QWORD *)v43 + 1) = v36;
    *((_QWORD *)v43 + 2) = v38;
    *((_QWORD *)v43 + 3) = v40;
    *((_QWORD *)v43 + 4) = v42;
    v43[40] = 0;
    sub_18ACCDE68((uint64_t)v12, &qword_1EDF9AB18);
    v44 = v50;
    sub_18AF4F950();
    v45 = sub_18AF4F380();
    v46 = &v20[*(int *)(v57 + 36)];
    v48 = v51;
    v47 = v52;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v46, v44, v52);
    v46[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB40) + 36)] = v45;
    sub_18ACCDEA4((uint64_t)v16, (uint64_t)v20, &qword_1EDF9AB20);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v44, v47);
    sub_18ACCDE68((uint64_t)v16, &qword_1EDF9AB20);
    sub_18ACD5C10((uint64_t)v20, (uint64_t)v24, &qword_1EDF9AB28);
    sub_18ACCDEA4((uint64_t)v24, (uint64_t)v28, &qword_1EDF9AB28);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB48);
    sub_18ACBC6F4(&qword_1EDF9AB50, &qword_1EDF9AB48, MEMORY[0x1E0CDFCC0]);
    sub_18AD68F20();
    sub_18AF4F1D0();
    return sub_18ACCDE68((uint64_t)v24, &qword_1EDF9AB28);
  }
  else
  {
    v59[0] = a1;
    result = sub_18AF5043C();
    __break(1u);
  }
  return result;
}

uint64_t sub_18AD673DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  char v46;
  _BYTE v47[80];
  _OWORD v48[12];
  _BYTE v49[199];
  char v50;
  _OWORD v51[13];

  sub_18AD69130(a2, (uint64_t)v45);
  v6 = v45[0];
  v7 = v45[1];
  v8 = v45[2];
  v9 = v45[3];
  v10 = v45[4];
  v11 = v46;
  sub_18AF4E9A8();
  v12 = sub_18AF4F380();
  sub_18AD67640(a2, (uint64_t)v47);
  sub_18AF4F980();
  sub_18AD64EAC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v33, 0.0, 1, 0.0, 1);
  sub_18AD69290((uint64_t)v47);
  v13 = v41;
  v48[8] = v41;
  v48[9] = v42;
  v14 = v43;
  v48[10] = v43;
  v48[11] = v44;
  v15 = v37;
  v48[4] = v37;
  v48[5] = v38;
  v16 = v39;
  v48[6] = v39;
  v48[7] = v40;
  v17 = v33;
  v48[0] = v33;
  v48[1] = v34;
  v48[2] = v35;
  v48[3] = v36;
  *(_OWORD *)&v49[135] = v41;
  v18 = v42;
  *(_OWORD *)&v49[151] = v42;
  *(_OWORD *)&v49[167] = v43;
  v19 = v44;
  *(_OWORD *)&v49[183] = v44;
  *(_OWORD *)&v49[71] = v37;
  v20 = v38;
  *(_OWORD *)&v49[87] = v38;
  *(_OWORD *)&v49[103] = v39;
  v21 = v40;
  *(_OWORD *)&v49[119] = v40;
  *(_OWORD *)&v49[7] = v33;
  v22 = v35;
  v23 = v34;
  *(_OWORD *)&v49[23] = v34;
  *(_OWORD *)&v49[39] = v35;
  v24 = v36;
  *(_OWORD *)&v49[55] = v36;
  *(_QWORD *)(a3 + 48) = v9;
  *(_QWORD *)(a3 + 56) = v10;
  *(_OWORD *)(a3 + 80) = xmmword_18AF8AC40;
  *(_OWORD *)(a3 + 96) = xmmword_18AF8AC40;
  v25 = *(_OWORD *)&v49[160];
  v26 = *(_OWORD *)&v49[176];
  v27 = *(_OWORD *)&v49[128];
  *(_OWORD *)(a3 + 257) = *(_OWORD *)&v49[144];
  *(_OWORD *)(a3 + 273) = v25;
  *(_OWORD *)(a3 + 289) = v26;
  v28 = *(_OWORD *)&v49[64];
  *(_OWORD *)(a3 + 193) = *(_OWORD *)&v49[80];
  v29 = *(_OWORD *)&v49[112];
  *(_OWORD *)(a3 + 209) = *(_OWORD *)&v49[96];
  *(_OWORD *)(a3 + 225) = v29;
  *(_OWORD *)(a3 + 241) = v27;
  v30 = *(_OWORD *)v49;
  *(_OWORD *)(a3 + 129) = *(_OWORD *)&v49[16];
  v31 = *(_OWORD *)&v49[48];
  *(_OWORD *)(a3 + 145) = *(_OWORD *)&v49[32];
  *(_OWORD *)(a3 + 161) = v31;
  *(_OWORD *)(a3 + 177) = v28;
  *(_OWORD *)(a3 + 113) = v30;
  v51[8] = v13;
  v51[9] = v18;
  v51[10] = v14;
  v51[11] = v19;
  v51[4] = v15;
  v51[5] = v20;
  v51[6] = v16;
  v51[7] = v21;
  v50 = 0;
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = v8;
  *(_BYTE *)(a3 + 16) = 1;
  *(_QWORD *)(a3 + 24) = v6;
  *(_QWORD *)(a3 + 32) = v7;
  *(_QWORD *)(a3 + 40) = v8;
  *(_BYTE *)(a3 + 64) = v11;
  *(_BYTE *)(a3 + 72) = v12;
  *(_BYTE *)(a3 + 112) = 0;
  *(_QWORD *)(a3 + 304) = *(_QWORD *)&v49[191];
  v51[0] = v17;
  v51[1] = v23;
  v51[2] = v22;
  v51[3] = v24;
  sub_18AF4E9A8();
  sub_18AD69B88((uint64_t)v48);
  sub_18AD69290((uint64_t)v51);
  return swift_bridgeObjectRelease();
}

double sub_18AD67640@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  double result;
  _QWORD v28[3];

  v4 = sub_18AF4FC2C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4FBE4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98E60);
  inited = swift_initStackObject();
  v10 = MEMORY[0x1E0DEB418];
  v11 = MEMORY[0x1E0DEB490];
  *(_OWORD *)(inited + 16) = xmmword_18AF84FD0;
  *(_QWORD *)(inited + 56) = v10;
  *(_QWORD *)(inited + 64) = v11;
  *(_QWORD *)(inited + 32) = a1;
  v12 = sub_18ACC13F4((uint64_t)v8, inited);
  v14 = v13;
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9AB80);
  swift_arrayDestroy();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v28[1] = v12;
  v28[2] = v14;
  sub_18ACB7660();
  v15 = sub_18AF4F518();
  v17 = v16;
  v19 = v18 & 1;
  v20 = sub_18AF4F4F4();
  v22 = v21;
  LOBYTE(v5) = v23;
  v25 = v24;
  sub_18ACD5A1C(v15, v17, v19);
  swift_bridgeObjectRelease();
  v26 = sub_18AF4F380();
  *(_QWORD *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v22;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(_QWORD *)(a2 + 24) = v25;
  *(_BYTE *)(a2 + 32) = v26;
  *(_OWORD *)(a2 + 40) = xmmword_18AF8AC40;
  result = 10.0;
  *(_OWORD *)(a2 + 56) = xmmword_18AF8AC50;
  *(_BYTE *)(a2 + 72) = 0;
  return result;
}

uint64_t sub_18AD67800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t KeyPath;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
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
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  _QWORD v90[5];
  unsigned __int8 v91;
  uint64_t v92;
  unsigned __int8 v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  unsigned __int8 v99;
  unsigned __int8 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  char v121;
  __int128 v122;
  __int128 v123;
  char v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  char v128;
  uint64_t v129;
  uint64_t v130;

  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB90);
  *(_QWORD *)&v74 = *(_QWORD *)(v79 - 8);
  MEMORY[0x1E0C80A78](v79, v8);
  v67 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9AB98);
  MEMORY[0x1E0C80A78](v71, v10);
  v68 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ABA0);
  MEMORY[0x1E0C80A78](v72, v12);
  v69 = (uint64_t)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ABA8);
  MEMORY[0x1E0C80A78](v75, v14);
  v70 = (uint64_t)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ABB0);
  MEMORY[0x1E0C80A78](v80, v16);
  v73 = (uint64_t)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18, v19);
  v84 = a3;
  v85 = (uint64_t)&v66 - v20;
  sub_18AD69130(a3, (uint64_t)v90);
  v82 = v90[1];
  v83 = v90[0];
  v81 = v90[2];
  v21 = v90[3];
  v22 = v90[4];
  v89 = v91;
  v87 = a2;
  sub_18AF4E9A8();
  v88 = sub_18AF4F380();
  sub_18AF4F974();
  sub_18AF4ECCC();
  v77 = v94;
  v78 = v92;
  v76 = v96;
  v86 = v97;
  v100 = 0;
  v99 = v93;
  v98 = v95;
  sub_18AD67E08(a1, a3, (uint64_t)&v112);
  v23 = v112;
  v24 = v113;
  LOBYTE(a2) = v114;
  v25 = v115;
  KeyPath = swift_getKeyPath();
  v112 = v23;
  v113 = v24;
  v114 = a2;
  v115 = v25;
  v116 = KeyPath;
  LOBYTE(v117) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ABB8);
  sub_18AD69318();
  v27 = v67;
  sub_18AF4F698();
  sub_18ACD5A1C(v23, v24, a2);
  swift_release();
  swift_bridgeObjectRelease();
  v28 = sub_18AF4F494();
  v29 = swift_getKeyPath();
  v30 = v74;
  v31 = (uint64_t)v68;
  v32 = v79;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v68, v27, v79);
  v33 = (uint64_t *)(v31 + *(int *)(v71 + 36));
  *v33 = v29;
  v33[1] = v28;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v32);
  v34 = swift_getKeyPath();
  v35 = v69;
  sub_18ACCDEA4(v31, v69, &qword_1EDF9AB98);
  v36 = v35 + *(int *)(v72 + 36);
  *(_QWORD *)v36 = v34;
  *(_BYTE *)(v36 + 8) = 1;
  sub_18ACCDE68(v31, &qword_1EDF9AB98);
  v37 = swift_getKeyPath();
  v38 = v70;
  sub_18ACCDEA4(v35, v70, &qword_1EDF9ABA0);
  v39 = (uint64_t *)(v38 + *(int *)(v75 + 36));
  *v39 = v37;
  v39[1] = 0x3FDCCCCCCCCCCCCDLL;
  sub_18ACCDE68(v35, &qword_1EDF9ABA0);
  LOBYTE(v37) = sub_18AF4F38C();
  sub_18AF4EC24();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v48 = v73;
  sub_18ACCDEA4(v38, v73, &qword_1EDF9ABA8);
  v49 = v48 + *(int *)(v80 + 36);
  *(_BYTE *)v49 = v37;
  *(_QWORD *)(v49 + 8) = v41;
  *(_QWORD *)(v49 + 16) = v43;
  *(_QWORD *)(v49 + 24) = v45;
  *(_QWORD *)(v49 + 32) = v47;
  *(_BYTE *)(v49 + 40) = 0;
  sub_18ACCDE68(v38, &qword_1EDF9ABA8);
  v50 = v85;
  sub_18ACD5C10(v48, v85, &qword_1EDF9ABB0);
  LOBYTE(v38) = v100;
  LODWORD(v79) = v100;
  LOBYTE(v32) = v99;
  LODWORD(v80) = v99;
  LOBYTE(v29) = v98;
  sub_18ACCDEA4(v50, v48, &qword_1EDF9ABB0);
  v51 = v83;
  *(_QWORD *)&v101 = v87;
  *((_QWORD *)&v101 + 1) = v84;
  LOBYTE(v102) = 0;
  v52 = v81;
  v53 = v82;
  *((_QWORD *)&v102 + 1) = v83;
  *(_QWORD *)&v103 = v82;
  *((_QWORD *)&v103 + 1) = v81;
  *(_QWORD *)&v104 = v21;
  *((_QWORD *)&v104 + 1) = v22;
  LOBYTE(v105) = v89;
  BYTE8(v105) = v88;
  v74 = xmmword_18AF8AC60;
  v75 = xmmword_18AF8AC70;
  v106 = xmmword_18AF8AC60;
  v107 = xmmword_18AF8AC70;
  LOBYTE(v108) = v38;
  v54 = v77;
  v55 = v78;
  *((_QWORD *)&v108 + 1) = v78;
  LOBYTE(v109) = v32;
  *((_QWORD *)&v109 + 1) = v77;
  LOBYTE(v110) = v29;
  LOBYTE(v32) = v29;
  v56 = v76;
  *((_QWORD *)&v110 + 1) = v76;
  v57 = v102;
  v58 = v103;
  *(_OWORD *)a4 = v101;
  *(_OWORD *)(a4 + 16) = v57;
  v60 = v106;
  v59 = v107;
  v61 = v104;
  *(_OWORD *)(a4 + 64) = v105;
  *(_OWORD *)(a4 + 80) = v60;
  v62 = v110;
  v63 = v108;
  *(_OWORD *)(a4 + 128) = v109;
  *(_OWORD *)(a4 + 144) = v62;
  *(_OWORD *)(a4 + 96) = v59;
  *(_OWORD *)(a4 + 112) = v63;
  v111 = v86;
  *(_QWORD *)(a4 + 160) = v86;
  *(_OWORD *)(a4 + 32) = v58;
  *(_OWORD *)(a4 + 48) = v61;
  v64 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9ABE8);
  sub_18ACCDEA4(v48, a4 + *(int *)(v64 + 48), &qword_1EDF9ABB0);
  sub_18AD69850((uint64_t)&v101);
  sub_18ACCDE68(v85, &qword_1EDF9ABB0);
  sub_18ACCDE68(v48, &qword_1EDF9ABB0);
  v112 = v87;
  v113 = v84;
  v114 = 0;
  v115 = v51;
  v116 = v53;
  v117 = v52;
  v118 = v21;
  v119 = v22;
  v120 = v89;
  v121 = v88;
  v122 = v74;
  v123 = v75;
  v124 = v79;
  v125 = v55;
  v126 = v80;
  v127 = v54;
  v128 = v32;
  v129 = v56;
  v130 = v86;
  return sub_18AD69878((uint64_t)&v112);
}

uint64_t sub_18AD67E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  _BYTE v31[80];
  uint64_t v32;
  uint64_t v33;

  v6 = sub_18AF4FC2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = &v31[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a1)
  {
    case 0:
      goto LABEL_6;
    case 1:
      swift_bridgeObjectRelease();
LABEL_7:
      sub_18AF4FBE4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98E60);
      inited = swift_initStackObject();
      v12 = MEMORY[0x1E0DEB418];
      v13 = MEMORY[0x1E0DEB490];
      *(_OWORD *)(inited + 16) = xmmword_18AF84FD0;
      *(_QWORD *)(inited + 56) = v12;
      *(_QWORD *)(inited + 64) = v13;
      *(_QWORD *)(inited + 32) = a2;
      v14 = sub_18ACC13F4((uint64_t)v10, inited);
      v16 = v15;
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF9AB80);
      swift_arrayDestroy();
      v17 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
      v17(v10, v6);
      sub_18AF4FBE4();
      sub_18ACC13F4((uint64_t)v10, MEMORY[0x1E0DEE9D8]);
      v17(v10, v6);
      v32 = v14;
      v33 = v16;
      sub_18AF4E9A8();
      sub_18AF4FCD4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_18ACB7660();
      v18 = sub_18AF4F518();
      v20 = v19;
      v22 = v21 & 1;
      sub_18AF4F6EC();
      v23 = sub_18AF4F4C4();
      v25 = v24;
      v27 = v26;
      v29 = v28;
      swift_release();
      sub_18ACD5A1C(v18, v20, v22);
      result = swift_bridgeObjectRelease();
      *(_QWORD *)a3 = v23;
      *(_QWORD *)(a3 + 8) = v25;
      *(_BYTE *)(a3 + 16) = v27 & 1;
      *(_QWORD *)(a3 + 24) = v29;
      return result;
    case 2:
LABEL_6:
      sub_18AF50418();
      swift_bridgeObjectRelease();
      goto LABEL_7;
  }
  v32 = a1;
  result = sub_18AF5043C();
  __break(1u);
  return result;
}

uint64_t sub_18AD68100@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_18AD66F44(*v1, v1[1], v1[2], a1);
}

uint64_t sub_18AD6810C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EFCC();
  *a1 = result;
  return result;
}

uint64_t sub_18AD68134()
{
  swift_retain();
  return sub_18AF4EFD8();
}

uint64_t sub_18AD6815C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EFA8();
  *a1 = result;
  return result;
}

uint64_t sub_18AD68184()
{
  return sub_18AF4EFB4();
}

uint64_t sub_18AD681A8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18AF4EF60();
  *a1 = v3;
  return result;
}

uint64_t sub_18AD681D0()
{
  return sub_18AF4EF6C();
}

uint64_t sub_18AD681F4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x53474E4954544553 && a2 == 0xE800000000000000;
  if (v2 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4452414F424E4FLL && a2 == 0xE700000000000000 || (sub_18AF50418() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4F495443454C4553 && a2 == 0xE90000000000004ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_18AF50418();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 0;
  }
}

id sub_18AD68368(void *a1, char a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  uint64_t (*v37)(void *, _BYTE *);
  void *v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  _QWORD *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  unint64_t v64;
  _QWORD v65[9];
  id aBlock[8];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentEnvironment);
  v5 = objc_msgSend(v4, sel_contactStore);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_18AF8A390;
  *(_QWORD *)(v6 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysForStyle_, 0);
  *(_QWORD *)(v6 + 40) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysWithThreeDTouchEnabled_, 0);
  sub_18AF4FD4C();
  v7 = objc_allocWithZone(MEMORY[0x1E0C97210]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98888);
  v8 = (void *)sub_18AF4FD28();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithKeysToFetch_, v8);

  -[NSObject setUnifyResults:](v9, sel_setUnifyResults_, 1);
  v10 = objc_allocWithZone(MEMORY[0x1E0C97210]);
  v11 = MEMORY[0x1E0DEE9D8];
  v12 = (void *)sub_18AF4FD28();
  v13 = v5;
  v14 = objc_msgSend(v10, sel_initWithKeysToFetch_, v12);

  -[NSObject setUnifyResults:](v14, sel_setUnifyResults_, 1);
  aBlock[0] = 0;
  v63 = v14;
  v15 = -[NSObject contactCountForFetchRequest:error:](v5, sel_contactCountForFetchRequest_error_, v14, aBlock);
  v16 = aBlock[0];
  if (!v15)
  {
    v34 = v5;
    v35 = aBlock[0];
    v36 = (void *)sub_18AF4E42C();

    swift_willThrow();
    v37 = 0;
LABEL_15:
    v39 = v9;
    if (qword_1EDF98298 != -1)
      swift_once();
    v40 = sub_18AF4E900();
    __swift_project_value_buffer(v40, (uint64_t)qword_1EDF9AAD8);
    v41 = v36;
    v42 = v36;
    v43 = sub_18AF4E8E8();
    v44 = sub_18AF4FEF0();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = (void *)swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)v45 = 136315138;
      swift_getErrorValue();
      v47 = sub_18AF50460();
      v65[6] = sub_18ACB7004(v47, v48, (uint64_t *)aBlock);
      sub_18AF50124();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18AC56000, v43, v44, "Fetched contacts: failed with %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x18D7778C0](v46, -1, -1);
      MEMORY[0x18D7778C0](v45, -1, -1);
    }
    else
    {

    }
    v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_18AF85030;
    *(_QWORD *)(v49 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C97200]), sel_init);
    aBlock[0] = (id)v49;
    sub_18AF4FD4C();
    v50 = aBlock[0];

    sub_18ACCDD44((uint64_t)v37);
    return v50;
  }
  v17 = v15;
  if ((a2 & 1) != 0)
    v18 = 54;
  else
    v18 = (uint64_t)a1;
  v64 = v11;
  v65[0] = 0;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = &v64;
  *(_QWORD *)(v19 + 24) = v65;
  *(_QWORD *)(v19 + 32) = v18;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = sub_18AD694F4;
  v20[3] = v19;
  aBlock[4] = sub_18ACC54C4;
  aBlock[5] = v20;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_18AD654A4;
  aBlock[3] = &block_descriptor_16;
  v21 = _Block_copy(aBlock);
  v22 = v16;
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  v23 = -[NSObject enumerateContactsWithFetchRequest:error:usingBlock:](v5, sel_enumerateContactsWithFetchRequest_error_usingBlock_, v9, aBlock, v21);
  _Block_release(v21);
  v24 = aBlock[0];
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v19 & 1) != 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (!v23)
  {
    v38 = v17;
    v34 = v13;
    v36 = (void *)sub_18AF4E42C();

    swift_willThrow();
    swift_bridgeObjectRelease();
    v37 = sub_18AD694F4;
    goto LABEL_15;
  }
  if ((a2 & 1) == 0)
  {
    if (qword_1EDF98298 == -1)
    {
LABEL_9:
      v25 = sub_18AF4E900();
      __swift_project_value_buffer(v25, (uint64_t)qword_1EDF9AAD8);
      v26 = v17;
      v27 = sub_18AF4E8E8();
      v28 = sub_18AF4FF08();
      if (os_log_type_enabled(v27, v28))
      {
        v61 = v13;
        v29 = swift_slowAlloc();
        v30 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v29 = 134218498;
        swift_beginAccess();
        if (v64 >> 62)
        {
          sub_18AF4E9A8();
          v31 = (void *)sub_18AF50328();
          swift_bridgeObjectRelease();
        }
        else
        {
          v31 = *(void **)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        aBlock[0] = v31;
        sub_18AF50124();
        *(_WORD *)(v29 + 12) = 2112;
        aBlock[0] = v26;
        v32 = v26;
        sub_18AF50124();
        *v30 = v17;

        *(_WORD *)(v29 + 22) = 2048;
        aBlock[0] = a1;
        sub_18AF50124();
        _os_log_impl(&dword_18AC56000, v27, v28, "Fetched %ld contacts out of %@. Overriding total contacts count to %ld", (uint8_t *)v29, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF99D20);
        swift_arrayDestroy();
        MEMORY[0x18D7778C0](v30, -1, -1);
        MEMORY[0x18D7778C0](v29, -1, -1);
        v33 = v61;
        v26 = v63;
      }
      else
      {

        v32 = v9;
        v27 = v63;
        v33 = v26;
        v9 = v26;
      }

      swift_beginAccess();
      v50 = (id)v64;
      swift_release();
      return v50;
    }
LABEL_33:
    swift_once();
    goto LABEL_9;
  }
  v62 = v13;
  if (qword_1EDF98298 != -1)
    swift_once();
  v52 = sub_18AF4E900();
  __swift_project_value_buffer(v52, (uint64_t)qword_1EDF9AAD8);
  v53 = v17;
  v54 = sub_18AF4E8E8();
  v55 = sub_18AF4FF08();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = swift_slowAlloc();
    v57 = swift_slowAlloc();
    *(_DWORD *)v56 = 134218242;
    swift_beginAccess();
    v60 = (_QWORD *)v57;
    if (v64 >> 62)
    {
      sub_18AF4E9A8();
      v58 = (void *)sub_18AF50328();
      swift_bridgeObjectRelease();
    }
    else
    {
      v58 = *(void **)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    aBlock[0] = v58;
    sub_18AF50124();
    *(_WORD *)(v56 + 12) = 2112;
    aBlock[0] = v53;
    v59 = v53;
    sub_18AF50124();
    *v60 = v17;

    _os_log_impl(&dword_18AC56000, v54, v55, "Fetched %ld contacts out of %@", (uint8_t *)v56, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF99D20);
    swift_arrayDestroy();
    MEMORY[0x18D7778C0](v60, -1, -1);
    MEMORY[0x18D7778C0](v56, -1, -1);
  }
  else
  {

    v54 = v53;
  }

  swift_beginAccess();
  v50 = (id)v64;
  sub_18AF4E9A8();
  -[NSObject integerValue](v53, sel_integerValue);

  swift_release();
  swift_bridgeObjectRelease();
  return v50;
}

uint64_t type metadata accessor for CNContactGroupVisualizerViewWrapper()
{
  return objc_opt_self();
}

unint64_t sub_18AD68DB0()
{
  unint64_t result;

  result = qword_1EDF9AB08;
  if (!qword_1EDF9AB08)
  {
    result = MEMORY[0x18D777800](&protocol conformance descriptor for GroupVisualizerType, &type metadata for GroupVisualizerType);
    atomic_store(result, (unint64_t *)&qword_1EDF9AB08);
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupVisualizerType()
{
  return &type metadata for GroupVisualizerType;
}

uint64_t method lookup function for CNContactGroupVisualizerViewWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNContactGroupVisualizerViewWrapper.__allocating_init(type:contacts:limitContactsCount:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for ContactAvatarView.Coordinator()
{
  return objc_opt_self();
}

_QWORD *sub_18AD68E3C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_18AF4E9A8();
  return a1;
}

_QWORD *assignWithCopy for CNContactGroupVisualizer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for CNContactGroupVisualizer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for CNContactGroupVisualizer()
{
  return &type metadata for CNContactGroupVisualizer;
}

uint64_t sub_18AD68F10()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18AD68F20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9AB58;
  if (!qword_1EDF9AB58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AB28);
    v2[0] = sub_18AD68FA4();
    v2[1] = sub_18ACBC6F4((unint64_t *)&unk_1EDF9AB70, &qword_1EDF9AB40, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AB58);
  }
  return result;
}

unint64_t sub_18AD68FA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9AB60;
  if (!qword_1EDF9AB60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AB20);
    v2[0] = sub_18ACBC6F4(&qword_1EDF9AB68, &qword_1EDF9AB18, MEMORY[0x1E0CDFCC0]);
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AB60);
  }
  return result;
}

void sub_18AD69028(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF9ACB0);
  sub_18AF4F290();
  v3 = *(id *)(v8 + 16);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_18AF85030;
  if (a2)
    v5 = a2;
  else
    v5 = objc_msgSend((id)objc_opt_self(), sel_emptyContact);
  *(_QWORD *)(v4 + 32) = v5;
  sub_18AF4FD4C();
  sub_18ACF5E38();
  v6 = a2;
  v7 = (void *)sub_18AF4FD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setContacts_, v7, v4);

}

double sub_18AD69130@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unsigned int v12;
  double result;

  v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) >= 6)
  {
    if ((unint64_t)(a1 - 10) > 0xFFFFFFFFFFFFFFFCLL)
    {
      v4 = 3;
      v5 = 3;
    }
    else if ((unint64_t)(a1 - 13) > 0xFFFFFFFFFFFFFFFCLL)
    {
      v5 = 3;
      v4 = 4;
    }
    else if ((unint64_t)(a1 - 17) > 0xFFFFFFFFFFFFFFFBLL)
    {
      v4 = 4;
      v5 = 4;
    }
    else if ((unint64_t)(a1 - 21) > 0xFFFFFFFFFFFFFFFBLL)
    {
      v5 = 4;
      v4 = 5;
    }
    else if ((unint64_t)(a1 - 26) > 0xFFFFFFFFFFFFFFFALL)
    {
      v4 = 5;
      v5 = 5;
    }
    else
    {
      v6 = a1 - 31;
      v5 = 5;
      v7 = 9;
      v8 = 8;
      if ((unint64_t)a1 > 0x30)
        v8 = 9;
      if (a1 >= 43)
        v7 = v8;
      if ((unint64_t)(a1 - 43) <= 0xFFFFFFFFFFFFFFF9)
        v9 = v7;
      else
        v9 = 7;
      if ((unint64_t)(a1 - 37) <= 0xFFFFFFFFFFFFFFF9)
        v10 = v9;
      else
        v10 = 6;
      v11 = __CFADD__(v6, 6);
      if (v6 <= 0xFFFFFFFFFFFFFFFALL)
        v4 = v10;
      else
        v4 = 6;
      if (a1 == 25 || !v11)
        v5 = 6;
    }
  }
  else
  {
    v3 = 8 * v2;
    v4 = qword_18AF8B128[v2];
    v5 = *(_QWORD *)((char *)&unk_18AF8B158 + v3);
  }
  v12 = 0xE0u / v5;
  if (0xE0u / v4 < v12)
    v12 = 0xE0u / v4;
  if (v12 <= 0x1C)
    v12 = 28;
  result = (double)v12;
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = a1;
  *(double *)(a2 + 24) = (double)v12;
  *(double *)(a2 + 32) = (double)v12 * 0.03;
  *(_BYTE *)(a2 + 40) = a1 > 54;
  return result;
}

uint64_t sub_18AD69290(uint64_t a1)
{
  sub_18ACD5A1C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_18AD692CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EFA8();
  *a1 = result;
  return result;
}

uint64_t sub_18AD692F4()
{
  return sub_18AF4EFB4();
}

unint64_t sub_18AD69318()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9ABC0;
  if (!qword_1EDF9ABC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9ABB8);
    v2[0] = sub_18AD6939C();
    v2[1] = sub_18ACBC6F4(&qword_1EDF9ABD8, &qword_1EDF9ABE0, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9ABC0);
  }
  return result;
}

unint64_t sub_18AD6939C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EDF9ABC8;
  if (!qword_1EDF9ABC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9ABD0);
    v2 = MEMORY[0x1E0CDDD58];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CDF690], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9ABC8);
  }
  return result;
}

uint64_t sub_18AD693F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EFCC();
  *a1 = result;
  return result;
}

uint64_t sub_18AD69420()
{
  swift_retain();
  return sub_18AF4EFD8();
}

uint64_t sub_18AD69448@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18AF4EF3C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_18AD69474()
{
  return sub_18AF4EF48();
}

uint64_t sub_18AD69498@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18AF4EF60();
  *a1 = v3;
  return result;
}

uint64_t sub_18AD694C0()
{
  return sub_18AF4EF6C();
}

uint64_t sub_18AD694E4()
{
  return swift_deallocObject();
}

uint64_t sub_18AD694F4(void *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_18AD65D4C(a1, a2, *(_QWORD **)(v2 + 16), *(uint64_t **)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_18AD69500()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t destroy for CNContactGroupArrangedAvatars()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 49) = *(_OWORD *)(a2 + 49);
  sub_18AF4E9A8();
  return a1;
}

uint64_t assignWithCopy for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for CNContactGroupArrangedAvatars(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNContactGroupArrangedAvatars(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNContactGroupArrangedAvatars()
{
  return &type metadata for CNContactGroupArrangedAvatars;
}

unint64_t sub_18AD69738()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9ABF8;
  if (!qword_1EDF9ABF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AC00);
    v2[0] = sub_18ACBC6F4(&qword_1EDF9AB50, &qword_1EDF9AB48, MEMORY[0x1E0CDFCC0]);
    v2[1] = sub_18AD68F20();
    result = MEMORY[0x18D777800](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9ABF8);
  }
  return result;
}

uint64_t sub_18AD697BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18AD697CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18AD6694C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_18AD697D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EDF9AC28;
  if (!qword_1EDF9AC28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AC20);
    v2 = sub_18ACBC6F4(&qword_1EDF9AC30, (uint64_t *)&unk_1EDF9AC38, MEMORY[0x1E0CE0680]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE0798], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AC28);
  }
  return result;
}

uint64_t sub_18AD69850(uint64_t a1)
{
  sub_18AF4E9A8();
  return a1;
}

uint64_t sub_18AD69878(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_18AD698A0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_18AD698C4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;
  char v4;

  v3 = *a1;
  v4 = *(_BYTE *)(v2 + 32);
  *(_QWORD *)a2 = v3;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 64);
  *(_BYTE *)(a2 + 24) = v4;
  return v3;
}

unint64_t sub_18AD698E0()
{
  unint64_t result;

  result = qword_1EDF9AC68;
  if (!qword_1EDF9AC68)
  {
    result = MEMORY[0x18D777800](&unk_18AF8AFF0, &type metadata for AvatarView);
    atomic_store(result, (unint64_t *)&qword_1EDF9AC68);
  }
  return result;
}

uint64_t sub_18AD69924(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_18ACD5BB4(result, a2, a3 & 1);
    sub_18AF4E9A8();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_18AD69994(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_18ACD5A1C(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_18AD69A04(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  objc_msgSend(v2, sel_setNumberStyle_, 1);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, a1);
  v4 = objc_msgSend(v2, sel_stringFromNumber_, v3);

  if (!v4)
  {
    sub_18AF503F4();
    if (a1 <= 999)
      goto LABEL_3;
LABEL_5:
    v5 = 2603;
    goto LABEL_6;
  }
  sub_18AF4FC5C();

  if (a1 > 999)
    goto LABEL_5;
LABEL_3:
  v5 = 43;
LABEL_6:
  v7 = v5;
  sub_18AF4FCD4();

  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_18AD69B2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_18AF4F020();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_18AD69B5C()
{
  return sub_18AF4F02C();
}

uint64_t sub_18AD69B88(uint64_t a1)
{
  sub_18ACD5BB4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  sub_18AF4E9A8();
  return a1;
}

uint64_t initializeWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for AvatarView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for AvatarView()
{
  return &type metadata for AvatarView;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AvatarArrangementConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvatarArrangementConfiguration()
{
  return &type metadata for AvatarArrangementConfiguration;
}

unint64_t sub_18AD69D78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9AC78;
  if (!qword_1EDF9AC78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AC08);
    v2[0] = sub_18AD69DE4();
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AC78);
  }
  return result;
}

unint64_t sub_18AD69DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDF9AC80;
  if (!qword_1EDF9AC80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AC10);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE04E0], v1);
    atomic_store(result, (unint64_t *)&qword_1EDF9AC80);
  }
  return result;
}

uint64_t sub_18AD69E30()
{
  return swift_getOpaqueTypeConformance2();
}

void **initializeBufferWithCopyOfBuffer for ContactAvatarView(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void **assignWithCopy for ContactAvatarView(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for ContactAvatarView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAvatarView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactAvatarView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAvatarView()
{
  return &type metadata for ContactAvatarView;
}

unint64_t sub_18AD69F9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF9AC88;
  if (!qword_1EDF9AC88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF9AC90);
    v2[0] = sub_18ACBC6F4(&qword_1EDF9AC98, &qword_1EDF9ACA0, MEMORY[0x1E0CDFCF8]);
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x18D777800](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF9AC88);
  }
  return result;
}

unint64_t sub_18AD6A024()
{
  unint64_t result;

  result = qword_1EDF9ACA8;
  if (!qword_1EDF9ACA8)
  {
    result = MEMORY[0x18D777800](&unk_18AF8B040, &type metadata for ContactAvatarView);
    atomic_store(result, (unint64_t *)&qword_1EDF9ACA8);
  }
  return result;
}

unint64_t sub_18AD6A068()
{
  unint64_t result;

  result = qword_1EDF9ACB8;
  if (!qword_1EDF9ACB8)
  {
    result = MEMORY[0x18D777800](&unk_18AF8B090, &type metadata for ContactAvatarView);
    atomic_store(result, (unint64_t *)&qword_1EDF9ACB8);
  }
  return result;
}

uint64_t sub_18AD6A0B0()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976C0);
  __swift_allocate_value_buffer(v0, qword_1EDF97518);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDF97518);
  return sub_18AF4EAE0();
}

uint64_t sub_18AD6A114()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976E0);
  __swift_allocate_value_buffer(v0, qword_1EDF97530);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDF97530);
  return sub_18AF4EB1C();
}

uint64_t sub_18AD6A1B8(uint64_t a1)
{
  return sub_18AD6A204(a1, qword_1EDF955E0);
}

uint64_t sub_18AD6A1E0(uint64_t a1)
{
  return sub_18AD6A204(a1, qword_1EDF97578);
}

uint64_t sub_18AD6A204(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D8);
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_18AF4EB1C();
}

uint64_t sub_18AD6A2A4()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D0);
  __swift_allocate_value_buffer(v0, qword_1EDF97558);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDF97558);
  return sub_18AF4EB1C();
}

uint64_t sub_18AD6A354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF975D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97668);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18ACBC6F4(&qword_1EDF97660, &qword_1EDF97668, MEMORY[0x1E0CAF898]);
  sub_18AF4E408();
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  sub_18AF4E3FC();
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97638);
  a1[4] = sub_18AD6EB38();
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_18ACBC6F4(&qword_1EDF975D0, &qword_1EDF975D8, MEMORY[0x1E0CAF850]);
  sub_18AF4E3D8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_18AD6A4F0@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97680);
  a1[4] = sub_18ACBC6F4(&qword_1EDF97670, &qword_1EDF97680, MEMORY[0x1E0CAF890]);
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_18ACBC6F4(&qword_1EDF97678, &qword_1EDF97680, MEMORY[0x1E0CAF898]);
  return sub_18AF4E408();
}

uint64_t sub_18AD6A584@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  v18[1] = a1;
  v3 = sub_18AF4E3F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF975F8);
  v19 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97698);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18ACBC6F4(&qword_1EDF97690, &qword_1EDF97698, MEMORY[0x1E0CAF898]);
  sub_18AF4E408();
  v20 = 30;
  sub_18AF4E3FC();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CAF808], v3);
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF975C0);
  a2[4] = sub_18AD6EA94();
  __swift_allocate_boxed_opaque_existential_1(a2);
  sub_18ACBC6F4(&qword_1EDF975F0, &qword_1EDF975F8, MEMORY[0x1E0CAF850]);
  sub_18AF4E3E4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_18AD6A78C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v34 = a1;
  v1 = sub_18AF4E3F0();
  v31 = *(_QWORD *)(v1 - 8);
  v32 = v1;
  MEMORY[0x1E0C80A78](v1, v2);
  v30 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF975F8);
  v37 = *(_QWORD *)(v35 - 8);
  MEMORY[0x1E0C80A78](v35, v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97628);
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33, v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97610);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97650);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18ACBC6F4(&qword_1EDF97640, &qword_1EDF97650, MEMORY[0x1E0CAF898]);
  sub_18AF4E408();
  swift_getKeyPath();
  sub_18AF4E3CC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  swift_getKeyPath();
  v20 = MEMORY[0x1E0CAF868];
  sub_18ACBC6F4(&qword_1EDF97600, &qword_1EDF97610, MEMORY[0x1E0CAF868]);
  sub_18AF4E3CC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  v38 = 1;
  sub_18AF4E3FC();
  v22 = v30;
  v21 = v31;
  v23 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v30, *MEMORY[0x1E0CAF810], v32);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF975B0);
  v25 = v34;
  v34[3] = v24;
  v25[4] = sub_18AD6E930();
  __swift_allocate_boxed_opaque_existential_1(v25);
  sub_18ACBC6F4(&qword_1EDF97618, &qword_1EDF97628, v20);
  sub_18ACBC6F4(&qword_1EDF975F0, &qword_1EDF975F8, MEMORY[0x1E0CAF850]);
  v26 = v33;
  v27 = v35;
  sub_18AF4E3E4();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v9, v26);
}

unint64_t sub_18AD6AAE8()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_18AD6AB04()
{
  return sub_18AF4E948();
}

uint64_t sub_18AD6AB24()
{
  return sub_18AF4E960();
}

uint64_t sub_18AD6AB38()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_18AF4FC38();
  v2 = objc_msgSend(v0, sel_cnui_imageNamed_, v1);

  return sub_18AF4F77C();
}

uint64_t sub_18AD6ABB0()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t OpaqueTypeConformance2;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976B0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18AF4EA08();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18AF4EA14();
  v10 = MEMORY[0x1E0CE95B8];
  MEMORY[0x18D774B54](v9, v5, MEMORY[0x1E0CE95B8]);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976B8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v5;
  v20 = v10;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x18D774B6C](v4, v0, OpaqueTypeConformance2);
  v19 = v0;
  v20 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v17 = sub_18AF4E9E4();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v17;
}

uint64_t sub_18AD6AD50()
{
  return sub_18AF4E990();
}

uint64_t sub_18AD6AD64()
{
  uint64_t v0;

  if (qword_1EDF97570 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDF97558);
  swift_beginAccess();
  sub_18AF4EB04();
  swift_endAccess();
  sub_18ACB7660();
  return sub_18AF4F518();
}

void sub_18AD6AE14(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002CLL;
  a1[1] = 0x800000018AF91300;
}

id CNTipsHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static CNTipsHelper.shared.getter()
{
  if (qword_1EDF97A48 != -1)
    swift_once();
  return (id)qword_1EDF98000;
}

void *sub_18AD6AE94()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_18AD6AF3C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_18AD6AF8C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_18AD6AFEC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_18AD6B030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 136) = a4;
  return swift_task_switch();
}

uint64_t sub_18AD6B048()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97708);
  v0[18] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[19] = v2;
  v0[20] = *(_QWORD *)(v2 + 64);
  v0[21] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF97710);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = swift_task_alloc();
  v0[22] = sub_18AD6E77C();
  sub_18AF4E930();
  v0[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976F0);
  swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976F8);
  swift_task_alloc();
  sub_18AF50298();
  sub_18ACBC6F4(&qword_1EDF97700, &qword_1EDF976F8, MEMORY[0x1E0DF0848]);
  sub_18AF4FE30();
  swift_task_dealloc();
  sub_18AF502B0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  sub_18AF502BC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_beginAccess();
  return swift_task_switch();
}

uint64_t sub_18AD6B228()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_18AF4EAF8();
  v0[24] = v1;
  v0[25] = *(_QWORD *)(v1 - 8);
  v0[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976C8);
  v0[27] = swift_task_alloc();
  v0[28] = sub_18AF502A4();
  sub_18ACBC6F4(&qword_1EDF976E8, &qword_1EDF976F0, MEMORY[0x1E0DF0830]);
  v2 = (_QWORD *)swift_task_alloc();
  v0[29] = v2;
  *v2 = v0;
  v2[1] = sub_18AD6B320;
  return sub_18AF4FDAC();
}

uint64_t sub_18AD6B320()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(uint64_t, _QWORD))(v2 + 224))(v2 + 56, 0);
  return swift_task_switch();
}

uint64_t sub_18AD6B390()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  _QWORD *v11;
  int *v12;

  v1 = v0[27];
  v2 = v0[24];
  v3 = v0[25];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_18AD6E7C0(v1);
    swift_task_dealloc();
    swift_task_dealloc();
    return swift_task_switch();
  }
  else
  {
    v5 = v0[18];
    v6 = v0[19];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v0[26], v1, v2);
    swift_task_dealloc();
    v7 = swift_task_alloc();
    v0[30] = v7;
    (*(void (**)(void))(v6 + 16))();
    v8 = (int *)sub_18AF502B0();
    v0[31] = v9;
    v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v0[32] = v10;
    v10(v7, v5);
    v12 = (int *)((char *)v8 + *v8);
    v11 = (_QWORD *)swift_task_alloc();
    v0[33] = v11;
    *v11 = v0;
    v11[1] = sub_18AD6B538;
    return ((uint64_t (*)(_QWORD *, _QWORD))v12)(v0 + 42, v0[26]);
  }
}

uint64_t sub_18AD6B4F4()
{
  uint64_t v0;

  (*(void (**)(uint64_t, uint64_t))(v0 + 224))(v0 + 56, 1);
  swift_task_dealloc();
  return swift_task_dealloc();
}

uint64_t sub_18AD6B538()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v3 = *(_QWORD *)(*v0 + 200);
  v2 = *(_QWORD *)(*v0 + 208);
  v4 = *(_QWORD *)(*v0 + 192);
  swift_task_dealloc();
  swift_release();
  *(_BYTE *)(v1 + 337) = *(_BYTE *)(v1 + 336);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_18AD6B5C4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_18AD6B60C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v1 = MEMORY[0x18D7779A4](*(_QWORD *)(v0 + 136) + 16);
  *(_QWORD *)(v0 + 272) = v1;
  if (v1)
  {
    v2 = (char *)v1;
    if ((*(_BYTE *)(v0 + 337) & 1) != 0)
    {
      v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
      swift_beginAccess();
      if (!*v3)
      {
        v4 = *(void **)&v2[OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_controller];
        *(_QWORD *)(v0 + 296) = v4;
        if (v4)
        {
          v5 = *(_QWORD *)(v0 + 176);
          *(_QWORD *)(v0 + 40) = &type metadata for SiriTip;
          *(_QWORD *)(v0 + 48) = v5;
          *(_QWORD *)(v0 + 304) = sub_18AF4FDC4();
          v6 = v4;
          *(_QWORD *)(v0 + 312) = sub_18AF4FDB8();
          sub_18AF4FD88();
        }
        else
        {

        }
        return swift_task_switch();
      }
    }
    else
    {
      v7 = *(void **)(v1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_controller);
      *(_QWORD *)(v0 + 280) = v7;
      if (v7)
      {
        sub_18AF4FDC4();
        v8 = v7;
        *(_QWORD *)(v0 + 288) = sub_18AF4FDB8();
        sub_18AF4FD88();
        return swift_task_switch();
      }
    }
    (*(void (**)(_QWORD, _QWORD))(v0 + 256))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 256))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18AD6B7A8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 144));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18AD6B7E8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 280);
  swift_release();
  objc_msgSend(v1, sel_setTipView_, 0);

  return swift_task_switch();
}

uint64_t sub_18AD6B83C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 144);

  v1(v2, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18AD6B894()
{
  uint64_t v0;

  swift_release();
  objc_allocWithZone((Class)sub_18AF4E978());
  *(_QWORD *)(v0 + 320) = sub_18AF4E984();
  return swift_task_switch();
}

uint64_t sub_18AD6B904()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 328) = sub_18AF4FDB8();
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD6B964()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 320);
  v2 = *(void **)(v0 + 296);
  swift_release();
  objc_msgSend(v2, sel_setTipView_, v1);

  return swift_task_switch();
}

uint64_t sub_18AD6B9C0()
{
  uint64_t v0;

  return swift_task_switch();
}

uint64_t sub_18AD6B9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 184) = a4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 192) = v5;
  *v5 = v4;
  v5[1] = sub_18AD6BA50;
  return sub_18AF4FE24();
}

uint64_t sub_18AD6BA50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_18AD6BABC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(v0 + 184) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x18D7779A4](v1);
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v3 = (void *)v2;
  v4 = *(void **)(v2 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_controller);
  *(_QWORD *)(v0 + 200) = v4;
  v5 = v4;

  if (!v4)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 208) = sub_18AF4FDC4();
  *(_QWORD *)(v0 + 216) = sub_18AF4FDB8();
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD6BB88()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  *(_BYTE *)(v0 + 258) = objc_msgSend(v1, sel_validateSiriEnabled);
  return swift_task_switch();
}

uint64_t sub_18AD6BBDC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  if (qword_1EDF97550 != -1)
    swift_once();
  v1 = *(_BYTE *)(v0 + 258);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D8);
  *(_QWORD *)(v0 + 224) = v2;
  __swift_project_value_buffer(v2, (uint64_t)qword_1EDF955E0);
  *(_BYTE *)(v0 + 257) = v1;
  swift_beginAccess();
  sub_18AF4EB10();
  swift_endAccess();
  *(_QWORD *)(v0 + 232) = sub_18AF4FDB8();
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD6BCD0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  *(_BYTE *)(v0 + 259) = objc_msgSend(v1, sel_validateSiriLanguage);
  return swift_task_switch();
}

uint64_t sub_18AD6BD24()
{
  uint64_t v0;
  char v1;

  if (qword_1EDF97598 != -1)
    swift_once();
  v1 = *(_BYTE *)(v0 + 259);
  __swift_project_value_buffer(*(_QWORD *)(v0 + 224), (uint64_t)qword_1EDF97578);
  *(_BYTE *)(v0 + 256) = v1;
  swift_beginAccess();
  sub_18AF4EB10();
  swift_endAccess();
  *(_QWORD *)(v0 + 240) = sub_18AF4FDB8();
  sub_18AF4FD88();
  return swift_task_switch();
}

uint64_t sub_18AD6BE0C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  *(_QWORD *)(v0 + 248) = objc_msgSend(v1, sel_getRecentCallCountAndSpeakableName);
  return swift_task_switch();
}

uint64_t sub_18AD6BE68()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v1 = *(void **)(v0 + 248);
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_speakableName);
    v3 = sub_18AF4FC5C();
    v5 = v4;

    if (qword_1EDF97570 != -1)
      swift_once();
    v6 = *(void **)(v0 + 248);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D0);
    __swift_project_value_buffer(v7, (uint64_t)qword_1EDF97558);
    *(_QWORD *)(v0 + 160) = v3;
    *(_QWORD *)(v0 + 168) = v5;
    swift_beginAccess();
    sub_18AF4EB10();
    swift_endAccess();
    v8 = objc_msgSend(v6, sel_callCount);
    if (qword_1EDF97548 != -1)
      swift_once();
    v9 = *(void **)(v0 + 248);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976E0);
    __swift_project_value_buffer(v10, (uint64_t)qword_1EDF97530);
    *(_QWORD *)(v0 + 176) = v8;
    swift_beginAccess();
    sub_18AF4EB10();
    swift_endAccess();

  }
  v11 = *(_QWORD *)(v0 + 184) + 16;
  swift_beginAccess();
  v12 = MEMORY[0x18D7779A4](v11);
  v13 = *(void **)(v0 + 200);
  if (v12)
  {
    v14 = (void *)v12;
    sub_18AD6E540();

    v13 = v14;
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18AD6C040()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_18AD6C068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_18ACBFE40;
  v3[23] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v3[24] = v4;
  *v4 = v3;
  v4[1] = sub_18AD6BA50;
  return sub_18AF4FE24();
}

void sub_18AD6C0E0()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;

  if (MEMORY[0x1E0CE93B8])
    v1 = MEMORY[0x1E0CE9398] == 0;
  else
    v1 = 1;
  if (!v1 && MEMORY[0x1E0CE93C0] != 0 && MEMORY[0x1E0CE93B0] != 0)
  {
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_startupTask))
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF955D0);
      sub_18AF4FE0C();
      swift_release();
    }
    v4 = OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_controller;
    v5 = *(void **)(v0 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_controller);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v6, sel_setTipView_, 0);
      v7 = *(void **)(v0 + v4);
      *(_QWORD *)(v0 + v4) = 0;

    }
    if (qword_1EDF97A48 != -1)
      swift_once();
    v8 = qword_1EDF98000;
    v9 = (os_unfair_lock_s *)(*(_QWORD *)(qword_1EDF98000 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_lock) + 16);
    os_unfair_lock_lock(v9);
    sub_18AD6C418(v8, 2u);
    os_unfair_lock_unlock(v9);
  }
}

uint64_t sub_18AD6C25C(uint64_t a1, uint64_t a2)
{
  qword_1EDF97A30 = a1;
  qword_1EDF97A38 = a2;
  sub_18AF4E9A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18AD6C290(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = *a2;
  v4 = (uint64_t *)(a1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_entries);
  swift_beginAccess();
  v5 = *v4;
  if (*(_QWORD *)(*v4 + 16) && (v6 = sub_18AD48DB4(v3), (v7 & 1) != 0))
  {
    v8 = *(_QWORD **)(*(_QWORD *)(v5 + 56) + 8 * v6);
    sub_18AF4E9A8();
    if (!v8)
      return swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v4;
    *v4 = 0x8000000000000000;
    v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    sub_18ACCF694(MEMORY[0x1E0DEE9D8], v3, isUniquelyReferenced_nonNull_native);
    *v4 = v19;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  sub_18AD6DE50((uint64_t)a2, (uint64_t)v17);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v8 = sub_18AD218EC(0, v8[2] + 1, 1, v8);
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
    v8 = sub_18AD218EC((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
  v8[2] = v11 + 1;
  v12 = &v8[7 * v11];
  v13 = v17[0];
  v14 = v17[1];
  v15 = v17[2];
  v12[10] = v18;
  *((_OWORD *)v12 + 3) = v14;
  *((_OWORD *)v12 + 4) = v15;
  *((_OWORD *)v12 + 2) = v13;
  return swift_bridgeObjectRelease();
}

void sub_18AD6C418(uint64_t a1, unsigned __int8 a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  void **v16;
  void *v17;
  _BYTE v18[48];
  uint64_t v19;

  v4 = (uint64_t *)(a1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_entries);
  swift_beginAccess();
  v5 = *v4;
  if (*(_QWORD *)(*v4 + 16))
  {
    v6 = sub_18AD48DB4(a2);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      v9 = *(_QWORD *)(v8 + 16);
      if (v9)
      {
        v10 = v8 + 32;
        sub_18AF4E9A8();
        do
        {
          sub_18AD6DE50(v10, (uint64_t)v18);
          swift_retain();
          sub_18AD6DEA8((uint64_t)v18);
          sub_18AF4FE0C();
          swift_release();
          v10 += 56;
          --v9;
        }
        while (v9);
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      v11 = sub_18AD48DB4(a2);
      if ((v12 & 1) != 0)
      {
        v13 = v11;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v15 = *v4;
        v19 = *v4;
        *v4 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_18AD54144();
          v15 = v19;
        }
        sub_18AD6D6BC(v13, v15);
        *v4 = v15;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      v16 = (void **)(a1 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
      swift_beginAccess();
      v17 = *v16;
      *v16 = 0;

    }
  }
}

id CNTipsHelper.__deallocating_deinit()
{
  return sub_18ACB677C(type metadata accessor for CNTipsHelper);
}

uint64_t CNTipHeaderView.displaysBottomSeparator.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator);
  swift_beginAccess();
  return *v1;
}

void CNTipHeaderView.displaysBottomSeparator.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator);
  swift_beginAccess();
  *v3 = a1;
  sub_18AD6CD14();
}

uint64_t (*CNTipHeaderView.displaysBottomSeparator.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_18AD6C7DC;
}

uint64_t sub_18AD6C7DC(uint64_t a1, char a2)
{
  return sub_18AD6C9E8(a1, a2, (uint64_t (*)(uint64_t))sub_18AD6CD14);
}

void *sub_18AD6C7F4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_18AD6C8BC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_18AD6D2E0();
}

void sub_18AD6C924(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

  sub_18AD6D2E0();
}

uint64_t (*sub_18AD6C994(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_18AD6C9DC;
}

uint64_t sub_18AD6C9DC(uint64_t a1, char a2)
{
  return sub_18AD6C9E8(a1, a2, (uint64_t (*)(uint64_t))sub_18AD6D2E0);
}

uint64_t sub_18AD6C9E8(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return a3(result);
  return result;
}

double static CNTipHeaderView.verticalInsetTotal.getter()
{
  return 32.0;
}

char *CNTipHeaderView.__allocating_init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  objc_class *v8;
  id v17;

  v17 = objc_allocWithZone(v8);
  return CNTipHeaderView.init(frame:separatorInset:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

char *CNTipHeaderView.init(frame:separatorInset:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BYTE *v8;
  _OWORD *v17;
  __int128 v18;
  char *v19;
  double *v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  objc_super v27;

  v17 = &v8[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_separatorEdgeInset];
  v18 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v17 = *MEMORY[0x1E0DC49E8];
  v17[1] = v18;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView] = 0;
  v8[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView] = 0;
  v27.receiver = v8;
  v27.super_class = (Class)type metadata accessor for CNTipHeaderView();
  v19 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v19, sel_setLayoutMargins_, 16.0, 16.0, 16.0, 16.0);
  v20 = (double *)&v19[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_separatorEdgeInset];
  *v20 = a5;
  v20[1] = a6;
  v20[2] = a7;
  v20[3] = a8;
  v21 = (void **)&v19[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView];
  swift_beginAccess();
  v22 = *v21;
  if (*v21)
  {
    v23 = (void *)objc_opt_self();
    v24 = v22;
    v25 = objc_msgSend(v23, sel_tertiarySystemFillColor);
    objc_msgSend(v24, sel_setBackgroundColor_, v25);

  }
  sub_18AD6D2E0();
  sub_18AD6D088();

  return v19;
}

void sub_18AD6CD14()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;

  v1 = v0;
  v2 = OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView;
  v3 = *(void **)&v0[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_bottomSeparatorView];
  if (v3)
  {
    objc_msgSend(v3, sel_removeFromSuperview);
    v4 = *(void **)&v0[v2];
    *(_QWORD *)&v0[v2] = 0;

    v5 = *(void **)&v0[v2];
    if (v5)
    {
LABEL_8:
      v14 = v5;
      objc_msgSend(v1, sel_addSubview_, v14);
      v15 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v15, sel_scale);
      v17 = v16;

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_18AF86900;
      v19 = objc_msgSend(v14, sel_leadingAnchor);
      v20 = objc_msgSend(v1, sel_leadingAnchor);
      v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, *(double *)&v1[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_separatorEdgeInset + 8]);

      *(_QWORD *)(v18 + 32) = v21;
      v22 = objc_msgSend(v14, sel_heightAnchor);
      v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, 1.0 / v17);

      *(_QWORD *)(v18 + 40) = v23;
      v24 = objc_msgSend(v14, sel_widthAnchor);
      v25 = objc_msgSend(v1, sel_widthAnchor);
      v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

      *(_QWORD *)(v18 + 48) = v26;
      v27 = objc_msgSend(v1, sel_bottomAnchor);
      v28 = objc_msgSend(v14, sel_bottomAnchor);
      v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

      *(_QWORD *)(v18 + 56) = v29;
      sub_18AF4FD4C();
      sub_18ACEC0A0();
      v30 = (void *)sub_18AF4FD28();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v30);

      return;
    }
  }
  v6 = &v0[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator];
  swift_beginAccess();
  if (*v6 != 1)
  {
LABEL_7:
    v5 = *(void **)&v1[v2];
    if (!v5)
      return;
    goto LABEL_8;
  }
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v8 = *(void **)&v1[v2];
  *(_QWORD *)&v1[v2] = v7;

  v9 = *(void **)&v1[v2];
  if (v9)
  {
    objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v10 = *(void **)&v1[v2];
    if (v10)
    {
      v11 = (void *)objc_opt_self();
      v12 = v10;
      v13 = objc_msgSend(v11, sel_separatorColor);
      objc_msgSend(v12, sel_setBackgroundColor_, v13);

      goto LABEL_7;
    }
  }
}

void sub_18AD6D088()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = *MEMORY[0x1E0DC48E8];
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5[4] = sub_18AD6DE30;
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_18AD6D23C;
  v5[3] = &block_descriptor_17;
  v3 = _Block_copy(v5);
  swift_release();
  v4 = objc_msgSend(v0, sel_addObserverForName_object_queue_usingBlock_, v1, 0, 0, v3);
  _Block_release(v3);
  swift_unknownObjectRelease();

}

void sub_18AD6D190(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D7779A4](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (id *)(v3 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView);
    swift_beginAccess();
    v6 = objc_msgSend(*v5, sel_superview);

    if (v6)
      objc_msgSend(*v5, sel_removeFromSuperview);
    sub_18AD6D2E0();

  }
}

uint64_t sub_18AD6D23C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *);
  uint64_t v9;

  v2 = sub_18AF4E27C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(char *))(a1 + 32);
  sub_18AF4E270();
  swift_retain();
  v7(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_18AD6D2E0()
{
  char *v0;
  void *v1;
  id *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v1 = v0;
  v2 = (id *)&v0[OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView];
  swift_beginAccess();
  if (*v2)
  {
    v3 = *v2;
    v4 = objc_msgSend(v3, sel_superview);

    if (!v4)
    {
      objc_msgSend(v1, sel_addSubview_, v3);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDF955A0);
      v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_18AF86900;
      v6 = objc_msgSend(v3, sel_leadingAnchor);
      v7 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v8 = objc_msgSend(v7, sel_leadingAnchor);

      v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v8);
      *(_QWORD *)(v5 + 32) = v9;
      v10 = objc_msgSend(v3, sel_topAnchor);
      v11 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v12 = objc_msgSend(v11, sel_topAnchor);

      v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
      *(_QWORD *)(v5 + 40) = v13;
      v14 = objc_msgSend(v3, sel_trailingAnchor);
      v15 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v16 = objc_msgSend(v15, sel_trailingAnchor);

      v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
      *(_QWORD *)(v5 + 48) = v17;
      v18 = objc_msgSend(v1, sel_layoutMarginsGuide);
      v19 = objc_msgSend(v18, sel_bottomAnchor);

      v20 = objc_msgSend(v3, sel_bottomAnchor);
      v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

      *(_QWORD *)(v5 + 56) = v21;
      sub_18AF4FD4C();
      sub_18ACEC0A0();
      v22 = sub_18AF4FD28();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_addConstraints_, v22, v5);

      v3 = (id)v22;
    }

  }
}

id CNTipHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void CNTipHeaderView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CNTipHeaderView.__deallocating_deinit()
{
  return sub_18ACB677C(type metadata accessor for CNTipHeaderView);
}

unint64_t sub_18AD6D6BC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_18AF50184();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_18AF504B4();
        sub_18AF504C0();
        result = sub_18AF504E4();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_BYTE *)(v10 + v3);
          v12 = (_BYTE *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_18AD6D874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_18ACC02C0;
  v7[17] = a5;
  return swift_task_switch();
}

uint64_t type metadata accessor for CNTipHeaderView()
{
  return objc_opt_self();
}

id sub_18AD6D8F4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView, a2);
}

uint64_t sub_18AD6D904@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_18AD6D954(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_displaysBottomSeparator);
  swift_beginAccess();
  *v3 = v2;
  sub_18AD6CD14();
}

id sub_18AD6D9AC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC10ContactsUI15CNTipHeaderView_hostingView, a2);
}

uint64_t method lookup function for CNTipsHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNTipsHelper.currentTipView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CNTipsHelper.currentTipView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CNTipsHelper.currentTipView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CNTipsHelper.tipKitStartObservation(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CNTipsHelper.tipKitStopObservation()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CNTipsHelper.tipKitSetSiriTipContext(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t method lookup function for CNTipHeaderView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CNTipHeaderView.hostingView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CNTipHeaderView.hostingView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CNTipHeaderView.hostingView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CNTipHeaderView.__allocating_init(frame:separatorInset:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t destroy for CNTipsHelper.Entry(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  return swift_release();
}

uint64_t initializeWithCopy for CNTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CNTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for CNTipsHelper.Entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CNTipsHelper.Entry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CNTipsHelper.Entry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CNTipsHelper.Entry()
{
  return &type metadata for CNTipsHelper.Entry;
}

uint64_t getEnumTagSinglePayload for CNTipsHelper.Entry.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CNTipsHelper.Entry.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18AD6DD68 + 4 * byte_18AF8B18D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_18AD6DD9C + 4 * byte_18AF8B188[v4]))();
}

uint64_t sub_18AD6DD9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD6DDA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18AD6DDACLL);
  return result;
}

uint64_t sub_18AD6DDB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18AD6DDC0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_18AD6DDC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18AD6DDCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CNTipsHelper.Entry.Kind()
{
  return &type metadata for CNTipsHelper.Entry.Kind;
}

unint64_t sub_18AD6DDEC()
{
  unint64_t result;

  result = qword_1EDF98038;
  if (!qword_1EDF98038)
  {
    result = MEMORY[0x18D777800](&unk_18AF8B224, &type metadata for CNTipsHelper.Entry.Kind);
    atomic_store(result, (unint64_t *)&qword_1EDF98038);
  }
  return result;
}

void sub_18AD6DE30(uint64_t a1)
{
  uint64_t v1;

  sub_18AD6D190(a1, v1);
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

uint64_t sub_18AD6DE50(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a2 = *(_BYTE *)a1;
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2 + 8, a1 + 8);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 48);
  swift_retain();
  return a2;
}

uint64_t sub_18AD6DEA8(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  swift_release();
  return a1;
}

uint64_t sub_18AD6DED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, __n128);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  __n128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v51[3];
  uint64_t (*v52)(char *, uint64_t);

  v0 = sub_18AF4EABC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 64);
  MEMORY[0x1E0C80A78](v0, v3);
  v4 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (qword_1EDF97570 != -1)
    swift_once();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D0);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EDF97558);
  v7 = swift_beginAccess();
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))((char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v5, v9);
  sub_18AF4EAD4();
  v51[2] = sub_18AF4E99C();
  v52 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v12 = v52((char *)v51 - v4, v0);
  v51[0] = v51;
  MEMORY[0x1E0C80A78](v12, v13);
  v14 = (char *)v51 - v4;
  v15 = v0;
  if (qword_1EDF97550 != -1)
    swift_once();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976D8);
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EDF955E0);
  v18 = swift_beginAccess();
  v19 = *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64);
  v21 = MEMORY[0x1E0C80A78](v18, v20);
  v22 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  v24 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v23 + 16);
  v24((char *)v51 - v22, v17, v16, v21);
  sub_18AF4EAD4();
  v51[1] = sub_18AF4E99C();
  v25 = v52(v14, v15);
  v51[0] = v51;
  MEMORY[0x1E0C80A78](v25, v26);
  v27 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (qword_1EDF97598 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v16, (uint64_t)qword_1EDF97578);
  v29 = swift_beginAccess();
  v31 = MEMORY[0x1E0C80A78](v29, v30);
  v24((char *)v51 - v22, v28, v16, v31);
  sub_18AF4EAD4();
  sub_18AF4E99C();
  v32 = v52((char *)v51 - v27, v15);
  MEMORY[0x1E0C80A78](v32, v33);
  if (qword_1EDF97548 != -1)
    swift_once();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976E0);
  v35 = __swift_project_value_buffer(v34, (uint64_t)qword_1EDF97530);
  v36 = swift_beginAccess();
  v38 = MEMORY[0x1E0C80A78](v36, v37);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v40 + 16))((char *)v51 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0), v35, v34, v38);
  sub_18AF4EAD4();
  sub_18AF4E99C();
  v41 = v52((char *)v51 - v27, v15);
  MEMORY[0x1E0C80A78](v41, v42);
  v43 = (char *)v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDF955C0 != -1)
    swift_once();
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976C0);
  v45 = __swift_project_value_buffer(v44, (uint64_t)qword_1EDF97518);
  v46 = MEMORY[0x1E0C80A78](v45, v45);
  (*(void (**)(char *, __n128))(v48 + 16))((char *)v51 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0), v46);
  sub_18AF4E9CC();
  sub_18AD6E864(&qword_1EDF976A8, MEMORY[0x1E0CE9480]);
  sub_18AD6E864(&qword_1EDF976A0, MEMORY[0x1E0CE9470]);
  sub_18AF4EAC8();
  sub_18AF4E99C();
  v52(v43, v15);
  sub_18AF4E9A8();
  swift_bridgeObjectRelease();
  sub_18AF4E9B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18AF4E9B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18AF4E9B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v49 = sub_18AF4E9B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v49;
}

void sub_18AD6E540()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  os_unfair_lock_s *v13;
  unsigned __int8 v15[32];
  ValueMetadata *v16;
  unint64_t v17;
  uint64_t v18;

  if (MEMORY[0x1E0CE93B8])
    v1 = MEMORY[0x1E0CE9398] == 0;
  else
    v1 = 1;
  if (!v1 && MEMORY[0x1E0CE93C0] != 0 && MEMORY[0x1E0CE93B0] != 0)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF98020);
    MEMORY[0x1E0C80A78](v4, v5);
    v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    v8 = sub_18AF4FDE8();
    (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
    v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v9;
    v11 = sub_18ACE3AB8((uint64_t)v7, (uint64_t)&unk_1EDF9AD20, (uint64_t)v10);
    v16 = &type metadata for SiriTip;
    v12 = sub_18AD6E77C();
    v15[0] = 2;
    v17 = v12;
    v18 = v11;
    v13 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_lock) + 16);
    swift_retain();
    os_unfair_lock_lock(v13);
    sub_18AD6C290(v0, v15);
    os_unfair_lock_unlock(v13);
    swift_release();
    sub_18AD6DEA8((uint64_t)v15);
  }
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18AD6E6FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_18ACBFE40;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&asc_1EDF9AD18[*(int *)asc_1EDF9AD18])(a1, v4, v5, (uint64_t)&asc_1EDF9AD18[*(int *)asc_1EDF9AD18], v6);
}

unint64_t sub_18AD6E77C()
{
  unint64_t result;

  result = qword_1EDF975A0;
  if (!qword_1EDF975A0)
  {
    result = MEMORY[0x18D777800](&unk_18AF8B2CC, &type metadata for SiriTip);
    atomic_store(result, (unint64_t *)&qword_1EDF975A0);
  }
  return result;
}

uint64_t sub_18AD6E7C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for SiriTip()
{
  return &type metadata for SiriTip;
}

uint64_t sub_18AD6E810()
{
  return MEMORY[0x1E0CE0400];
}

unint64_t sub_18AD6E820()
{
  unint64_t result;

  result = qword_1EDF98040;
  if (!qword_1EDF98040)
  {
    result = MEMORY[0x18D777800](&unk_18AF8B254, &type metadata for SiriTip);
    atomic_store(result, (unint64_t *)&qword_1EDF98040);
  }
  return result;
}

uint64_t sub_18AD6E864(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_18AF4E9CC();
    result = MEMORY[0x18D777800](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18AD6E8A4()
{
  return sub_18AD6E864(&qword_1EDF976A8, MEMORY[0x1E0CE9480]);
}

uint64_t sub_18AD6E8C8()
{
  return sub_18AD6E864(&qword_1EDF976A0, MEMORY[0x1E0CE9470]);
}

uint64_t sub_18AD6E8EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDF976C0);
  result = sub_18AF4EAEC();
  *a1 = result;
  return result;
}

uint64_t sub_18AD6E920@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

unint64_t sub_18AD6E930()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF975A8;
  if (!qword_1EDF975A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF975B0);
    v2[0] = sub_18AD6E9B4();
    v2[1] = sub_18ACBC6F4(&qword_1EDF975E0, &qword_1EDF975F8, MEMORY[0x1E0CE9220]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE9208], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF975A8);
  }
  return result;
}

unint64_t sub_18AD6E9B4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EDF97620;
  if (!qword_1EDF97620)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF97628);
    v2 = sub_18AD6EA18();
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE9230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDF97620);
  }
  return result;
}

unint64_t sub_18AD6EA18()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EDF97608;
  if (!qword_1EDF97608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF97610);
    v2 = sub_18ACBC6F4(&qword_1EDF97648, &qword_1EDF97650, MEMORY[0x1E0CE9240]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CE9230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EDF97608);
  }
  return result;
}

unint64_t sub_18AD6EA94()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF975B8;
  if (!qword_1EDF975B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF975C0);
    v2[0] = sub_18ACBC6F4(&qword_1EDF97688, &qword_1EDF97698, MEMORY[0x1E0CAF890]);
    v2[1] = sub_18AD6EBDC(&qword_1EDF975E8, &qword_1EDF975F8, MEMORY[0x1E0DEB448], MEMORY[0x1E0DEB420]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CAF7D8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF975B8);
  }
  return result;
}

unint64_t sub_18AD6EB38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDF97630;
  if (!qword_1EDF97630)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDF97638);
    v2[0] = sub_18ACBC6F4(&qword_1EDF97658, &qword_1EDF97668, MEMORY[0x1E0CAF890]);
    v2[1] = sub_18AD6EBDC(&qword_1EDF975C8, &qword_1EDF975D8, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA970]);
    result = MEMORY[0x18D777800](MEMORY[0x1E0CAF878], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDF97630);
  }
  return result;
}

uint64_t sub_18AD6EBDC(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x18D777800](MEMORY[0x1E0CAF848], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_18AD6F050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SLComposeViewControllerFunction()
{
  return (id)classSLComposeViewController;
}

Class initSLComposeViewController()
{
  Class result;

  if (LoadSocial_loadPredicate != -1)
    dispatch_once(&LoadSocial_loadPredicate, &__block_literal_global_144);
  result = objc_getClass("SLComposeViewController");
  classSLComposeViewController = (uint64_t)result;
  getSLComposeViewControllerClass[0] = (uint64_t (*)())SLComposeViewControllerFunction;
  return result;
}

id SLServiceTypeSinaWeiboFunction()
{
  return (id)constantSLServiceTypeSinaWeibo;
}

id initSLServiceTypeSinaWeibo()
{
  id *v0;

  if (LoadSocial_loadPredicate != -1)
    dispatch_once(&LoadSocial_loadPredicate, &__block_literal_global_144);
  v0 = (id *)dlsym((void *)LoadSocial_frameworkLibrary, "SLServiceTypeSinaWeibo");
  objc_storeStrong((id *)&constantSLServiceTypeSinaWeibo, *v0);
  getSLServiceTypeSinaWeibo[0] = (uint64_t (*)())SLServiceTypeSinaWeiboFunction;
  return (id)constantSLServiceTypeSinaWeibo;
}

id IDSIDQueryControllerFunction()
{
  return (id)classIDSIDQueryController;
}

Class initIDSIDQueryController()
{
  Class result;

  if (LoadIDS_loadPredicate != -1)
    dispatch_once(&LoadIDS_loadPredicate, &__block_literal_global);
  result = objc_getClass("IDSIDQueryController");
  classIDSIDQueryController = (uint64_t)result;
  getIDSIDQueryControllerClass[0] = (uint64_t (*)())IDSIDQueryControllerFunction;
  return result;
}

id IDSServiceAvailabilityDidChangeNotificationFunction()
{
  return (id)constantIDSServiceAvailabilityDidChangeNotification;
}

id initIDSServiceAvailabilityDidChangeNotification()
{
  id *v0;

  if (LoadIDS_loadPredicate != -1)
    dispatch_once(&LoadIDS_loadPredicate, &__block_literal_global);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary, "IDSServiceAvailabilityDidChangeNotification");
  objc_storeStrong((id *)&constantIDSServiceAvailabilityDidChangeNotification, *v0);
  getIDSServiceAvailabilityDidChangeNotification[0] = (uint64_t (*)())IDSServiceAvailabilityDidChangeNotificationFunction;
  return (id)constantIDSServiceAvailabilityDidChangeNotification;
}

uint64_t kCNUIContactToSanitizedManagedContact_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13CC8], "contactByRemovingSensitiveDataFromContact:", a2);
}

uint64_t kCNUIContactToSanitizedWhitelistedContact_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13CD0], "contactByRemovingSensitiveDataFromContact:", a2);
}

void sub_18AD77840(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18AD77900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AD78110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id GKFriendRequestFacilitatorFunction()
{
  return (id)classGKFriendRequestFacilitator;
}

Class initGKFriendRequestFacilitator()
{
  Class result;

  if (LoadGameCenterUI_loadPredicate != -1)
    dispatch_once(&LoadGameCenterUI_loadPredicate, &__block_literal_global_67);
  result = objc_getClass("GKFriendRequestFacilitator");
  classGKFriendRequestFacilitator = (uint64_t)result;
  getGKFriendRequestFacilitatorClass[0] = (uint64_t (*)())GKFriendRequestFacilitatorFunction;
  return result;
}

id GKDaemonProxyFunction()
{
  return (id)classGKDaemonProxy;
}

id GKLocalPlayerFunction()
{
  return (id)classGKLocalPlayer;
}

void sub_18AD78A68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AD78BB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AD78D20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AD806B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AD811F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id IDSServiceNameiMessageFunction_1753()
{
  return (id)constantIDSServiceNameiMessage_1769;
}

id initIDSServiceNameiMessage_1754()
{
  id *v0;

  if (LoadIDS_loadPredicate_1767 != -1)
    dispatch_once(&LoadIDS_loadPredicate_1767, &__block_literal_global_237);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_1768, "IDSServiceNameiMessage");
  objc_storeStrong((id *)&constantIDSServiceNameiMessage_1769, *v0);
  getIDSServiceNameiMessage_1752 = (uint64_t (*)())IDSServiceNameiMessageFunction_1753;
  return (id)constantIDSServiceNameiMessage_1769;
}

void sub_18AD8269C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIPPronounPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IntlPreferencesUILibraryCore_frameworkLibrary)
    IntlPreferencesUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IntlPreferencesUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntlPreferencesUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNIntlPreferencesUISoftlink.h"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IPPronounPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIPPronounPickerViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNIntlPreferencesUISoftlink.h"), 15, CFSTR("Unable to find class %s"), "IPPronounPickerViewController");

LABEL_8:
    __break(1u);
  }
  getIPPronounPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

CNUICoreApplicationAuthorizationItem *sRecordToItem_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNUICoreApplicationAuthorizationItem *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  CNUICoreApplicationAuthorizationItem *v9;

  v2 = a2;
  v3 = [CNUICoreApplicationAuthorizationItem alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "recordType") != 0;
  v8 = objc_msgSend(v2, "authorizationStatus");

  v9 = -[CNUICoreApplicationAuthorizationItem initWithIcon:name:bundleIdentifier:deviceType:authorization:](v3, "initWithIcon:name:bundleIdentifier:deviceType:authorization:", v4, v5, v6, v7, v8);
  return v9;
}

void sub_18AD838C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AD83A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AD8709C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AD87E10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AD89450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2299(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2300(uint64_t a1)
{

}

void sub_18AD8AEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2695(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__2696(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id MKMapSnapshotterFunction()
{
  return (id)classMKMapSnapshotter;
}

id CLGeocoderFunction()
{
  return (id)classCLGeocoder;
}

id MKMapSnapshotOptionsFunction()
{
  return (id)classMKMapSnapshotOptions;
}

id MKMapSnapshotFeatureAnnotationFunction()
{
  return (id)classMKMapSnapshotFeatureAnnotation;
}

id MKPlacemarkFunction()
{
  return (id)classMKPlacemark;
}

id nameForSanitizedClass(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isSubclassOfClass:", v7, (_QWORD)v10) & 1) != 0)
        {
          a1 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  NSStringFromClass((Class)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_18AD937BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3750(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__3751(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_18AD96224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_18AD96550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18AD96894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3963(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3964(uint64_t a1)
{

}

void sub_18AD9A64C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18AD9CD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVTViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarKitLibraryCore_frameworkLibrary)
    AvatarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTViewClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 66, CFSTR("Unable to find class %s"), "AVTView");

LABEL_8:
    __break(1u);
  }
  getAVTViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVTAvatarRecordRenderingClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary)
    AvatarUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarRecordRendering");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordRenderingClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 24, CFSTR("Unable to find class %s"), "AVTAvatarRecordRendering");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarRecordRenderingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADA4814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVTPoseSelectionViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_5844)
    AvatarUILibraryCore_frameworkLibrary_5844 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_5844)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTPoseSelectionViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTPoseSelectionViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 26, CFSTR("Unable to find class %s"), "AVTPoseSelectionViewController");

LABEL_8:
    __break(1u);
  }
  getAVTPoseSelectionViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADA940C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIMNicknameControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IMCoreLibraryCore_frameworkLibrary)
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNUIIMCoreSoftLink.h"), 12, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IMNicknameController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIMNicknameControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNUIIMCoreSoftLink.h"), 13, CFSTR("Unable to find class %s"), "IMNicknameController");

LABEL_8:
    __break(1u);
  }
  getIMNicknameControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADBD1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ADC6198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIMNicknameControllerClass_block_invoke_10663(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IMCoreLibraryCore_frameworkLibrary_10664)
    IMCoreLibraryCore_frameworkLibrary_10664 = _sl_dlopen();
  if (!IMCoreLibraryCore_frameworkLibrary_10664)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNUIIMCoreSoftLink.h"), 12, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IMNicknameController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIMNicknameControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNUIIMCoreSoftLink.h"), 13, CFSTR("Unable to find class %s"), "IMNicknameController");

LABEL_8:
    __break(1u);
  }
  getIMNicknameControllerClass_softClass_10662 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADC79FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_18ADC7BA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id MIUIDisplayConfigurationFunction()
{
  return (id)classMIUIDisplayConfiguration;
}

Class initMIUIDisplayConfiguration()
{
  Class result;

  if (LoadMedicalIDUI_loadPredicate != -1)
    dispatch_once(&LoadMedicalIDUI_loadPredicate, &__block_literal_global_273);
  result = objc_getClass("MIUIDisplayConfiguration");
  classMIUIDisplayConfiguration = (uint64_t)result;
  getMIUIDisplayConfigurationClass[0] = (uint64_t (*)())MIUIDisplayConfigurationFunction;
  return result;
}

id MIUIMedicalIDViewControllerFunction()
{
  return (id)classMIUIMedicalIDViewController;
}

Class initMIUIMedicalIDViewController()
{
  Class result;

  if (LoadMedicalIDUI_loadPredicate != -1)
    dispatch_once(&LoadMedicalIDUI_loadPredicate, &__block_literal_global_273);
  result = objc_getClass("MIUIMedicalIDViewController");
  classMIUIMedicalIDViewController = (uint64_t)result;
  getMIUIMedicalIDViewControllerClass[0] = (uint64_t (*)())MIUIMedicalIDViewControllerFunction;
  return result;
}

id HKMedicalIDViewControllerFunction()
{
  return (id)classHKMedicalIDViewController;
}

Class initHKMedicalIDViewController()
{
  Class result;

  if (LoadHealthUI_loadPredicate != -1)
    dispatch_once(&LoadHealthUI_loadPredicate, &__block_literal_global_10828);
  result = objc_getClass("HKMedicalIDViewController");
  classHKMedicalIDViewController = (uint64_t)result;
  getHKMedicalIDViewControllerClass[0] = (uint64_t (*)())HKMedicalIDViewControllerFunction;
  return result;
}

void sub_18ADCD2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ADCF8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ADD2C20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id initkUTTypePNG()
{
  id *v0;

  if (LoadMobileCoreServices_loadPredicate != -1)
    dispatch_once(&LoadMobileCoreServices_loadPredicate, &__block_literal_global_435);
  v0 = (id *)dlsym((void *)LoadMobileCoreServices_frameworkLibrary, "kUTTypePNG");
  objc_storeStrong((id *)&constantkUTTypePNG, *v0);
  getkUTTypePNG = (uint64_t (*)())kUTTypePNGFunction;
  return (id)constantkUTTypePNG;
}

id kUTTypePNGFunction()
{
  return (id)constantkUTTypePNG;
}

id initkUTTypeJPEG()
{
  id *v0;

  if (LoadMobileCoreServices_loadPredicate != -1)
    dispatch_once(&LoadMobileCoreServices_loadPredicate, &__block_literal_global_435);
  v0 = (id *)dlsym((void *)LoadMobileCoreServices_frameworkLibrary, "kUTTypeJPEG");
  objc_storeStrong((id *)&constantkUTTypeJPEG, *v0);
  getkUTTypeJPEG = (uint64_t (*)())kUTTypeJPEGFunction;
  return (id)constantkUTTypeJPEG;
}

id kUTTypeJPEGFunction()
{
  return (id)constantkUTTypeJPEG;
}

id QLPreviewControllerFunction()
{
  return (id)classQLPreviewController;
}

Class initQLPreviewController()
{
  Class result;

  if (LoadQuickLook_loadPredicate != -1)
    dispatch_once(&LoadQuickLook_loadPredicate, &__block_literal_global_439);
  result = objc_getClass("QLPreviewController");
  classQLPreviewController = (uint64_t)result;
  getQLPreviewControllerClass[0] = (uint64_t (*)())QLPreviewControllerFunction;
  return result;
}

void sub_18ADDCD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_18ADDE618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18ADDEC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVTAvatarStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_12937)
    AvatarUILibraryCore_frameworkLibrary_12937 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_12937)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarStoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 20, CFSTR("Unable to find class %s"), "AVTAvatarStore");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADE1FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13327(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13328(uint64_t a1)
{

}

Class __getIPPronounPickerViewControllerClass_block_invoke_13637(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IntlPreferencesUILibraryCore_frameworkLibrary_13638)
    IntlPreferencesUILibraryCore_frameworkLibrary_13638 = _sl_dlopen();
  if (!IntlPreferencesUILibraryCore_frameworkLibrary_13638)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntlPreferencesUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNIntlPreferencesUISoftlink.h"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IPPronounPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIPPronounPickerViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNIntlPreferencesUISoftlink.h"), 15, CFSTR("Unable to find class %s"), "IPPronounPickerViewController");

LABEL_8:
    __break(1u);
  }
  getIPPronounPickerViewControllerClass_softClass_13636 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18ADE6920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPISegmentationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotoImagingLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PISegmentation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPISegmentationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPISegmentationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNPhotosSoftLink.h"), 50, CFSTR("Unable to find class %s"), "PISegmentation");

    __break(1u);
  }
}

void PhotoImagingLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotoImagingLibraryCore_frameworkLibrary)
    PhotoImagingLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotoImagingLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotoImagingLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNPhotosSoftLink.h"), 49, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_18ADE74D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPISegmentationLoaderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotoImagingLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PISegmentationLoader");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPISegmentationLoaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPISegmentationLoaderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNPhotosSoftLink.h"), 51, CFSTR("Unable to find class %s"), "PISegmentationLoader");

    __break(1u);
  }
}

void sub_18ADEA3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18ADF0DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarRecordImageProviderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarRecordImageProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarRecordImageProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordImageProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 23, CFSTR("Unable to find class %s"), "AVTAvatarRecordImageProvider");

    __break(1u);
  }
}

void AvatarUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_15554)
    AvatarUILibraryCore_frameworkLibrary_15554 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_15554)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getAVTAvatarFetchRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarFetchRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarFetchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarFetchRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 19, CFSTR("Unable to find class %s"), "AVTAvatarFetchRequest");

    __break(1u);
  }
}

void __getAVTAvatarStoreClass_block_invoke_15566(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarStoreClass_softClass_15565 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarStoreClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 20, CFSTR("Unable to find class %s"), "AVTAvatarStore");

    __break(1u);
  }
}

void sub_18ADF16BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTRenderingScopeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTRenderingScopeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTRenderingScopeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 21, CFSTR("Unable to find class %s"), "AVTRenderingScope");

    __break(1u);
  }
}

void sub_18ADF2CE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18ADF40FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;

  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(v25);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__15824(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__15825(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_18ADF54BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ADF5668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18ADF685C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__16223(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__16224(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_18ADF81F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AE01510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE01D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18456(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18457(uint64_t a1)
{

}

void sub_18AE04E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18AE05F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE06580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarRecordImageProviderClass_block_invoke_19014(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_19017();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarRecordImageProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarRecordImageProviderClass_softClass_19013 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordImageProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 23, CFSTR("Unable to find class %s"), "AVTAvatarRecordImageProvider");

    __break(1u);
  }
}

void __getAVTRenderingScopeClass_block_invoke_19016(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_19017();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTRenderingScopeClass_softClass_19015 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTRenderingScopeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 21, CFSTR("Unable to find class %s"), "AVTRenderingScope");

    __break(1u);
  }
}

void AvatarUILibrary_19017()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_19024)
    AvatarUILibraryCore_frameworkLibrary_19024 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_19024)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_18AE08D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id initkAssistantDirectActionEventKey()
{
  id *v0;

  if (LoadAssistantServices_loadPredicate != -1)
    dispatch_once(&LoadAssistantServices_loadPredicate, &__block_literal_global_255);
  v0 = (id *)dlsym((void *)LoadAssistantServices_frameworkLibrary, "kAssistantDirectActionEventKey");
  objc_storeStrong((id *)&constantkAssistantDirectActionEventKey, *v0);
  getkAssistantDirectActionEventKey[0] = (uint64_t (*)())kAssistantDirectActionEventKeyFunction;
  return (id)constantkAssistantDirectActionEventKey;
}

id kAssistantDirectActionEventKeyFunction()
{
  return (id)constantkAssistantDirectActionEventKey;
}

id SiriDirectActionContextFunction()
{
  return (id)classSiriDirectActionContext;
}

Class initSiriDirectActionContext()
{
  Class result;

  if (LoadSiriActivation_loadPredicate != -1)
    dispatch_once(&LoadSiriActivation_loadPredicate, &__block_literal_global_258);
  result = objc_getClass("SiriDirectActionContext");
  classSiriDirectActionContext = (uint64_t)result;
  getSiriDirectActionContextClass[0] = (uint64_t (*)())SiriDirectActionContextFunction;
  return result;
}

id SiriDirectActionSourceFunction()
{
  return (id)classSiriDirectActionSource;
}

Class initSiriDirectActionSource()
{
  Class result;

  if (LoadSiriActivation_loadPredicate != -1)
    dispatch_once(&LoadSiriActivation_loadPredicate, &__block_literal_global_258);
  result = objc_getClass("SiriDirectActionSource");
  classSiriDirectActionSource = (uint64_t)result;
  getSiriDirectActionSourceClass[0] = (uint64_t (*)())SiriDirectActionSourceFunction;
  return result;
}

id GEOCountryConfigurationFunction()
{
  return (id)classGEOCountryConfiguration;
}

Class initGEOCountryConfiguration()
{
  Class result;

  if (LoadGeoServices_loadPredicate != -1)
    dispatch_once(&LoadGeoServices_loadPredicate, &__block_literal_global_252);
  result = objc_getClass("GEOCountryConfiguration");
  classGEOCountryConfiguration = (uint64_t)result;
  getGEOCountryConfigurationClass[0] = (uint64_t (*)())GEOCountryConfigurationFunction;
  return result;
}

void sub_18AE11A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20818(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20819(uint64_t a1)
{

}

void sub_18AE136E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE13900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTStickerGeneratorClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTStickerGenerator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTStickerGeneratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTStickerGeneratorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 68, CFSTR("Unable to find class %s"), "AVTStickerGenerator");

    __break(1u);
  }
}

void __getAVTStickerGeneratorPosterOptionsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTStickerGeneratorPosterOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTStickerGeneratorPosterOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTStickerGeneratorPosterOptionsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 70, CFSTR("Unable to find class %s"), "AVTStickerGeneratorPosterOptions");

    __break(1u);
  }
}

void AvatarKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarKitLibraryCore_frameworkLibrary_21358)
    AvatarKitLibraryCore_frameworkLibrary_21358 = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary_21358)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getAVTAvatarRecordImageProviderClass_block_invoke_21365(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_21368();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarRecordImageProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarRecordImageProviderClass_softClass_21364 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordImageProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 23, CFSTR("Unable to find class %s"), "AVTAvatarRecordImageProvider");

    __break(1u);
  }
}

void __getAVTRenderingScopeClass_block_invoke_21367(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_21368();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTRenderingScopeClass_softClass_21366 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTRenderingScopeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 21, CFSTR("Unable to find class %s"), "AVTRenderingScope");

    __break(1u);
  }
}

void AvatarUILibrary_21368()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_21371)
    AvatarUILibraryCore_frameworkLibrary_21371 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_21371)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_18AE1E938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE2071C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21538(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21539(uint64_t a1)
{

}

id SLComposeViewControllerFunction_21560()
{
  return (id)classSLComposeViewController_21564;
}

Class initSLComposeViewController_21561()
{
  Class result;

  if (LoadSocial_loadPredicate_21563 != -1)
    dispatch_once(&LoadSocial_loadPredicate_21563, &__block_literal_global_1541);
  result = objc_getClass("SLComposeViewController");
  classSLComposeViewController_21564 = (uint64_t)result;
  getSLComposeViewControllerClass_21559 = (uint64_t (*)())SLComposeViewControllerFunction_21560;
  return result;
}

void sub_18AE27C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id IDSIDQueryControllerFunction_21960()
{
  return (id)classIDSIDQueryController_21966;
}

Class initIDSIDQueryController_21961()
{
  Class result;

  if (LoadIDS_loadPredicate_21964 != -1)
    dispatch_once(&LoadIDS_loadPredicate_21964, &__block_literal_global_115_21965);
  result = objc_getClass("IDSIDQueryController");
  classIDSIDQueryController_21966 = (uint64_t)result;
  getIDSIDQueryControllerClass_21959 = (uint64_t (*)(void))IDSIDQueryControllerFunction_21960;
  return result;
}

uint64_t initIDSCopyIDForEmailAddress(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = LoadIDS_loadPredicate_21964;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&LoadIDS_loadPredicate_21964, &__block_literal_global_115_21965);
  softLinkIDSCopyIDForEmailAddress[0] = (uint64_t (*)())dlsym((void *)LoadIDS_frameworkLibrary_21969, "IDSCopyIDForEmailAddress");
  v3 = ((uint64_t (*)(id))softLinkIDSCopyIDForEmailAddress[0])(v2);

  return v3;
}

uint64_t initIDSCopyIDForPhoneNumberWithOptions(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = LoadIDS_loadPredicate_21964;
  v6 = a2;
  v7 = a1;
  if (v5 != -1)
    dispatch_once(&LoadIDS_loadPredicate_21964, &__block_literal_global_115_21965);
  softLinkIDSCopyIDForPhoneNumberWithOptions[0] = (uint64_t (*)())dlsym((void *)LoadIDS_frameworkLibrary_21969, "IDSCopyIDForPhoneNumberWithOptions");
  v8 = ((uint64_t (*)(id, id, uint64_t))softLinkIDSCopyIDForPhoneNumberWithOptions[0])(v7, v6, a3);

  return v8;
}

void sub_18AE2B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22489(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22490(uint64_t a1)
{

}

void sub_18AE2DD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22917(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22918(uint64_t a1)
{

}

void sub_18AE30C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MUPlaceViewControllerConfigurationFunction()
{
  return (id)classMUPlaceViewControllerConfiguration;
}

Class initMUPlaceViewControllerConfiguration()
{
  Class result;

  if (LoadMapsUI_loadPredicate != -1)
    dispatch_once(&LoadMapsUI_loadPredicate, &__block_literal_global_699);
  result = objc_getClass("MUPlaceViewControllerConfiguration");
  classMUPlaceViewControllerConfiguration = (uint64_t)result;
  getMUPlaceViewControllerConfigurationClass[0] = (uint64_t (*)())MUPlaceViewControllerConfigurationFunction;
  return result;
}

id MUPlaceViewControllerFunction()
{
  return (id)classMUPlaceViewController;
}

Class initMUPlaceViewController()
{
  Class result;

  if (LoadMapsUI_loadPredicate != -1)
    dispatch_once(&LoadMapsUI_loadPredicate, &__block_literal_global_699);
  result = objc_getClass("MUPlaceViewController");
  classMUPlaceViewController = (uint64_t)result;
  getMUPlaceViewControllerClass[0] = (uint64_t (*)())MUPlaceViewControllerFunction;
  return result;
}

id MKLocalSearchRequestFunction()
{
  return (id)classMKLocalSearchRequest;
}

Class initMKLocalSearchRequest()
{
  Class result;

  if (LoadMapKit_loadPredicate_23318 != -1)
    dispatch_once(&LoadMapKit_loadPredicate_23318, &__block_literal_global_703);
  result = objc_getClass("MKLocalSearchRequest");
  classMKLocalSearchRequest = (uint64_t)result;
  getMKLocalSearchRequestClass[0] = (uint64_t (*)())MKLocalSearchRequestFunction;
  return result;
}

id MKLocalSearchFunction()
{
  return (id)classMKLocalSearch;
}

Class initMKLocalSearch()
{
  Class result;

  if (LoadMapKit_loadPredicate_23318 != -1)
    dispatch_once(&LoadMapKit_loadPredicate_23318, &__block_literal_global_703);
  result = objc_getClass("MKLocalSearch");
  classMKLocalSearch = (uint64_t)result;
  getMKLocalSearchClass[0] = (uint64_t (*)())MKLocalSearchFunction;
  return result;
}

void sub_18AE39514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Unwind_Resume(exception_object);
}

void sub_18AE3ADD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE3F25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t kCNUIContactToIdentifier_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __Block_byref_object_copy__25712(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25713(uint64_t a1)
{

}

id SGSuggestedActionMetricsFunction()
{
  return (id)classSGSuggestedActionMetrics;
}

Class initSGSuggestedActionMetrics()
{
  Class result;

  if (LoadCoreSuggestions_loadPredicate != -1)
    dispatch_once(&LoadCoreSuggestions_loadPredicate, &__block_literal_global_26970);
  result = objc_getClass("SGSuggestedActionMetrics");
  classSGSuggestedActionMetrics = (uint64_t)result;
  getSGSuggestedActionMetricsClass[0] = (uint64_t (*)())SGSuggestedActionMetricsFunction;
  return result;
}

id _LargeDatabasesLowSeveritySignpostLogHandle()
{
  if (_LargeDatabasesLowSeveritySignpostLogHandle_cn_once_token_1 != -1)
    dispatch_once(&_LargeDatabasesLowSeveritySignpostLogHandle_cn_once_token_1, &__block_literal_global_2_27041);
  return (id)_LargeDatabasesLowSeveritySignpostLogHandle_cn_once_object_1;
}

id PRSPosterConfigurationAttributesFunction()
{
  return (id)classPRSPosterConfigurationAttributes;
}

Class initPRSPosterConfigurationAttributes()
{
  Class result;

  if (LoadPosterBoardServices_loadPredicate != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate, &__block_literal_global_27546);
  result = objc_getClass("PRSPosterConfigurationAttributes");
  classPRSPosterConfigurationAttributes = (uint64_t)result;
  getPRSPosterConfigurationAttributesClass[0] = (uint64_t (*)())PRSPosterConfigurationAttributesFunction;
  return result;
}

id PRPosterConfiguredPropertiesFunction()
{
  return (id)classPRPosterConfiguredProperties;
}

Class initPRPosterConfiguredProperties()
{
  Class result;

  if (LoadPosterKit_loadPredicate != -1)
    dispatch_once(&LoadPosterKit_loadPredicate, &__block_literal_global_4_27550);
  result = objc_getClass("PRPosterConfiguredProperties");
  classPRPosterConfiguredProperties = (uint64_t)result;
  getPRPosterConfiguredPropertiesClass[0] = (uint64_t (*)())PRPosterConfiguredPropertiesFunction;
  return result;
}

id PRSPosterRoleIncomingCallFunction()
{
  return (id)constantPRSPosterRoleIncomingCall;
}

id initPRSPosterRoleIncomingCall()
{
  id *v0;

  if (LoadPosterBoardServices_loadPredicate != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate, &__block_literal_global_27546);
  v0 = (id *)dlsym((void *)LoadPosterBoardServices_frameworkLibrary, "PRSPosterRoleIncomingCall");
  objc_storeStrong((id *)&constantPRSPosterRoleIncomingCall, *v0);
  getPRSPosterRoleIncomingCall[0] = (uint64_t (*)())PRSPosterRoleIncomingCallFunction;
  return (id)constantPRSPosterRoleIncomingCall;
}

id PRUISPosterConfigurationFinalizerFunction()
{
  return (id)classPRUISPosterConfigurationFinalizer;
}

Class initPRUISPosterConfigurationFinalizer()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate, &__block_literal_global_8_27542);
  result = objc_getClass("PRUISPosterConfigurationFinalizer");
  classPRUISPosterConfigurationFinalizer = (uint64_t)result;
  getPRUISPosterConfigurationFinalizerClass[0] = (uint64_t (*)())PRUISPosterConfigurationFinalizerFunction;
  return result;
}

void sub_18AE51B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE53DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE540AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27916(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27917(uint64_t a1)
{

}

id _PSContactSuggesterFunction()
{
  return (id)class_PSContactSuggester;
}

Class init_PSContactSuggester()
{
  Class result;

  if (LoadPeopleSuggester_loadPredicate != -1)
    dispatch_once(&LoadPeopleSuggester_loadPredicate, &__block_literal_global_321);
  result = objc_getClass("_PSContactSuggester");
  class_PSContactSuggester = (uint64_t)result;
  get_PSContactSuggesterClass = (uint64_t (*)())_PSContactSuggesterFunction;
  return result;
}

void sub_18AE5BA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVTAvatarRecordRenderingClass_block_invoke_28943(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_28959)
    AvatarUILibraryCore_frameworkLibrary_28959 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_28959)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarRecordRendering");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordRenderingClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 24, CFSTR("Unable to find class %s"), "AVTAvatarRecordRendering");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarRecordRenderingClass_softClass_28942 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVTStickerGeneratorClass_block_invoke_28945(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarKitLibraryCore_frameworkLibrary_28946)
    AvatarKitLibraryCore_frameworkLibrary_28946 = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary_28946)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTStickerGenerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTStickerGeneratorClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 68, CFSTR("Unable to find class %s"), "AVTStickerGenerator");

LABEL_8:
    __break(1u);
  }
  getAVTStickerGeneratorClass_softClass_28944 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AE5CDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE5DBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29181(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29182(uint64_t a1)
{

}

id IDSServiceNameFaceTimeFunction_29421()
{
  return (id)constantIDSServiceNameFaceTime_29427;
}

id initIDSServiceNameFaceTime_29422()
{
  id *v0;

  if (LoadIDS_loadPredicate_29423 != -1)
    dispatch_once(&LoadIDS_loadPredicate_29423, &__block_literal_global_41_29424);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_29425, "IDSServiceNameFaceTime");
  objc_storeStrong((id *)&constantIDSServiceNameFaceTime_29427, *v0);
  getIDSServiceNameFaceTime_29420 = (uint64_t (*)())IDSServiceNameFaceTimeFunction_29421;
  return (id)constantIDSServiceNameFaceTime_29427;
}

id TLVibrationManagerFunction()
{
  return (id)classTLVibrationManager;
}

Class initTLVibrationManager()
{
  Class result;

  if (LoadToneLibrary_loadPredicate != -1)
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_29821);
  result = objc_getClass("TLVibrationManager");
  classTLVibrationManager = (uint64_t)result;
  getTLVibrationManagerClass[0] = (uint64_t (*)())TLVibrationManagerFunction;
  return result;
}

id TLToneManagerFunction()
{
  return (id)classTLToneManager;
}

Class initTLToneManager()
{
  Class result;

  if (LoadToneLibrary_loadPredicate != -1)
    dispatch_once(&LoadToneLibrary_loadPredicate, &__block_literal_global_29821);
  result = objc_getClass("TLToneManager");
  classTLToneManager = (uint64_t)result;
  getTLToneManagerClass[0] = (uint64_t (*)())TLToneManagerFunction;
  return result;
}

uint64_t kHKMedicalIDDidChangeNotificationFunction()
{
  return constantkHKMedicalIDDidChangeNotification;
}

uint64_t __Block_byref_object_copy__30290(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30291(uint64_t a1)
{

}

id HKMedicalIDStoreFunction()
{
  return (id)classHKMedicalIDStore;
}

id HKMedicalIDViewControllerFunction_30316()
{
  return (id)classHKMedicalIDViewController_30319;
}

Class initHKMedicalIDViewController_30317()
{
  Class result;

  if (LoadHealthUI_loadPredicate_30318 != -1)
    dispatch_once(&LoadHealthUI_loadPredicate_30318, &__block_literal_global_288);
  result = objc_getClass("HKMedicalIDViewController");
  classHKMedicalIDViewController_30319 = (uint64_t)result;
  getHKMedicalIDViewControllerClass_30315 = (uint64_t (*)())HKMedicalIDViewControllerFunction_30316;
  return result;
}

id _HKMedicalIDDataFunction()
{
  return (id)class_HKMedicalIDData;
}

Class init_HKMedicalIDData()
{
  Class result;

  if (LoadHealthKit_loadPredicate != -1)
    dispatch_once(&LoadHealthKit_loadPredicate, &__block_literal_global_284);
  result = objc_getClass("_HKMedicalIDData");
  class_HKMedicalIDData = (uint64_t)result;
  get_HKMedicalIDDataClass[0] = (uint64_t (*)())_HKMedicalIDDataFunction;
  return result;
}

void sub_18AE67DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18AE68108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  id *v31;
  uint64_t v32;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_18AE6841C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,char a25)
{
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_18AE68740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Block_object_dispose((const void *)(v30 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18AE6897C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30378(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30379(uint64_t a1)
{

}

void sub_18AE6E48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE6E758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarRecordImageProviderClass_block_invoke_31151(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_31154();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarRecordImageProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarRecordImageProviderClass_softClass_31150 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordImageProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 23, CFSTR("Unable to find class %s"), "AVTAvatarRecordImageProvider");

    __break(1u);
  }
}

void __getAVTRenderingScopeClass_block_invoke_31153(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_31154();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTRenderingScopeClass_softClass_31152 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTRenderingScopeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 21, CFSTR("Unable to find class %s"), "AVTRenderingScope");

    __break(1u);
  }
}

void AvatarUILibrary_31154()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_31162)
    AvatarUILibraryCore_frameworkLibrary_31162 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_31162)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

Class __getAVTStickerGeneratorOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarKitLibraryCore_frameworkLibrary_31176)
    AvatarKitLibraryCore_frameworkLibrary_31176 = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary_31176)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTStickerGeneratorOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTStickerGeneratorOptionsClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 69, CFSTR("Unable to find class %s"), "AVTStickerGeneratorOptions");

LABEL_8:
    __break(1u);
  }
  getAVTStickerGeneratorOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__31172(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31173(uint64_t a1)
{

}

id CUShutterButtonFunction()
{
  return (id)classCUShutterButton;
}

Class initCUShutterButton()
{
  Class result;

  if (LoadCameraUI_loadPredicate != -1)
    dispatch_once(&LoadCameraUI_loadPredicate, &__block_literal_global_31212);
  result = objc_getClass("CUShutterButton");
  classCUShutterButton = (uint64_t)result;
  getCUShutterButtonClass[0] = (uint64_t (*)())CUShutterButtonFunction;
  return result;
}

void sub_18AE6FD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id FBSOpenApplicationServiceFunction()
{
  return (id)classFBSOpenApplicationService;
}

Class initFBSOpenApplicationService()
{
  Class result;

  if (LoadCarPlayServices_loadPredicate != -1)
    dispatch_once(&LoadCarPlayServices_loadPredicate, &__block_literal_global_235);
  result = objc_getClass("FBSOpenApplicationService");
  classFBSOpenApplicationService = (uint64_t)result;
  getFBSOpenApplicationServiceClass[0] = (uint64_t (*)())FBSOpenApplicationServiceFunction;
  return result;
}

void __Block_byref_object_copy__31388(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__31389(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_18AE71488(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sActionTypeValueToEmptyModel_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v2 = (void *)MEMORY[0x1E0D13D90];
  v3 = a2;
  objc_msgSend(v2, "emptyModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_18AE7428C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE748C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE75178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE76E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PHPickerViewControllerFunction()
{
  return (id)classPHPickerViewController;
}

Class initPHPickerViewController()
{
  Class result;

  if (LoadPhotosUI_loadPredicate != -1)
    dispatch_once(&LoadPhotosUI_loadPredicate, &__block_literal_global_707);
  result = objc_getClass("PHPickerViewController");
  classPHPickerViewController = (uint64_t)result;
  getPHPickerViewControllerClass[0] = (uint64_t (*)())PHPickerViewControllerFunction;
  return result;
}

Class __getAVTAvatarEditorViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_32019)
    AvatarUILibraryCore_frameworkLibrary_32019 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_32019)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarEditorViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarEditorViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 25, CFSTR("Unable to find class %s"), "AVTAvatarEditorViewController");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarEditorViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AE7A8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE7BD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32682(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32683(uint64_t a1)
{

}

Class __getAVTCombinedPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_32687)
    AvatarUILibraryCore_frameworkLibrary_32687 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_32687)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTCombinedPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTCombinedPickerViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 30, CFSTR("Unable to find class %s"), "AVTCombinedPickerViewController");

LABEL_8:
    __break(1u);
  }
  getAVTCombinedPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AE80A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AE86064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AE868C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34738(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34739(uint64_t a1)
{

}

Class __getAVTAvatarRecordSerializerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_34762)
    AvatarUILibraryCore_frameworkLibrary_34762 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_34762)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarRecordSerializer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordSerializerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 27, CFSTR("Unable to find class %s"), "AVTAvatarRecordSerializer");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarRecordSerializerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AE87B4C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id PHPhotoLibraryFunction()
{
  return (id)classPHPhotoLibrary;
}

Class initPHPhotoLibrary()
{
  Class result;

  if (LoadPhotos_loadPredicate != -1)
    dispatch_once(&LoadPhotos_loadPredicate, &__block_literal_global_35210);
  result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary = (uint64_t)result;
  getPHPhotoLibraryClass = (uint64_t (*)())PHPhotoLibraryFunction;
  return result;
}

uint64_t _isRomanName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "cnui_containsNonLatinCharacters") & 1) != 0)
      v3 = 0;
    else
      v3 = objc_msgSend(v2, "cnui_containsEmojiCharacters") ^ 1;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

void sub_18AE8FBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarStoreClass_block_invoke_35920(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_35928();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarStoreClass_softClass_35919 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarStoreClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 20, CFSTR("Unable to find class %s"), "AVTAvatarStore");

    __break(1u);
  }
}

id getAVTAvatarFetchRequestClass_35921()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVTAvatarFetchRequestClass_softClass_35926;
  v7 = getAVTAvatarFetchRequestClass_softClass_35926;
  if (!getAVTAvatarFetchRequestClass_softClass_35926)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVTAvatarFetchRequestClass_block_invoke_35927;
    v3[3] = &unk_1E204EBC0;
    v3[4] = &v4;
    __getAVTAvatarFetchRequestClass_block_invoke_35927((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AE90234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarFetchRequestClass_block_invoke_35927(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_35928();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarFetchRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarFetchRequestClass_softClass_35926 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarFetchRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 19, CFSTR("Unable to find class %s"), "AVTAvatarFetchRequest");

    __break(1u);
  }
}

void AvatarUILibrary_35928()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_35935)
    AvatarUILibraryCore_frameworkLibrary_35935 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_35935)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_18AE90EF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AE90F94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AE910A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AE92578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36386(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36387(uint64_t a1)
{

}

id PHAssetChangeRequestFunction()
{
  return (id)classPHAssetChangeRequest;
}

Class initPHAssetChangeRequest()
{
  Class result;

  if (LoadPhotos_loadPredicate_36392 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_36392, &__block_literal_global_136);
  result = objc_getClass("PHAssetChangeRequest");
  classPHAssetChangeRequest = (uint64_t)result;
  getPHAssetChangeRequestClass[0] = (uint64_t (*)())PHAssetChangeRequestFunction;
  return result;
}

void sub_18AE97F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_18AE98234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STNotificationKeyPINSuccessFunction()
{
  return (id)constantSTNotificationKeyPINSuccess;
}

id initSTNotificationKeyPINSuccess()
{
  id *v0;

  if (LoadScreenTimeUI_loadPredicate != -1)
    dispatch_once(&LoadScreenTimeUI_loadPredicate, &__block_literal_global_37769);
  v0 = (id *)dlsym((void *)LoadScreenTimeUI_frameworkLibrary, "STNotificationKeyPINSuccess");
  objc_storeStrong((id *)&constantSTNotificationKeyPINSuccess, *v0);
  getSTNotificationKeyPINSuccess[0] = (uint64_t (*)())STNotificationKeyPINSuccessFunction;
  return (id)constantSTNotificationKeyPINSuccess;
}

id STRemotePasscodeControllerFunction()
{
  return (id)classSTRemotePasscodeController;
}

Class initSTRemotePasscodeController()
{
  Class result;

  if (LoadScreenTimeUI_loadPredicate != -1)
    dispatch_once(&LoadScreenTimeUI_loadPredicate, &__block_literal_global_37769);
  result = objc_getClass("STRemotePasscodeController");
  classSTRemotePasscodeController = (uint64_t)result;
  getSTRemotePasscodeControllerClass[0] = (uint64_t (*)())STRemotePasscodeControllerFunction;
  return result;
}

id STRestrictionsPINControllerDidFinishNotificationFunction()
{
  return (id)constantSTRestrictionsPINControllerDidFinishNotification;
}

id initSTRestrictionsPINControllerDidFinishNotification()
{
  id *v0;

  if (LoadScreenTimeUI_loadPredicate != -1)
    dispatch_once(&LoadScreenTimeUI_loadPredicate, &__block_literal_global_37769);
  v0 = (id *)dlsym((void *)LoadScreenTimeUI_frameworkLibrary, "STRestrictionsPINControllerDidFinishNotification");
  objc_storeStrong((id *)&constantSTRestrictionsPINControllerDidFinishNotification, *v0);
  getSTRestrictionsPINControllerDidFinishNotification[0] = (uint64_t (*)())STRestrictionsPINControllerDidFinishNotificationFunction;
  return (id)constantSTRestrictionsPINControllerDidFinishNotification;
}

void CNUISetLoggingBlock(const void *a1)
{
  void *v1;
  void *v2;

  v1 = _Block_copy(a1);
  v2 = (void *)_loggingBlock;
  _loggingBlock = (uint64_t)v1;

}

id CNUILogAccountsAndGroupsList()
{
  if (CNUILogAccountsAndGroupsList_cn_once_token_1 != -1)
    dispatch_once(&CNUILogAccountsAndGroupsList_cn_once_token_1, &__block_literal_global_10_38027);
  return (id)CNUILogAccountsAndGroupsList_cn_once_object_1;
}

id CNUILogContactList()
{
  if (CNUILogContactList_cn_once_token_3 != -1)
    dispatch_once(&CNUILogContactList_cn_once_token_3, &__block_literal_global_15_38036);
  return (id)CNUILogContactList_cn_once_object_3;
}

id CNUILogContactPhotoPicker()
{
  if (CNUILogContactPhotoPicker_cn_once_token_5 != -1)
    dispatch_once(&CNUILogContactPhotoPicker_cn_once_token_5, &__block_literal_global_19_38042);
  return (id)CNUILogContactPhotoPicker_cn_once_object_5;
}

id CNUILogViewService()
{
  if (CNUILogViewService_cn_once_token_7 != -1)
    dispatch_once(&CNUILogViewService_cn_once_token_7, &__block_literal_global_23_38048);
  return (id)CNUILogViewService_cn_once_object_7;
}

id CNUILogTesting()
{
  if (CNUILogTesting_cn_once_token_8 != -1)
    dispatch_once(&CNUILogTesting_cn_once_token_8, &__block_literal_global_25_38050);
  return (id)CNUILogTesting_cn_once_object_8;
}

id CNUILogPosters()
{
  if (CNUILogPosters_cn_once_token_9 != -1)
    dispatch_once(&CNUILogPosters_cn_once_token_9, &__block_literal_global_27_38054);
  return (id)CNUILogPosters_cn_once_object_9;
}

id CNUILogRemoteAlert()
{
  if (CNUILogRemoteAlert_cn_once_token_10 != -1)
    dispatch_once(&CNUILogRemoteAlert_cn_once_token_10, &__block_literal_global_29_38058);
  return (id)CNUILogRemoteAlert_cn_once_object_10;
}

id CNUILogStarkSiriExperiment()
{
  if (CNUILogStarkSiriExperiment_cn_once_token_11 != -1)
    dispatch_once(&CNUILogStarkSiriExperiment_cn_once_token_11, &__block_literal_global_31);
  return (id)CNUILogStarkSiriExperiment_cn_once_object_11;
}

id CNUILogStarkUtilities()
{
  if (CNUILogStarkUtilities_cn_once_token_12 != -1)
    dispatch_once(&CNUILogStarkUtilities_cn_once_token_12, &__block_literal_global_33_38063);
  return (id)CNUILogStarkUtilities_cn_once_object_12;
}

id AFPreferencesFunction()
{
  return (id)classAFPreferences;
}

Class initAFPreferences()
{
  Class result;

  if (LoadAssistantServices_loadPredicate_38073 != -1)
    dispatch_once(&LoadAssistantServices_loadPredicate_38073, &__block_literal_global_38074);
  result = objc_getClass("AFPreferences");
  classAFPreferences = (uint64_t)result;
  getAFPreferencesClass[0] = (uint64_t (*)())AFPreferencesFunction;
  return result;
}

uint64_t ___suggestedContact_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested");
}

void sub_18AE9DDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA319C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AEA3A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA3DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA409C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id MIUIDisplayConfigurationFunction_39340()
{
  return (id)classMIUIDisplayConfiguration_39353;
}

Class initMIUIDisplayConfiguration_39341()
{
  Class result;

  if (LoadMedicalIDUI_loadPredicate_39347 != -1)
    dispatch_once(&LoadMedicalIDUI_loadPredicate_39347, &__block_literal_global_376);
  result = objc_getClass("MIUIDisplayConfiguration");
  classMIUIDisplayConfiguration_39353 = (uint64_t)result;
  getMIUIDisplayConfigurationClass_39339 = (uint64_t (*)())MIUIDisplayConfigurationFunction_39340;
  return result;
}

id MIUIMedicalIDViewControllerFunction_39343()
{
  return (id)classMIUIMedicalIDViewController_39349;
}

Class initMIUIMedicalIDViewController_39344()
{
  Class result;

  if (LoadMedicalIDUI_loadPredicate_39347 != -1)
    dispatch_once(&LoadMedicalIDUI_loadPredicate_39347, &__block_literal_global_376);
  result = objc_getClass("MIUIMedicalIDViewController");
  classMIUIMedicalIDViewController_39349 = (uint64_t)result;
  getMIUIMedicalIDViewControllerClass_39342 = (uint64_t (*)())MIUIMedicalIDViewControllerFunction_39343;
  return result;
}

id HKMedicalIDViewControllerFunction_39355()
{
  return (id)classHKMedicalIDViewController_39358;
}

Class initHKMedicalIDViewController_39356()
{
  Class result;

  if (LoadHealthUI_loadPredicate_39357 != -1)
    dispatch_once(&LoadHealthUI_loadPredicate_39357, &__block_literal_global_373);
  result = objc_getClass("HKMedicalIDViewController");
  classHKMedicalIDViewController_39358 = (uint64_t)result;
  getHKMedicalIDViewControllerClass_39354 = (uint64_t (*)())HKMedicalIDViewControllerFunction_39355;
  return result;
}

id _HKEmergencyContactFunction()
{
  return (id)class_HKEmergencyContact;
}

Class init_HKEmergencyContact()
{
  Class result;

  if (LoadHealthKit_loadPredicate_39371 != -1)
    dispatch_once(&LoadHealthKit_loadPredicate_39371, &__block_literal_global_370);
  result = objc_getClass("_HKEmergencyContact");
  class_HKEmergencyContact = (uint64_t)result;
  get_HKEmergencyContactClass[0] = (uint64_t (*)())_HKEmergencyContactFunction;
  return result;
}

void sub_18AEA4BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA4D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA5D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AEA62C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AEA6478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AvatarUILibrary_39530()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AvatarUILibraryCore_frameworkLibrary_39538)
    AvatarUILibraryCore_frameworkLibrary_39538 = _sl_dlopen();
  v0 = (void *)AvatarUILibraryCore_frameworkLibrary_39538;
  if (!AvatarUILibraryCore_frameworkLibrary_39538)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getAVTAvatarStoreClass_block_invoke_39547(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_39530();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarStoreClass_softClass_39546 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarStoreClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 20, CFSTR("Unable to find class %s"), "AVTAvatarStore");

    __break(1u);
  }
}

id GKDaemonProxyFunction_39781()
{
  return (id)classGKDaemonProxy_39796;
}

Class initGKDaemonProxy_39782()
{
  Class result;

  if (LoadGameCenterFoundation_loadPredicate_39793 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_39793, &__block_literal_global_77_39794);
  result = objc_getClass("GKDaemonProxy");
  classGKDaemonProxy_39796 = (uint64_t)result;
  getGKDaemonProxyClass_39780 = (uint64_t (*)())GKDaemonProxyFunction_39781;
  return result;
}

id GKLocalPlayerFunction_39784()
{
  return (id)classGKLocalPlayer_39788;
}

Class initGKLocalPlayer_39785()
{
  Class result;

  if (LoadGameCenterUICore_loadPredicate_39786 != -1)
    dispatch_once(&LoadGameCenterUICore_loadPredicate_39786, &__block_literal_global_80);
  result = objc_getClass("GKLocalPlayer");
  classGKLocalPlayer_39788 = (uint64_t)result;
  getGKLocalPlayerClass_39783 = (uint64_t (*)())GKLocalPlayerFunction_39784;
  return result;
}

id IDSServiceNameiMessageFunction_40256()
{
  return (id)constantIDSServiceNameiMessage_40262;
}

id initIDSServiceNameiMessage_40257()
{
  id *v0;

  if (LoadIDS_loadPredicate_40258 != -1)
    dispatch_once(&LoadIDS_loadPredicate_40258, &__block_literal_global_40259);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_40260, "IDSServiceNameiMessage");
  objc_storeStrong((id *)&constantIDSServiceNameiMessage_40262, *v0);
  getIDSServiceNameiMessage_40255 = (uint64_t (*)())IDSServiceNameiMessageFunction_40256;
  return (id)constantIDSServiceNameiMessage_40262;
}

void sub_18AEAB7E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AEAF30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AEB1784(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_18AEB265C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AEB2A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41862(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41863(uint64_t a1)
{

}

id PHObjectFunction()
{
  return (id)classPHObject;
}

Class initPHObject()
{
  Class result;

  if (LoadPhotos_loadPredicate_42126 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_42126, &__block_literal_global_286);
  result = objc_getClass("PHObject");
  classPHObject = (uint64_t)result;
  getPHObjectClass[0] = (uint64_t (*)())PHObjectFunction;
  return result;
}

id PHPickerConfigurationFunction()
{
  return (id)classPHPickerConfiguration;
}

Class initPHPickerConfiguration()
{
  Class result;

  if (LoadPhotosUI_loadPredicate_42161 != -1)
    dispatch_once(&LoadPhotosUI_loadPredicate_42161, &__block_literal_global_280);
  result = objc_getClass("PHPickerConfiguration");
  classPHPickerConfiguration = (uint64_t)result;
  getPHPickerConfigurationClass[0] = (uint64_t (*)())PHPickerConfigurationFunction;
  return result;
}

id PHPickerFilterFunction()
{
  return (id)classPHPickerFilter;
}

Class initPHPickerFilter()
{
  Class result;

  if (LoadPhotosUI_loadPredicate_42161 != -1)
    dispatch_once(&LoadPhotosUI_loadPredicate_42161, &__block_literal_global_280);
  result = objc_getClass("PHPickerFilter");
  classPHPickerFilter = (uint64_t)result;
  getPHPickerFilterClass[0] = (uint64_t (*)())PHPickerFilterFunction;
  return result;
}

id PHPickerViewControllerFunction_42159()
{
  return (id)classPHPickerViewController_42162;
}

Class initPHPickerViewController_42160()
{
  Class result;

  if (LoadPhotosUI_loadPredicate_42161 != -1)
    dispatch_once(&LoadPhotosUI_loadPredicate_42161, &__block_literal_global_280);
  result = objc_getClass("PHPickerViewController");
  classPHPickerViewController_42162 = (uint64_t)result;
  getPHPickerViewControllerClass_42158 = (uint64_t (*)())PHPickerViewControllerFunction_42159;
  return result;
}

Class init_PHPickerSuggestionGroup()
{
  Class result;

  if (LoadPhotosUI_loadPredicate_42161 != -1)
    dispatch_once(&LoadPhotosUI_loadPredicate_42161, &__block_literal_global_280);
  result = objc_getClass("_PHPickerSuggestionGroup");
  class_PHPickerSuggestionGroup = (uint64_t)result;
  get_PHPickerSuggestionGroupClass[0] = (uint64_t (*)())_PHPickerSuggestionGroupFunction;
  return result;
}

id _PHPickerSuggestionGroupFunction()
{
  return (id)class_PHPickerSuggestionGroup;
}

id CHContactProviderFunction()
{
  return (id)classCHContactProvider;
}

Class initCHContactProvider()
{
  Class result;

  if (LoadCallHistory_loadPredicate != -1)
    dispatch_once(&LoadCallHistory_loadPredicate, &__block_literal_global_43377);
  result = objc_getClass("CHContactProvider");
  classCHContactProvider = (uint64_t)result;
  getCHContactProviderClass[0] = (uint64_t (*)())CHContactProviderFunction;
  return result;
}

id AFPreferencesFunction_43382()
{
  return (id)classAFPreferences_43387;
}

Class initAFPreferences_43383()
{
  Class result;

  if (LoadAssistantServices_loadPredicate_43384 != -1)
    dispatch_once(&LoadAssistantServices_loadPredicate_43384, &__block_literal_global_50_43385);
  result = objc_getClass("AFPreferences");
  classAFPreferences_43387 = (uint64_t)result;
  getAFPreferencesClass_43381[0] = (uint64_t (*)())AFPreferencesFunction_43382;
  return result;
}

uint64_t initAFAssistantRestricted()
{
  if (LoadAssistantServices_loadPredicate_43384 != -1)
    dispatch_once(&LoadAssistantServices_loadPredicate_43384, &__block_literal_global_50_43385);
  softLinkAFAssistantRestricted[0] = (uint64_t (*)())dlsym((void *)LoadAssistantServices_frameworkLibrary_43390, "AFAssistantRestricted");
  return softLinkAFAssistantRestricted[0]();
}

id _EARUserProfileBuilderFunction()
{
  return (id)class_EARUserProfileBuilder;
}

Class init_EARUserProfileBuilder()
{
  Class result;

  if (LoadEmbeddedAcousticRecognition_loadPredicate != -1)
    dispatch_once(&LoadEmbeddedAcousticRecognition_loadPredicate, &__block_literal_global_47);
  result = objc_getClass("_EARUserProfileBuilder");
  class_EARUserProfileBuilder = (uint64_t)result;
  get_EARUserProfileBuilderClass[0] = (uint64_t (*)())_EARUserProfileBuilderFunction;
  return result;
}

id CHManagerFunction()
{
  return (id)classCHManager;
}

Class initCHManager()
{
  Class result;

  if (LoadCallHistory_loadPredicate != -1)
    dispatch_once(&LoadCallHistory_loadPredicate, &__block_literal_global_43377);
  result = objc_getClass("CHManager");
  classCHManager = (uint64_t)result;
  getCHManagerClass[0] = (uint64_t (*)())CHManagerFunction;
  return result;
}

uint64_t initkCHCallTypeNormal()
{
  uint64_t result;

  if (LoadCallHistory_loadPredicate != -1)
    dispatch_once(&LoadCallHistory_loadPredicate, &__block_literal_global_43377);
  result = *(unsigned int *)dlsym((void *)LoadCallHistory_frameworkLibrary, "kCHCallTypeNormal");
  constantkCHCallTypeNormal = result;
  getkCHCallTypeNormal[0] = kCHCallTypeNormalFunction;
  return result;
}

uint64_t kCHCallTypeNormalFunction()
{
  return constantkCHCallTypeNormal;
}

uint64_t initkCHCallStatusCancelled()
{
  uint64_t result;

  if (LoadCallHistory_loadPredicate != -1)
    dispatch_once(&LoadCallHistory_loadPredicate, &__block_literal_global_43377);
  result = *(unsigned int *)dlsym((void *)LoadCallHistory_frameworkLibrary, "kCHCallStatusCancelled");
  constantkCHCallStatusCancelled = result;
  getkCHCallStatusCancelled[0] = kCHCallStatusCancelledFunction;
  return result;
}

uint64_t kCHCallStatusCancelledFunction()
{
  return constantkCHCallStatusCancelled;
}

uint64_t initkCHCallStatusConnectedOutgoing()
{
  uint64_t result;

  if (LoadCallHistory_loadPredicate != -1)
    dispatch_once(&LoadCallHistory_loadPredicate, &__block_literal_global_43377);
  result = *(unsigned int *)dlsym((void *)LoadCallHistory_frameworkLibrary, "kCHCallStatusConnectedOutgoing");
  constantkCHCallStatusConnectedOutgoing = result;
  getkCHCallStatusConnectedOutgoing[0] = kCHCallStatusConnectedOutgoingFunction;
  return result;
}

uint64_t kCHCallStatusConnectedOutgoingFunction()
{
  return constantkCHCallStatusConnectedOutgoing;
}

id IDSServiceNameFaceTimeFunction_43460()
{
  return (id)constantIDSServiceNameFaceTime_43475;
}

id initIDSServiceNameFaceTime_43461()
{
  id *v0;

  if (LoadIDS_loadPredicate_43466 != -1)
    dispatch_once(&LoadIDS_loadPredicate_43466, &__block_literal_global_43467);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_43468, "IDSServiceNameFaceTime");
  objc_storeStrong((id *)&constantIDSServiceNameFaceTime_43475, *v0);
  getIDSServiceNameFaceTime_43459[0] = (uint64_t (*)())IDSServiceNameFaceTimeFunction_43460;
  return (id)constantIDSServiceNameFaceTime_43475;
}

id IDSServiceNameiMessageFunction_43464()
{
  return (id)constantIDSServiceNameiMessage_43470;
}

id initIDSServiceNameiMessage_43465()
{
  id *v0;

  if (LoadIDS_loadPredicate_43466 != -1)
    dispatch_once(&LoadIDS_loadPredicate_43466, &__block_literal_global_43467);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_43468, "IDSServiceNameiMessage");
  objc_storeStrong((id *)&constantIDSServiceNameiMessage_43470, *v0);
  getIDSServiceNameiMessage_43463 = (uint64_t (*)())IDSServiceNameiMessageFunction_43464;
  return (id)constantIDSServiceNameiMessage_43470;
}

id initkUTTypeVCard()
{
  id *v0;

  if (LoadMobileCoreServices_loadPredicate_44434 != -1)
    dispatch_once(&LoadMobileCoreServices_loadPredicate_44434, &__block_literal_global_132);
  v0 = (id *)dlsym((void *)LoadMobileCoreServices_frameworkLibrary_44435, "kUTTypeVCard");
  objc_storeStrong((id *)&constantkUTTypeVCard, *v0);
  getkUTTypeVCard[0] = (uint64_t (*)())kUTTypeVCardFunction;
  return (id)constantkUTTypeVCard;
}

id kUTTypeVCardFunction()
{
  return (id)constantkUTTypeVCard;
}

id LPLinkMetadataFunction()
{
  return (id)classLPLinkMetadata;
}

Class initLPLinkMetadata()
{
  Class result;

  if (LoadLinkPresentation_loadPredicate != -1)
    dispatch_once(&LoadLinkPresentation_loadPredicate, &__block_literal_global_44451);
  result = objc_getClass("LPLinkMetadata");
  classLPLinkMetadata = (uint64_t)result;
  getLPLinkMetadataClass[0] = (uint64_t (*)())LPLinkMetadataFunction;
  return result;
}

id LPFileMetadataFunction()
{
  return (id)classLPFileMetadata;
}

Class initLPFileMetadata()
{
  Class result;

  if (LoadLinkPresentation_loadPredicate != -1)
    dispatch_once(&LoadLinkPresentation_loadPredicate, &__block_literal_global_44451);
  result = objc_getClass("LPFileMetadata");
  classLPFileMetadata = (uint64_t)result;
  getLPFileMetadataClass[0] = (uint64_t (*)())LPFileMetadataFunction;
  return result;
}

id LPImageFunction()
{
  return (id)classLPImage;
}

Class initLPImage()
{
  Class result;

  if (LoadLinkPresentation_loadPredicate != -1)
    dispatch_once(&LoadLinkPresentation_loadPredicate, &__block_literal_global_44451);
  result = objc_getClass("LPImage");
  classLPImage = (uint64_t)result;
  getLPImageClass[0] = (uint64_t (*)())LPImageFunction;
  return result;
}

id getIMNicknameControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIMNicknameControllerClass_softClass_44577;
  v7 = getIMNicknameControllerClass_softClass_44577;
  if (!getIMNicknameControllerClass_softClass_44577)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIMNicknameControllerClass_block_invoke_44578;
    v3[3] = &unk_1E204EBC0;
    v3[4] = &v4;
    __getIMNicknameControllerClass_block_invoke_44578((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AEC34B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIMNicknameControllerClass_block_invoke_44578(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IMCoreLibraryCore_frameworkLibrary_44579)
    IMCoreLibraryCore_frameworkLibrary_44579 = _sl_dlopen();
  if (!IMCoreLibraryCore_frameworkLibrary_44579)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNUIIMCoreSoftLink.h"), 12, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IMNicknameController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIMNicknameControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNUIIMCoreSoftLink.h"), 13, CFSTR("Unable to find class %s"), "IMNicknameController");

LABEL_8:
    __break(1u);
  }
  getIMNicknameControllerClass_softClass_44577 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AEC5574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PHFetchOptionsFunction()
{
  return (id)classPHFetchOptions;
}

Class initPHFetchOptions()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHFetchOptions");
  classPHFetchOptions = (uint64_t)result;
  getPHFetchOptionsClass[0] = (uint64_t (*)())PHFetchOptionsFunction;
  return result;
}

id PHPersonFunction()
{
  return (id)classPHPerson;
}

Class initPHPerson()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHPerson");
  classPHPerson = (uint64_t)result;
  getPHPersonClass = (uint64_t (*)())PHPersonFunction;
  return result;
}

id PHFaceFunction()
{
  return (id)classPHFace;
}

Class initPHFace()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHFace");
  classPHFace = (uint64_t)result;
  getPHFaceClass[0] = (uint64_t (*)())PHFaceFunction;
  return result;
}

id PHAssetFunction()
{
  return (id)classPHAsset;
}

Class initPHAsset()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHAsset");
  classPHAsset = (uint64_t)result;
  getPHAssetClass[0] = (uint64_t (*)())PHAssetFunction;
  return result;
}

id PHImageRequestOptionsFunction()
{
  return (id)classPHImageRequestOptions;
}

Class initPHImageRequestOptions()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHImageRequestOptions");
  classPHImageRequestOptions = (uint64_t)result;
  getPHImageRequestOptionsClass[0] = (uint64_t (*)())PHImageRequestOptionsFunction;
  return result;
}

id PHImageManagerFunction()
{
  return (id)classPHImageManager;
}

Class initPHImageManager()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHImageManager");
  classPHImageManager = (uint64_t)result;
  getPHImageManagerClass[0] = (uint64_t (*)())PHImageManagerFunction;
  return result;
}

id PHPhotoLibraryFunction_44970()
{
  return (id)classPHPhotoLibrary_44975;
}

Class initPHPhotoLibrary_44971()
{
  Class result;

  if (LoadPhotos_loadPredicate_44961 != -1)
    dispatch_once(&LoadPhotos_loadPredicate_44961, &__block_literal_global_213);
  result = objc_getClass("PHPhotoLibrary");
  classPHPhotoLibrary_44975 = (uint64_t)result;
  getPHPhotoLibraryClass_44969 = (uint64_t (*)())PHPhotoLibraryFunction_44970;
  return result;
}

uint64_t __Block_byref_object_copy__44972(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44973(uint64_t a1)
{

}

void sub_18AECC67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(v19);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__45809(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__45810(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id AFContextManagerFunction()
{
  return (id)classAFContextManager;
}

id CNAssistantConversionFunction()
{
  return (id)classCNAssistantConversion;
}

void sub_18AECE33C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AECF788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AECF8D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id GKDaemonProxyFunction_46534()
{
  return (id)classGKDaemonProxy_46558;
}

Class initGKDaemonProxy_46535()
{
  Class result;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  result = objc_getClass("GKDaemonProxy");
  classGKDaemonProxy_46558 = (uint64_t)result;
  getGKDaemonProxyClass_46533[0] = (uint64_t (*)())GKDaemonProxyFunction_46534;
  return result;
}

id GKLocalPlayerFunction_46537()
{
  return (id)classGKLocalPlayer_46552;
}

Class initGKLocalPlayer_46538()
{
  Class result;

  if (LoadGameCenterUICore_loadPredicate_46550 != -1)
    dispatch_once(&LoadGameCenterUICore_loadPredicate_46550, &__block_literal_global_78);
  result = objc_getClass("GKLocalPlayer");
  classGKLocalPlayer_46552 = (uint64_t)result;
  getGKLocalPlayerClass_46536 = (uint64_t (*)())GKLocalPlayerFunction_46537;
  return result;
}

id GKGameFunction()
{
  return (id)classGKGame;
}

Class initGKGame()
{
  Class result;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  result = objc_getClass("GKGame");
  classGKGame = (uint64_t)result;
  getGKGameClass[0] = (uint64_t (*)())GKGameFunction;
  return result;
}

id GKRemoteAlertDeeplinkActionKeyFunction()
{
  return (id)constantGKRemoteAlertDeeplinkActionKey;
}

id initGKRemoteAlertDeeplinkActionKey()
{
  id *v0;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  v0 = (id *)dlsym((void *)LoadGameCenterFoundation_frameworkLibrary_46541, "GKRemoteAlertDeeplinkActionKey");
  objc_storeStrong((id *)&constantGKRemoteAlertDeeplinkActionKey, *v0);
  getGKRemoteAlertDeeplinkActionKey[0] = (uint64_t (*)())GKRemoteAlertDeeplinkActionKeyFunction;
  return (id)constantGKRemoteAlertDeeplinkActionKey;
}

id GKRemoteAlertDeeplinkActionPlayerProfileValueFunction()
{
  return (id)constantGKRemoteAlertDeeplinkActionPlayerProfileValue;
}

id initGKRemoteAlertDeeplinkActionPlayerProfileValue()
{
  id *v0;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  v0 = (id *)dlsym((void *)LoadGameCenterFoundation_frameworkLibrary_46541, "GKRemoteAlertDeeplinkActionPlayerProfileValue");
  objc_storeStrong((id *)&constantGKRemoteAlertDeeplinkActionPlayerProfileValue, *v0);
  getGKRemoteAlertDeeplinkActionPlayerProfileValue[0] = (uint64_t (*)())GKRemoteAlertDeeplinkActionPlayerProfileValueFunction;
  return (id)constantGKRemoteAlertDeeplinkActionPlayerProfileValue;
}

id GKRemoteAlertDeeplinkPlayerIdentifierKeyFunction()
{
  return (id)constantGKRemoteAlertDeeplinkPlayerIdentifierKey;
}

id initGKRemoteAlertDeeplinkPlayerIdentifierKey()
{
  id *v0;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  v0 = (id *)dlsym((void *)LoadGameCenterFoundation_frameworkLibrary_46541, "GKRemoteAlertDeeplinkPlayerIdentifierKey");
  objc_storeStrong((id *)&constantGKRemoteAlertDeeplinkPlayerIdentifierKey, *v0);
  getGKRemoteAlertDeeplinkPlayerIdentifierKey[0] = (uint64_t (*)())GKRemoteAlertDeeplinkPlayerIdentifierKeyFunction;
  return (id)constantGKRemoteAlertDeeplinkPlayerIdentifierKey;
}

id GKDashboardLaunchContextContactsFunction()
{
  return (id)constantGKDashboardLaunchContextContacts;
}

id initGKDashboardLaunchContextContacts()
{
  id *v0;

  if (LoadGameCenterFoundation_loadPredicate_46540 != -1)
    dispatch_once(&LoadGameCenterFoundation_loadPredicate_46540, &__block_literal_global_75);
  v0 = (id *)dlsym((void *)LoadGameCenterFoundation_frameworkLibrary_46541, "GKDashboardLaunchContextContacts");
  objc_storeStrong((id *)&constantGKDashboardLaunchContextContacts, *v0);
  getGKDashboardLaunchContextContacts[0] = (uint64_t (*)())GKDashboardLaunchContextContactsFunction;
  return (id)constantGKDashboardLaunchContextContacts;
}

id GKGameCenterFriendPlayerViewFunction()
{
  return (id)classGKGameCenterFriendPlayerView;
}

Class initGKGameCenterFriendPlayerView()
{
  Class result;

  if (LoadGameCenterUI_loadPredicate_46572 != -1)
    dispatch_once(&LoadGameCenterUI_loadPredicate_46572, &__block_literal_global_46573);
  result = objc_getClass("GKGameCenterFriendPlayerView");
  classGKGameCenterFriendPlayerView = (uint64_t)result;
  getGKGameCenterFriendPlayerViewClass[0] = (uint64_t (*)())GKGameCenterFriendPlayerViewFunction;
  return result;
}

id FBSOpenApplicationServiceFunction_47173()
{
  return (id)classFBSOpenApplicationService_47178;
}

Class initFBSOpenApplicationService_47174()
{
  Class result;

  if (LoadCarPlayServices_loadPredicate_47175 != -1)
    dispatch_once(&LoadCarPlayServices_loadPredicate_47175, &__block_literal_global_47176);
  result = objc_getClass("FBSOpenApplicationService");
  classFBSOpenApplicationService_47178 = (uint64_t)result;
  getFBSOpenApplicationServiceClass_47172 = (uint64_t (*)())FBSOpenApplicationServiceFunction_47173;
  return result;
}

void sub_18AED7110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SGSuggestionsServiceFunction()
{
  return (id)classSGSuggestionsService;
}

Class initSGSuggestionsService()
{
  Class result;

  if (LoadCoreSuggestions_loadPredicate_47528 != -1)
    dispatch_once(&LoadCoreSuggestions_loadPredicate_47528, &__block_literal_global_430);
  result = objc_getClass("SGSuggestionsService");
  classSGSuggestionsService = (uint64_t)result;
  getSGSuggestionsServiceClass[0] = (uint64_t (*)())SGSuggestionsServiceFunction;
  return result;
}

id IDSIDQueryControllerFunction_47533()
{
  return (id)classIDSIDQueryController_47536;
}

Class initIDSIDQueryController_47534()
{
  Class result;

  if (LoadIDS_loadPredicate_47535 != -1)
    dispatch_once(&LoadIDS_loadPredicate_47535, &__block_literal_global_427);
  result = objc_getClass("IDSIDQueryController");
  classIDSIDQueryController_47536 = (uint64_t)result;
  getIDSIDQueryControllerClass_47532 = (uint64_t (*)())IDSIDQueryControllerFunction_47533;
  return result;
}

id CRRecentContactsLibraryFunction()
{
  return (id)classCRRecentContactsLibrary;
}

void sub_18AED92B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47906(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47907(uint64_t a1)
{

}

Class __getAVTStickerGeneratorOptionsClass_block_invoke_47909(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarKitLibraryCore_frameworkLibrary_47912)
    AvatarKitLibraryCore_frameworkLibrary_47912 = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary_47912)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTStickerGeneratorOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTStickerGeneratorOptionsClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 69, CFSTR("Unable to find class %s"), "AVTStickerGeneratorOptions");

LABEL_8:
    __break(1u);
  }
  getAVTStickerGeneratorOptionsClass_softClass_47908 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AEDAA38()
{
  objc_end_catch();
  JUMPOUT(0x18AEDAA44);
}

id AAFamilyDetailsRequestFunction()
{
  return (id)classAAFamilyDetailsRequest;
}

Class initAAFamilyDetailsRequest()
{
  Class result;

  if (LoadAppleAccount_loadPredicate_48244 != -1)
    dispatch_once(&LoadAppleAccount_loadPredicate_48244, &__block_literal_global_39_48245);
  result = objc_getClass("AAFamilyDetailsRequest");
  classAAFamilyDetailsRequest = (uint64_t)result;
  getAAFamilyDetailsRequestClass[0] = (uint64_t (*)())AAFamilyDetailsRequestFunction;
  return result;
}

void sub_18AEDE980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FBSOpenApplicationServiceFunction_48470()
{
  return (id)classFBSOpenApplicationService_48475;
}

Class initFBSOpenApplicationService_48471()
{
  Class result;

  if (LoadCarPlayServices_loadPredicate_48472 != -1)
    dispatch_once(&LoadCarPlayServices_loadPredicate_48472, &__block_literal_global_48473);
  result = objc_getClass("FBSOpenApplicationService");
  classFBSOpenApplicationService_48475 = (uint64_t)result;
  getFBSOpenApplicationServiceClass_48469 = (uint64_t (*)())FBSOpenApplicationServiceFunction_48470;
  return result;
}

id getTPInComingCallUISnapshotViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getTPInComingCallUISnapshotViewControllerClass_softClass;
  v7 = getTPInComingCallUISnapshotViewControllerClass_softClass;
  if (!getTPInComingCallUISnapshotViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getTPInComingCallUISnapshotViewControllerClass_block_invoke;
    v3[3] = &unk_1E204EBC0;
    v3[4] = &v4;
    __getTPInComingCallUISnapshotViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AEE1344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTPInComingCallUISnapshotViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!TelephonyUILibraryCore_frameworkLibrary)
    TelephonyUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!TelephonyUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *TelephonyUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNTelephonyUISoftLink.h"), 13, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("TPInComingCallUISnapshotViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getTPInComingCallUISnapshotViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNTelephonyUISoftLink.h"), 14, CFSTR("Unable to find class %s"), "TPInComingCallUISnapshotViewController");

LABEL_8:
    __break(1u);
  }
  getTPInComingCallUISnapshotViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id IDSServiceNameiMessageFunction_48993()
{
  return (id)constantIDSServiceNameiMessage_48999;
}

id initIDSServiceNameiMessage_48994()
{
  id *v0;

  if (LoadIDS_loadPredicate_48995 != -1)
    dispatch_once(&LoadIDS_loadPredicate_48995, &__block_literal_global_48996);
  v0 = (id *)dlsym((void *)LoadIDS_frameworkLibrary_48997, "IDSServiceNameiMessage");
  objc_storeStrong((id *)&constantIDSServiceNameiMessage_48999, *v0);
  getIDSServiceNameiMessage_48992 = (uint64_t (*)())IDSServiceNameiMessageFunction_48993;
  return (id)constantIDSServiceNameiMessage_48999;
}

void sub_18AEE6CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  uint64_t v57;

  _Block_object_dispose((const void *)(v57 - 176), 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49706(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49707(uint64_t a1)
{

}

void sub_18AEE94F8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  objc_destroyWeak((id *)&STACK[0x2B8]);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Unwind_Resume(a1);
}

void AddAtSortedIndex_block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "insertObject:atIndex:", v3, objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(v4, "count"), 1024, &__block_literal_global_82));

}

uint64_t AddAtSortedIndex_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

id kCNUICoreContactItemToCNUIContactItem_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNUIFamilyMemberContactItem familyMemberContactItemFromCoreFamilyMemberContactItem:](CNUIFamilyMemberContactItem, "familyMemberContactItemFromCoreFamilyMemberContactItem:", a2);
}

void sub_18AEEB728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAvatarRecordImageProviderClass_block_invoke_50037(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_50041();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAvatarRecordImageProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAvatarRecordImageProviderClass_softClass_50036 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordImageProviderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 23, CFSTR("Unable to find class %s"), "AVTAvatarRecordImageProvider");

    __break(1u);
  }
}

void __getAVTRenderingScopeClass_block_invoke_50039(uint64_t a1)
{
  void *v2;
  void *v3;

  AvatarUILibrary_50041();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTRenderingScopeClass_softClass_50038 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTRenderingScopeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CNAvatarSoftLink.h"), 21, CFSTR("Unable to find class %s"), "AVTRenderingScope");

    __break(1u);
  }
}

void AvatarUILibrary_50041()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AvatarUILibraryCore_frameworkLibrary_50046)
    AvatarUILibraryCore_frameworkLibrary_50046 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_50046)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __Block_byref_object_copy__51138(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__51139(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id initkAssistantDirectActionEventKey_51354()
{
  id *v0;

  if (LoadAssistantServices_loadPredicate_51375 != -1)
    dispatch_once(&LoadAssistantServices_loadPredicate_51375, &__block_literal_global_51376);
  v0 = (id *)dlsym((void *)LoadAssistantServices_frameworkLibrary_51377, "kAssistantDirectActionEventKey");
  objc_storeStrong((id *)&constantkAssistantDirectActionEventKey_51374, *v0);
  getkAssistantDirectActionEventKey_51353 = (uint64_t (*)())kAssistantDirectActionEventKeyFunction_51355;
  return (id)constantkAssistantDirectActionEventKey_51374;
}

id kAssistantDirectActionEventKeyFunction_51355()
{
  return (id)constantkAssistantDirectActionEventKey_51374;
}

id SiriDirectActionContextFunction_51359()
{
  return (id)classSiriDirectActionContext_51372;
}

Class initSiriDirectActionContext_51360()
{
  Class result;

  if (LoadSiriActivation_loadPredicate_51364 != -1)
    dispatch_once(&LoadSiriActivation_loadPredicate_51364, &__block_literal_global_87);
  result = objc_getClass("SiriDirectActionContext");
  classSiriDirectActionContext_51372 = (uint64_t)result;
  getSiriDirectActionContextClass_51358 = (uint64_t (*)())SiriDirectActionContextFunction_51359;
  return result;
}

id SiriDirectActionSourceFunction_51362()
{
  return (id)classSiriDirectActionSource_51366;
}

Class initSiriDirectActionSource_51363()
{
  Class result;

  if (LoadSiriActivation_loadPredicate_51364 != -1)
    dispatch_once(&LoadSiriActivation_loadPredicate_51364, &__block_literal_global_87);
  result = objc_getClass("SiriDirectActionSource");
  classSiriDirectActionSource_51366 = (uint64_t)result;
  getSiriDirectActionSourceClass_51361 = (uint64_t (*)())SiriDirectActionSourceFunction_51362;
  return result;
}

void sub_18AEF4418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AEF4660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVTAvatarRecordRenderingClass_block_invoke_51878(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarUILibraryCore_frameworkLibrary_51879)
    AvatarUILibraryCore_frameworkLibrary_51879 = _sl_dlopen();
  if (!AvatarUILibraryCore_frameworkLibrary_51879)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTAvatarRecordRendering");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTAvatarRecordRenderingClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 24, CFSTR("Unable to find class %s"), "AVTAvatarRecordRendering");

LABEL_8:
    __break(1u);
  }
  getAVTAvatarRecordRenderingClass_softClass_51877 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVTViewClass_block_invoke_51896(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AvatarKitLibraryCore_frameworkLibrary_51899)
    AvatarKitLibraryCore_frameworkLibrary_51899 = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary_51899)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AvatarKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNAvatarSoftLink.h"), 65, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVTView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVTViewClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNAvatarSoftLink.h"), 66, CFSTR("Unable to find class %s"), "AVTView");

LABEL_8:
    __break(1u);
  }
  getAVTViewClass_softClass_51895 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18AEF7460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 224), 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52190(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52191(uint64_t a1)
{

}

void sub_18AEF83BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AEF8E4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18AEFC188(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53058(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__53059(uint64_t a1)
{

}

uint64_t initTKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode(uint64_t a1)
{
  if (LoadToneKit_loadPredicate != -1)
    dispatch_once(&LoadToneKit_loadPredicate, &__block_literal_global_53511);
  softLinkTKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode = (uint64_t (*)())dlsym((void *)LoadToneKit_frameworkLibrary, "TKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode");
  return ((uint64_t (*)(uint64_t))softLinkTKBackdropViewOverlayBlendModeFromUIBackdropViewOverlayBlendMode)(a1);
}

void sub_18AEFFDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CNCoreDuet.h"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_18AF00354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TKTonePickerViewControllerFunction()
{
  return (id)classTKTonePickerViewController;
}

Class initTKTonePickerViewController()
{
  Class result;

  if (LoadToneKit_loadPredicate_53860 != -1)
    dispatch_once(&LoadToneKit_loadPredicate_53860, &__block_literal_global_53861);
  result = objc_getClass("TKTonePickerViewController");
  classTKTonePickerViewController = (uint64_t)result;
  getTKTonePickerViewControllerClass[0] = (uint64_t (*)())TKTonePickerViewControllerFunction;
  return result;
}

id initkUTTypePNG_54065()
{
  id *v0;

  if (LoadMobileCoreServices_loadPredicate_54072 != -1)
    dispatch_once(&LoadMobileCoreServices_loadPredicate_54072, &__block_literal_global_54073);
  v0 = (id *)dlsym((void *)LoadMobileCoreServices_frameworkLibrary_54074, "kUTTypePNG");
  objc_storeStrong((id *)&constantkUTTypePNG_54079, *v0);
  getkUTTypePNG_54064 = (uint64_t (*)())kUTTypePNGFunction_54066;
  return (id)constantkUTTypePNG_54079;
}

id kUTTypePNGFunction_54066()
{
  return (id)constantkUTTypePNG_54079;
}

id initkUTTypeJPEG_54068()
{
  id *v0;

  if (LoadMobileCoreServices_loadPredicate_54072 != -1)
    dispatch_once(&LoadMobileCoreServices_loadPredicate_54072, &__block_literal_global_54073);
  v0 = (id *)dlsym((void *)LoadMobileCoreServices_frameworkLibrary_54074, "kUTTypeJPEG");
  objc_storeStrong((id *)&constantkUTTypeJPEG_54071, *v0);
  getkUTTypeJPEG_54067 = (uint64_t (*)())kUTTypeJPEGFunction_54069;
  return (id)constantkUTTypeJPEG_54071;
}

id kUTTypeJPEGFunction_54069()
{
  return (id)constantkUTTypeJPEG_54071;
}

Class __getIPPronounPickerViewControllerClass_block_invoke_54581(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IntlPreferencesUILibraryCore_frameworkLibrary_54582)
    IntlPreferencesUILibraryCore_frameworkLibrary_54582 = _sl_dlopen();
  if (!IntlPreferencesUILibraryCore_frameworkLibrary_54582)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntlPreferencesUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CNIntlPreferencesUISoftlink.h"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IPPronounPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIPPronounPickerViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CNIntlPreferencesUISoftlink.h"), 15, CFSTR("Unable to find class %s"), "IPPronounPickerViewController");

LABEL_8:
    __break(1u);
  }
  getIPPronounPickerViewControllerClass_softClass_54580 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id ABAddressBookBundle()
{
  if (ABAddressBookBundle_onceToken != -1)
    dispatch_once(&ABAddressBookBundle_onceToken, &__block_literal_global_2_54746);
  return (id)ABAddressBookBundle___bundle;
}

uint64_t ABAddressBookShouldAllowAutorotation()
{
  uint64_t result;

  LODWORD(result) = dyld_program_sdk_at_least();
  if (_ABGloballyAllowAutorotation)
    return result;
  else
    return 0;
}

uint64_t ABAddressBookGetDefaultRotationContentSettings(uint64_t result)
{
  *(_WORD *)result = 257;
  *(_BYTE *)(result + 2) = 1;
  *(_QWORD *)(result + 8) = 0x4038000000000000;
  return result;
}

void CNUIRoundToScale(double a1, double a2)
{
  if (a2 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
}

double CNUIRoundToViewScale(void *a1, double a2)
{
  void *v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v4 = *(double *)&RoundToScale___s;
  }
  v5 = v4 == 1.0;
  v6 = round(v4 * a2) / v4;
  v7 = round(a2);
  if (v5)
    v8 = v7;
  else
    v8 = v6;

  return v8;
}

double CNUIPixelAlignedPoint(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v3 = a1;
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  if (v5 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v5 = *(double *)&RoundToScale___s;
  }
  v6 = v5 == 1.0;
  v7 = round(a2 * v5) / v5;
  v8 = round(a2);
  if (v6)
    v9 = v8;
  else
    v9 = v7;

  objc_msgSend(v3, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scale");
  if (v11 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);

  return v9;
}

double CNUIPixelAlignedSize(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v3 = a1;
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  if (v5 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v5 = *(double *)&RoundToScale___s;
  }
  v6 = v5 == 1.0;
  v7 = round(a2 * v5) / v5;
  v8 = round(a2);
  if (v6)
    v9 = v8;
  else
    v9 = v7;

  objc_msgSend(v3, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scale");
  if (v11 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);

  return v9;
}

double CNUIPixelAlignedRect(void *a1, double a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;

  v3 = a1;
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  if (v5 == 0.0)
  {
    if (RoundToScale_onceToken != -1)
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);
    v5 = *(double *)&RoundToScale___s;
  }
  if (v5 == 1.0)
    v6 = round(a2);
  else
    v6 = round(a2 * v5) / v5;

  objc_msgSend(v3, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  if (v8 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);

  objc_msgSend(v3, "_screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  if (v10 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);

  objc_msgSend(v3, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  if (v12 == 0.0 && RoundToScale_onceToken != -1)
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_22_54747);

  return v6;
}

uint64_t CNUISetUseSiriLocalization(uint64_t result)
{
  _useSiriLocalization = result;
  return result;
}

BOOL CNUIShouldUseSiriLocalization()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (_useSiriLocalization)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_opt_respondsToSelector();

    if ((v1 & 1) != 0)
      return _useSiriLocalization != 0;
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/OldFramework/Sources/ContactsUI_Internal.m", 126, 4, CFSTR("You tried to use Siri localization but SiriUI is not loaded."), v2, v3, v4, v5, v7);
  }
  return 0;
}

BOOL CNUIIsActivity()
{
  int v0;
  void *v1;
  void *v2;

  v0 = CNUIIsActivity_isActivity;
  if (CNUIIsActivity_isActivity == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CNUIIsActivity_isActivity = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Fitness"));

    v0 = CNUIIsActivity_isActivity;
  }
  return v0 != 0;
}

BOOL CNUIIsFirstParty()
{
  int v0;
  void *v1;
  void *v2;

  v0 = CNUIIsFirstParty_isFirstParty;
  if (CNUIIsFirstParty_isFirstParty == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CNUIIsFirstParty_isFirstParty = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

    v0 = CNUIIsFirstParty_isFirstParty;
  }
  return v0 != 0;
}

BOOL CNUIIsDDActionsService()
{
  int v0;
  void *v1;
  void *v2;

  v0 = CNUIIsDDActionsService_isDDActionsService;
  if (CNUIIsDDActionsService_isDDActionsService == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CNUIIsDDActionsService_isDDActionsService = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService"));

    v0 = CNUIIsDDActionsService_isDDActionsService;
  }
  return v0 != 0;
}

void sub_18AF14D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AF15884(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AF15FD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AF171BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AF181B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a15);
  _Unwind_Resume(a1);
}

void sub_18AF18B88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55626(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55627(uint64_t a1)
{

}

void sub_18AF1D344(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AF1D5A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SLComposeViewControllerFunction_55710()
{
  return (id)classSLComposeViewController_55715;
}

Class initSLComposeViewController_55711()
{
  Class result;

  if (LoadSocial_loadPredicate_55714 != -1)
    dispatch_once(&LoadSocial_loadPredicate_55714, &__block_literal_global_1626);
  result = objc_getClass("SLComposeViewController");
  classSLComposeViewController_55715 = (uint64_t)result;
  getSLComposeViewControllerClass_55709 = (uint64_t (*)())SLComposeViewControllerFunction_55710;
  return result;
}

void sub_18AF241A0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18AF24E3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int16 a10, __int16 a11, __int16 a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16)
{
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;

  if (a2)
  {
    if (a2 == 2)
    {
      v17 = objc_begin_catch(exception_object);
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "predicateForSelectionOfContact");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138412802;
        *(_QWORD *)((char *)&a9 + 4) = v19;
        WORD6(a9) = 2112;
        a13 = 2112;
        a14 = (uint64_t)v17;
        _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Exception raised during validation of predicate %@ on %@: %@", (uint8_t *)&a9, 0x20u);

      }
      objc_end_catch();
      JUMPOUT(0x18AF24D80);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18AF25034(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18AF281EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 136), 8);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_18AF28DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AF2A594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__58312(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__58313(uint64_t a1)
{

}

void __Block_byref_object_copy__59901(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__59902(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_18AF30A50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18AF356E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AF357BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AF35998(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18AF35C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AF36AD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_18AF3BEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AF3DA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18AF3F988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__60437(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__60438(uint64_t a1)
{

}

id SLComposeViewControllerFunction_60522()
{
  return (id)classSLComposeViewController_60530;
}

Class initSLComposeViewController_60523()
{
  Class result;

  if (LoadSocial_loadPredicate_60529 != -1)
    dispatch_once(&LoadSocial_loadPredicate_60529, &__block_literal_global_2440);
  result = objc_getClass("SLComposeViewController");
  classSLComposeViewController_60530 = (uint64_t)result;
  getSLComposeViewControllerClass_60521 = (uint64_t (*)())SLComposeViewControllerFunction_60522;
  return result;
}

void sub_18AF4441C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id PRSMutablePosterConfigurationFunction()
{
  return (id)classPRSMutablePosterConfiguration;
}

Class initPRSMutablePosterConfiguration()
{
  Class result;

  if (LoadPosterBoardServices_loadPredicate_61251 != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate_61251, &__block_literal_global_322);
  result = objc_getClass("PRSMutablePosterConfiguration");
  classPRSMutablePosterConfiguration = (uint64_t)result;
  getPRSMutablePosterConfigurationClass[0] = (uint64_t (*)())PRSMutablePosterConfigurationFunction;
  return result;
}

id PRSPosterRoleIncomingCallFunction_61249()
{
  return (id)constantPRSPosterRoleIncomingCall_61254;
}

id initPRSPosterRoleIncomingCall_61250()
{
  id *v0;

  if (LoadPosterBoardServices_loadPredicate_61251 != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate_61251, &__block_literal_global_322);
  v0 = (id *)dlsym((void *)LoadPosterBoardServices_frameworkLibrary_61252, "PRSPosterRoleIncomingCall");
  objc_storeStrong((id *)&constantPRSPosterRoleIncomingCall_61254, *v0);
  getPRSPosterRoleIncomingCall_61248 = (uint64_t (*)())PRSPosterRoleIncomingCallFunction_61249;
  return (id)constantPRSPosterRoleIncomingCall_61254;
}

id PRSPosterConfigurationAttributesFunction_61275()
{
  return (id)classPRSPosterConfigurationAttributes_61278;
}

Class initPRSPosterConfigurationAttributes_61276()
{
  Class result;

  if (LoadPosterBoardServices_loadPredicate_61251 != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate_61251, &__block_literal_global_322);
  result = objc_getClass("PRSPosterConfigurationAttributes");
  classPRSPosterConfigurationAttributes_61278 = (uint64_t)result;
  getPRSPosterConfigurationAttributesClass_61274 = (uint64_t (*)())PRSPosterConfigurationAttributesFunction_61275;
  return result;
}

id PRSPosterArchiverFunction()
{
  return (id)classPRSPosterArchiver;
}

Class initPRSPosterArchiver()
{
  Class result;

  if (LoadPosterBoardServices_loadPredicate_61251 != -1)
    dispatch_once(&LoadPosterBoardServices_loadPredicate_61251, &__block_literal_global_322);
  result = objc_getClass("PRSPosterArchiver");
  classPRSPosterArchiver = (uint64_t)result;
  getPRSPosterArchiverClass[0] = (uint64_t (*)())PRSPosterArchiverFunction;
  return result;
}

id PRUISIncomingCallPosterContextNameVariationsFunction()
{
  return (id)classPRUISIncomingCallPosterContextNameVariations;
}

Class initPRUISIncomingCallPosterContextNameVariations()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISIncomingCallPosterContextNameVariations");
  classPRUISIncomingCallPosterContextNameVariations = (uint64_t)result;
  getPRUISIncomingCallPosterContextNameVariationsClass[0] = (uint64_t (*)())PRUISIncomingCallPosterContextNameVariationsFunction;
  return result;
}

id PRUISIncomingCallPosterContextFunction()
{
  return (id)classPRUISIncomingCallPosterContext;
}

Class initPRUISIncomingCallPosterContext()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISIncomingCallPosterContext");
  classPRUISIncomingCallPosterContext = (uint64_t)result;
  getPRUISIncomingCallPosterContextClass[0] = (uint64_t (*)())PRUISIncomingCallPosterContextFunction;
  return result;
}

id PRUISPosterConfigurationUtilitiesFunction()
{
  return (id)classPRUISPosterConfigurationUtilities;
}

Class initPRUISPosterConfigurationUtilities()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterConfigurationUtilities");
  classPRUISPosterConfigurationUtilities = (uint64_t)result;
  getPRUISPosterConfigurationUtilitiesClass[0] = (uint64_t (*)())PRUISPosterConfigurationUtilitiesFunction;
  return result;
}

id PRUISPosterEditingViewControllerFunction()
{
  return (id)classPRUISPosterEditingViewController;
}

Class initPRUISPosterEditingViewController()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterEditingViewController");
  classPRUISPosterEditingViewController = (uint64_t)result;
  getPRUISPosterEditingViewControllerClass[0] = (uint64_t (*)())PRUISPosterEditingViewControllerFunction;
  return result;
}

id PRUISPosterRenderingViewControllerFunction()
{
  return (id)classPRUISPosterRenderingViewController;
}

Class initPRUISPosterRenderingViewController()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterRenderingViewController");
  classPRUISPosterRenderingViewController = (uint64_t)result;
  getPRUISPosterRenderingViewControllerClass[0] = (uint64_t (*)())PRUISPosterRenderingViewControllerFunction;
  return result;
}

id PREditorColorPaletteFunction()
{
  return (id)classPREditorColorPalette;
}

Class initPREditorColorPalette()
{
  Class result;

  if (LoadPosterKit_loadPredicate_61429 != -1)
    dispatch_once(&LoadPosterKit_loadPredicate_61429, &__block_literal_global_335);
  result = objc_getClass("PREditorColorPalette");
  classPREditorColorPalette = (uint64_t)result;
  getPREditorColorPaletteClass[0] = (uint64_t (*)())PREditorColorPaletteFunction;
  return result;
}

id PRUISPosterSnapshotRequestFunction()
{
  return (id)classPRUISPosterSnapshotRequest;
}

Class initPRUISPosterSnapshotRequest()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterSnapshotRequest");
  classPRUISPosterSnapshotRequest = (uint64_t)result;
  getPRUISPosterSnapshotRequestClass = (uint64_t (*)())PRUISPosterSnapshotRequestFunction;
  return result;
}

id PRUISPosterAttachmentConfigurationFunction()
{
  return (id)classPRUISPosterAttachmentConfiguration;
}

Class initPRUISPosterAttachmentConfiguration()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterAttachmentConfiguration");
  classPRUISPosterAttachmentConfiguration = (uint64_t)result;
  getPRUISPosterAttachmentConfigurationClass[0] = (uint64_t (*)())PRUISPosterAttachmentConfigurationFunction;
  return result;
}

id PRUISPosterSnapshotControllerFunction()
{
  return (id)classPRUISPosterSnapshotController;
}

Class initPRUISPosterSnapshotController()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterSnapshotController");
  classPRUISPosterSnapshotController = (uint64_t)result;
  getPRUISPosterSnapshotControllerClass = (uint64_t (*)())PRUISPosterSnapshotControllerFunction;
  return result;
}

id PRUISIncomingCallSnapshotDefinitionFunction()
{
  return (id)classPRUISIncomingCallSnapshotDefinition;
}

Class initPRUISIncomingCallSnapshotDefinition()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISIncomingCallSnapshotDefinition");
  classPRUISIncomingCallSnapshotDefinition = (uint64_t)result;
  getPRUISIncomingCallSnapshotDefinitionClass[0] = (uint64_t (*)())PRUISIncomingCallSnapshotDefinitionFunction;
  return result;
}

id PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlyFunction()
{
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly;
}

id initPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly()
{
  id *v0;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  v0 = (id *)dlsym((void *)LoadPosterBoardUIServices_frameworkLibrary_61306, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly");
  objc_storeStrong((id *)&constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly, *v0);
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly[0] = (uint64_t (*)())PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnlyFunction;
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly;
}

id PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlayFunction()
{
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay;
}

id initPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay()
{
  id *v0;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  v0 = (id *)dlsym((void *)LoadPosterBoardUIServices_frameworkLibrary_61306, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay");
  objc_storeStrong((id *)&constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay, *v0);
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay[0] = (uint64_t (*)())PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlayFunction;
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay;
}

id PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewFunction()
{
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView;
}

id initPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView()
{
  id *v0;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  v0 = (id *)dlsym((void *)LoadPosterBoardUIServices_frameworkLibrary_61306, "PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView");
  objc_storeStrong((id *)&constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView, *v0);
  getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView[0] = (uint64_t (*)())PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentViewFunction;
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView;
}

id PRPosterSnapshotDefinitionIdentifierIncomingCallCompositeFunction()
{
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallComposite;
}

id initPRPosterSnapshotDefinitionIdentifierIncomingCallComposite()
{
  id *v0;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  v0 = (id *)dlsym((void *)LoadPosterBoardUIServices_frameworkLibrary_61306, "PRPosterSnapshotDefinitionIdentifierIncomingCallComposite");
  objc_storeStrong((id *)&constantPRPosterSnapshotDefinitionIdentifierIncomingCallComposite, *v0);
  getPRPosterSnapshotDefinitionIdentifierIncomingCallComposite[0] = (uint64_t (*)())PRPosterSnapshotDefinitionIdentifierIncomingCallCompositeFunction;
  return (id)constantPRPosterSnapshotDefinitionIdentifierIncomingCallComposite;
}

id PRUISPosterAppearanceObservingAttachmentProviderFunction()
{
  return (id)classPRUISPosterAppearanceObservingAttachmentProvider;
}

Class initPRUISPosterAppearanceObservingAttachmentProvider()
{
  Class result;

  if (LoadPosterBoardUIServices_loadPredicate_61302 != -1)
    dispatch_once(&LoadPosterBoardUIServices_loadPredicate_61302, &__block_literal_global_328);
  result = objc_getClass("PRUISPosterAppearanceObservingAttachmentProvider");
  classPRUISPosterAppearanceObservingAttachmentProvider = (uint64_t)result;
  getPRUISPosterAppearanceObservingAttachmentProviderClass[0] = (uint64_t (*)())PRUISPosterAppearanceObservingAttachmentProviderFunction;
  return result;
}

void sub_18AF4BB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_18AF4E234()
{
  return MEMORY[0x1E0C90468]();
}

uint64_t sub_18AF4E240()
{
  return MEMORY[0x1E0C90480]();
}

uint64_t sub_18AF4E24C()
{
  return MEMORY[0x1E0C90498]();
}

uint64_t sub_18AF4E258()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_18AF4E264()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_18AF4E270()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_18AF4E27C()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_18AF4E288()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_18AF4E294()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_18AF4E2A0()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_18AF4E2AC()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_18AF4E2B8()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_18AF4E2C4()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_18AF4E2D0()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_18AF4E2DC()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_18AF4E2E8()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_18AF4E2F4()
{
  return MEMORY[0x1E0CAF400]();
}

uint64_t sub_18AF4E300()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_18AF4E30C()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_18AF4E318()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_18AF4E324()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_18AF4E330()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_18AF4E33C()
{
  return MEMORY[0x1E0CAF628]();
}

uint64_t sub_18AF4E348()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_18AF4E354()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_18AF4E360()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_18AF4E36C()
{
  return MEMORY[0x1E0CAF6F0]();
}

uint64_t sub_18AF4E378()
{
  return MEMORY[0x1E0CAF700]();
}

uint64_t sub_18AF4E384()
{
  return MEMORY[0x1E0CAF710]();
}

uint64_t sub_18AF4E390()
{
  return MEMORY[0x1E0CAF728]();
}

uint64_t sub_18AF4E39C()
{
  return MEMORY[0x1E0CAF738]();
}

uint64_t sub_18AF4E3A8()
{
  return MEMORY[0x1E0CAF770]();
}

uint64_t sub_18AF4E3B4()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_18AF4E3C0()
{
  return MEMORY[0x1E0CAF7E0]();
}

uint64_t sub_18AF4E3CC()
{
  return MEMORY[0x1E0CAF7E8]();
}

uint64_t sub_18AF4E3D8()
{
  return MEMORY[0x1E0CAF7F0]();
}

uint64_t sub_18AF4E3E4()
{
  return MEMORY[0x1E0CAF7F8]();
}

uint64_t sub_18AF4E3F0()
{
  return MEMORY[0x1E0CAF818]();
}

uint64_t sub_18AF4E3FC()
{
  return MEMORY[0x1E0CAF8A0]();
}

uint64_t sub_18AF4E408()
{
  return MEMORY[0x1E0CAF8A8]();
}

uint64_t sub_18AF4E414()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_18AF4E420()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_18AF4E42C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_18AF4E438()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_18AF4E444()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_18AF4E450()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_18AF4E45C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_18AF4E468()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_18AF4E474()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18AF4E480()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_18AF4E48C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_18AF4E498()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_18AF4E4A4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_18AF4E4B0()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_18AF4E4BC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_18AF4E4C8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_18AF4E4D4()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_18AF4E4E0()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_18AF4E4EC()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_18AF4E4F8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_18AF4E504()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_18AF4E510()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_18AF4E51C()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_18AF4E528()
{
  return MEMORY[0x1E0CB1248]();
}

uint64_t sub_18AF4E534()
{
  return MEMORY[0x1E0CB1288]();
}

uint64_t sub_18AF4E540()
{
  return MEMORY[0x1E0CB1328]();
}

uint64_t sub_18AF4E54C()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_18AF4E558()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_18AF4E564()
{
  return MEMORY[0x1E0CB1600]();
}

uint64_t sub_18AF4E570()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_18AF4E57C()
{
  return MEMORY[0x1E0DC1A20]();
}

uint64_t sub_18AF4E588()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_18AF4E594()
{
  return MEMORY[0x1E0DC1A38]();
}

uint64_t sub_18AF4E5A0()
{
  return MEMORY[0x1E0DC1A48]();
}

uint64_t sub_18AF4E5AC()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_18AF4E5B8()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_18AF4E5C4()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_18AF4E5D0()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_18AF4E5DC()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_18AF4E5E8()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_18AF4E5F4()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_18AF4E600()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_18AF4E60C()
{
  return MEMORY[0x1E0CB1740]();
}

uint64_t sub_18AF4E618()
{
  return MEMORY[0x1E0CAA5B8]();
}

uint64_t sub_18AF4E624()
{
  return MEMORY[0x1E0CAA5C8]();
}

uint64_t sub_18AF4E630()
{
  return MEMORY[0x1E0D213D8]();
}

uint64_t sub_18AF4E63C()
{
  return MEMORY[0x1E0D213F8]();
}

uint64_t sub_18AF4E648()
{
  return MEMORY[0x1E0D21400]();
}

uint64_t sub_18AF4E654()
{
  return MEMORY[0x1E0D21408]();
}

uint64_t sub_18AF4E660()
{
  return MEMORY[0x1E0D21410]();
}

uint64_t sub_18AF4E66C()
{
  return MEMORY[0x1E0D21418]();
}

uint64_t sub_18AF4E678()
{
  return MEMORY[0x1E0D21420]();
}

uint64_t sub_18AF4E684()
{
  return MEMORY[0x1E0D21438]();
}

uint64_t sub_18AF4E690()
{
  return MEMORY[0x1E0D21490]();
}

uint64_t sub_18AF4E69C()
{
  return MEMORY[0x1E0D214A0]();
}

uint64_t sub_18AF4E6A8()
{
  return MEMORY[0x1E0D214A8]();
}

uint64_t sub_18AF4E6B4()
{
  return MEMORY[0x1E0D214B8]();
}

uint64_t sub_18AF4E6C0()
{
  return MEMORY[0x1E0D214D0]();
}

uint64_t sub_18AF4E6CC()
{
  return MEMORY[0x1E0D214D8]();
}

uint64_t sub_18AF4E6D8()
{
  return MEMORY[0x1E0D214E0]();
}

uint64_t sub_18AF4E6E4()
{
  return MEMORY[0x1E0D214E8]();
}

uint64_t sub_18AF4E6F0()
{
  return MEMORY[0x1E0D214F0]();
}

uint64_t sub_18AF4E6FC()
{
  return MEMORY[0x1E0D214F8]();
}

uint64_t sub_18AF4E708()
{
  return MEMORY[0x1E0D21500]();
}

uint64_t sub_18AF4E714()
{
  return MEMORY[0x1E0D21508]();
}

uint64_t sub_18AF4E720()
{
  return MEMORY[0x1E0D21520]();
}

uint64_t sub_18AF4E72C()
{
  return MEMORY[0x1E0D21530]();
}

uint64_t sub_18AF4E738()
{
  return MEMORY[0x1E0D21538]();
}

uint64_t sub_18AF4E744()
{
  return MEMORY[0x1E0D21558]();
}

uint64_t sub_18AF4E750()
{
  return MEMORY[0x1E0D21568]();
}

uint64_t sub_18AF4E75C()
{
  return MEMORY[0x1E0D21578]();
}

uint64_t sub_18AF4E768()
{
  return MEMORY[0x1E0D21598]();
}

uint64_t sub_18AF4E774()
{
  return MEMORY[0x1E0D215A8]();
}

uint64_t sub_18AF4E780()
{
  return MEMORY[0x1E0D215B8]();
}

uint64_t sub_18AF4E78C()
{
  return MEMORY[0x1E0D215E8]();
}

uint64_t sub_18AF4E798()
{
  return MEMORY[0x1E0D215F8]();
}

uint64_t sub_18AF4E7A4()
{
  return MEMORY[0x1E0D21610]();
}

uint64_t sub_18AF4E7B0()
{
  return MEMORY[0x1E0D21620]();
}

uint64_t sub_18AF4E7BC()
{
  return MEMORY[0x1E0D50308]();
}

uint64_t sub_18AF4E7C8()
{
  return MEMORY[0x1E0D50310]();
}

uint64_t sub_18AF4E7D4()
{
  return MEMORY[0x1E0D50318]();
}

uint64_t sub_18AF4E7E0()
{
  return MEMORY[0x1E0D50320]();
}

uint64_t sub_18AF4E7EC()
{
  return MEMORY[0x1E0D50340]();
}

uint64_t sub_18AF4E7F8()
{
  return MEMORY[0x1E0D50348]();
}

uint64_t sub_18AF4E804()
{
  return MEMORY[0x1E0D50350]();
}

uint64_t sub_18AF4E810()
{
  return MEMORY[0x1E0D50360]();
}

uint64_t sub_18AF4E828()
{
  return MEMORY[0x1E0D50370]();
}

uint64_t sub_18AF4E834()
{
  return MEMORY[0x1E0CF0C58]();
}

uint64_t sub_18AF4E840()
{
  return MEMORY[0x1E0CF0C80]();
}

uint64_t sub_18AF4E84C()
{
  return MEMORY[0x1E0CAA3F8]();
}

uint64_t sub_18AF4E858()
{
  return MEMORY[0x1E0CAA400]();
}

uint64_t sub_18AF4E864()
{
  return MEMORY[0x1E0CAA410]();
}

uint64_t sub_18AF4E870()
{
  return MEMORY[0x1E0CAA418]();
}

uint64_t sub_18AF4E87C()
{
  return MEMORY[0x1E0CAA428]();
}

uint64_t sub_18AF4E888()
{
  return MEMORY[0x1E0CAA430]();
}

uint64_t sub_18AF4E894()
{
  return MEMORY[0x1E0CAA4D0]();
}

uint64_t sub_18AF4E8A0()
{
  return MEMORY[0x1E0CAA4D8]();
}

uint64_t sub_18AF4E8AC()
{
  return MEMORY[0x1E0CAA508]();
}

uint64_t sub_18AF4E8B8()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_18AF4E8C4()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_18AF4E8D0()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_18AF4E8DC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_18AF4E8E8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18AF4E8F4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18AF4E900()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18AF4E90C()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_18AF4E918()
{
  return MEMORY[0x1E0DC20A8]();
}

uint64_t sub_18AF4E924()
{
  return MEMORY[0x1E0CE9290]();
}

uint64_t sub_18AF4E930()
{
  return MEMORY[0x1E0CE92A8]();
}

uint64_t sub_18AF4E93C()
{
  return MEMORY[0x1E0CE92C0]();
}

uint64_t sub_18AF4E948()
{
  return MEMORY[0x1E0CE92F0]();
}

uint64_t sub_18AF4E954()
{
  return MEMORY[0x1E0CE9308]();
}

uint64_t sub_18AF4E960()
{
  return MEMORY[0x1E0CE9310]();
}

uint64_t sub_18AF4E96C()
{
  return MEMORY[0x1E0CE9320]();
}

uint64_t sub_18AF4E978()
{
  return MEMORY[0x1E0CE9398]();
}

uint64_t sub_18AF4E984()
{
  return MEMORY[0x1E0CE93D0]();
}

uint64_t sub_18AF4E990()
{
  return MEMORY[0x1E0CE93E8]();
}

uint64_t sub_18AF4E99C()
{
  return MEMORY[0x1E0CE9400]();
}

uint64_t sub_18AF4E9A8()
{
  return MEMORY[0x1E0CE9408]();
}

uint64_t sub_18AF4E9B4()
{
  return MEMORY[0x1E0CE9418]();
}

uint64_t sub_18AF4E9C0()
{
  return MEMORY[0x1E0CE9428]();
}

uint64_t sub_18AF4E9CC()
{
  return MEMORY[0x1E0CE9450]();
}

uint64_t sub_18AF4E9D8()
{
  return MEMORY[0x1E0CE94D0]();
}

uint64_t sub_18AF4E9E4()
{
  return MEMORY[0x1E0CE94F0]();
}

uint64_t sub_18AF4E9F0()
{
  return MEMORY[0x1E0CE9518]();
}

uint64_t sub_18AF4E9FC()
{
  return MEMORY[0x1E0CE9530]();
}

uint64_t sub_18AF4EA08()
{
  return MEMORY[0x1E0CE95D0]();
}

uint64_t sub_18AF4EA14()
{
  return MEMORY[0x1E0CE95E8]();
}

uint64_t sub_18AF4EA20()
{
  return MEMORY[0x1E0CE9628]();
}

uint64_t sub_18AF4EA2C()
{
  return MEMORY[0x1E0CE9648]();
}

uint64_t sub_18AF4EA38()
{
  return MEMORY[0x1E0CE9660]();
}

uint64_t sub_18AF4EA44()
{
  return MEMORY[0x1E0CE9668]();
}

uint64_t sub_18AF4EA50()
{
  return MEMORY[0x1E0CE9678]();
}

uint64_t sub_18AF4EA5C()
{
  return MEMORY[0x1E0CE9688]();
}

uint64_t sub_18AF4EA68()
{
  return MEMORY[0x1E0CE9690]();
}

uint64_t sub_18AF4EA74()
{
  return MEMORY[0x1E0CE96A8]();
}

uint64_t sub_18AF4EA80()
{
  return MEMORY[0x1E0CE96B0]();
}

uint64_t sub_18AF4EA8C()
{
  return MEMORY[0x1E0CE96B8]();
}

uint64_t sub_18AF4EA98()
{
  return MEMORY[0x1E0CE96D0]();
}

uint64_t sub_18AF4EAA4()
{
  return MEMORY[0x1E0CE96D8]();
}

uint64_t sub_18AF4EAB0()
{
  return MEMORY[0x1E0CE96F0]();
}

uint64_t sub_18AF4EABC()
{
  return MEMORY[0x1E0CE9748]();
}

uint64_t sub_18AF4EAC8()
{
  return MEMORY[0x1E0CE9768]();
}

uint64_t sub_18AF4EAD4()
{
  return MEMORY[0x1E0CE9770]();
}

uint64_t sub_18AF4EAE0()
{
  return MEMORY[0x1E0CE9790]();
}

uint64_t sub_18AF4EAEC()
{
  return MEMORY[0x1E0CE97D0]();
}

uint64_t sub_18AF4EAF8()
{
  return MEMORY[0x1E0CE9860]();
}

uint64_t sub_18AF4EB04()
{
  return MEMORY[0x1E0CE98B0]();
}

uint64_t sub_18AF4EB10()
{
  return MEMORY[0x1E0CE98B8]();
}

uint64_t sub_18AF4EB1C()
{
  return MEMORY[0x1E0CE98E0]();
}

uint64_t sub_18AF4EB28()
{
  return MEMORY[0x1E0CE98F8]();
}

uint64_t sub_18AF4EB34()
{
  return MEMORY[0x1E0C95A58]();
}

uint64_t sub_18AF4EB40()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_18AF4EB4C()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_18AF4EB58()
{
  return MEMORY[0x1E0C95FC0]();
}

uint64_t sub_18AF4EB64()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_18AF4EB70()
{
  return MEMORY[0x1E0C96030]();
}

uint64_t sub_18AF4EB7C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_18AF4EB88()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_18AF4EB94()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_18AF4EBA0()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_18AF4EBAC()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_18AF4EBB8()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_18AF4EBC4()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_18AF4EBD0()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_18AF4EBDC()
{
  return MEMORY[0x1E0C96408]();
}

uint64_t sub_18AF4EBE8()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_18AF4EBF4()
{
  return MEMORY[0x1E0CD8268]();
}

uint64_t sub_18AF4EC00()
{
  return MEMORY[0x1E0CD8280]();
}

uint64_t sub_18AF4EC0C()
{
  return MEMORY[0x1E0CD8310]();
}

uint64_t sub_18AF4EC18()
{
  return MEMORY[0x1E0CD8330]();
}

uint64_t sub_18AF4EC24()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_18AF4EC30()
{
  return MEMORY[0x1E0CD8548]();
}

uint64_t sub_18AF4EC3C()
{
  return MEMORY[0x1E0CD8570]();
}

uint64_t sub_18AF4EC48()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_18AF4EC54()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_18AF4EC60()
{
  return MEMORY[0x1E0CD8760]();
}

uint64_t sub_18AF4EC6C()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_18AF4EC78()
{
  return MEMORY[0x1E0CD88E8]();
}

uint64_t sub_18AF4EC84()
{
  return MEMORY[0x1E0CD8AE0]();
}

uint64_t sub_18AF4EC90()
{
  return MEMORY[0x1E0CD8AE8]();
}

uint64_t sub_18AF4EC9C()
{
  return MEMORY[0x1E0CD8B40]();
}

uint64_t sub_18AF4ECA8()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_18AF4ECB4()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_18AF4ECC0()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_18AF4ECCC()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_18AF4ECD8()
{
  return MEMORY[0x1E0CD8E58]();
}

uint64_t sub_18AF4ECE4()
{
  return MEMORY[0x1E0CD8E70]();
}

uint64_t sub_18AF4ECF0()
{
  return MEMORY[0x1E0CD8E88]();
}

uint64_t sub_18AF4ECFC()
{
  return MEMORY[0x1E0CD8ED8]();
}

uint64_t sub_18AF4ED08()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_18AF4ED14()
{
  return MEMORY[0x1E0CD8F00]();
}

uint64_t sub_18AF4ED20()
{
  return MEMORY[0x1E0CD8F18]();
}

uint64_t sub_18AF4ED2C()
{
  return MEMORY[0x1E0CD8FC8]();
}

uint64_t sub_18AF4ED38()
{
  return MEMORY[0x1E0CD8FD0]();
}

uint64_t sub_18AF4ED44()
{
  return MEMORY[0x1E0CD8FE0]();
}

uint64_t sub_18AF4ED50()
{
  return MEMORY[0x1E0CD9170]();
}

uint64_t sub_18AF4ED5C()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_18AF4ED68()
{
  return MEMORY[0x1E0CD9230]();
}

uint64_t sub_18AF4ED74()
{
  return MEMORY[0x1E0CD9240]();
}

uint64_t sub_18AF4ED80()
{
  return MEMORY[0x1E0CD9370]();
}

uint64_t sub_18AF4ED8C()
{
  return MEMORY[0x1E0CD9398]();
}

uint64_t sub_18AF4ED98()
{
  return MEMORY[0x1E0CD93A0]();
}

uint64_t sub_18AF4EDA4()
{
  return MEMORY[0x1E0CD9410]();
}

uint64_t sub_18AF4EDB0()
{
  return MEMORY[0x1E0CD94B0]();
}

uint64_t sub_18AF4EDBC()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_18AF4EDC8()
{
  return MEMORY[0x1E0CD94F8]();
}

uint64_t sub_18AF4EDD4()
{
  return MEMORY[0x1E0CD9500]();
}

uint64_t sub_18AF4EDE0()
{
  return MEMORY[0x1E0CD9648]();
}

uint64_t sub_18AF4EDEC()
{
  return MEMORY[0x1E0CD9658]();
}

uint64_t sub_18AF4EDF8()
{
  return MEMORY[0x1E0CD98C8]();
}

uint64_t sub_18AF4EE04()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_18AF4EE10()
{
  return MEMORY[0x1E0CD9AA0]();
}

uint64_t sub_18AF4EE1C()
{
  return MEMORY[0x1E0CD9AA8]();
}

uint64_t sub_18AF4EE28()
{
  return MEMORY[0x1E0CD9B60]();
}

uint64_t sub_18AF4EE34()
{
  return MEMORY[0x1E0CD9B98]();
}

uint64_t sub_18AF4EE40()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_18AF4EE4C()
{
  return MEMORY[0x1E0CD9C90]();
}

uint64_t sub_18AF4EE58()
{
  return MEMORY[0x1E0CD9F90]();
}

uint64_t sub_18AF4EE64()
{
  return MEMORY[0x1E0CD9FA0]();
}

uint64_t sub_18AF4EE70()
{
  return MEMORY[0x1E0CD9FB8]();
}

uint64_t sub_18AF4EE7C()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_18AF4EE88()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_18AF4EE94()
{
  return MEMORY[0x1E0CDA490]();
}

uint64_t sub_18AF4EEA0()
{
  return MEMORY[0x1E0CDA498]();
}

uint64_t sub_18AF4EEAC()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_18AF4EEB8()
{
  return MEMORY[0x1E0CDA4B0]();
}

uint64_t sub_18AF4EEC4()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_18AF4EED0()
{
  return MEMORY[0x1E0CDA590]();
}

uint64_t sub_18AF4EEDC()
{
  return MEMORY[0x1E0CDA5A0]();
}

uint64_t sub_18AF4EEE8()
{
  return MEMORY[0x1E0CDA608]();
}

uint64_t sub_18AF4EEF4()
{
  return MEMORY[0x1E0CDA610]();
}

uint64_t sub_18AF4EF00()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_18AF4EF0C()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_18AF4EF18()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_18AF4EF24()
{
  return MEMORY[0x1E0CDA648]();
}

uint64_t sub_18AF4EF30()
{
  return MEMORY[0x1E0CDA650]();
}

uint64_t sub_18AF4EF3C()
{
  return MEMORY[0x1E0CDA668]();
}

uint64_t sub_18AF4EF48()
{
  return MEMORY[0x1E0CDA670]();
}

uint64_t sub_18AF4EF54()
{
  return MEMORY[0x1E0CDA690]();
}

uint64_t sub_18AF4EF60()
{
  return MEMORY[0x1E0CDA750]();
}

uint64_t sub_18AF4EF6C()
{
  return MEMORY[0x1E0CDA758]();
}

uint64_t sub_18AF4EF78()
{
  return MEMORY[0x1E0CDA788]();
}

uint64_t sub_18AF4EF84()
{
  return MEMORY[0x1E0CDA790]();
}

uint64_t sub_18AF4EF90()
{
  return MEMORY[0x1E0CDA7C8]();
}

uint64_t sub_18AF4EF9C()
{
  return MEMORY[0x1E0CDA7D0]();
}

uint64_t sub_18AF4EFA8()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_18AF4EFB4()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_18AF4EFC0()
{
  return MEMORY[0x1E0CDA838]();
}

uint64_t sub_18AF4EFCC()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_18AF4EFD8()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_18AF4EFE4()
{
  return MEMORY[0x1E0CDA930]();
}

uint64_t sub_18AF4EFF0()
{
  return MEMORY[0x1E0CDA990]();
}

uint64_t sub_18AF4EFFC()
{
  return MEMORY[0x1E0CDA9A0]();
}

uint64_t sub_18AF4F008()
{
  return MEMORY[0x1E0CDA9C0]();
}

uint64_t sub_18AF4F014()
{
  return MEMORY[0x1E0CDA9C8]();
}

uint64_t sub_18AF4F020()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_18AF4F02C()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_18AF4F038()
{
  return MEMORY[0x1E0CDA9F0]();
}

uint64_t sub_18AF4F044()
{
  return MEMORY[0x1E0CDA9F8]();
}

uint64_t sub_18AF4F050()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_18AF4F05C()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_18AF4F068()
{
  return MEMORY[0x1E0CDAA68]();
}

uint64_t sub_18AF4F074()
{
  return MEMORY[0x1E0CDAA78]();
}

uint64_t sub_18AF4F080()
{
  return MEMORY[0x1E0CDABA8]();
}

uint64_t sub_18AF4F08C()
{
  return MEMORY[0x1E0CDABB8]();
}

uint64_t sub_18AF4F098()
{
  return MEMORY[0x1E0CDABC0]();
}

uint64_t sub_18AF4F0A4()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_18AF4F0B0()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_18AF4F0BC()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_18AF4F0C8()
{
  return MEMORY[0x1E0CDB258]();
}

uint64_t sub_18AF4F0D4()
{
  return MEMORY[0x1E0CDB288]();
}

uint64_t sub_18AF4F0E0()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_18AF4F0EC()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_18AF4F0F8()
{
  return MEMORY[0x1E0CDB530]();
}

uint64_t sub_18AF4F104()
{
  return MEMORY[0x1E0CDB540]();
}

uint64_t sub_18AF4F110()
{
  return MEMORY[0x1E0CDB558]();
}

uint64_t sub_18AF4F11C()
{
  return MEMORY[0x1E0CDB578]();
}

uint64_t sub_18AF4F128()
{
  return MEMORY[0x1E0CDB590]();
}

uint64_t sub_18AF4F134()
{
  return MEMORY[0x1E0CDB600]();
}

uint64_t sub_18AF4F140()
{
  return MEMORY[0x1E0CDB660]();
}

uint64_t sub_18AF4F14C()
{
  return MEMORY[0x1E0CDB670]();
}

uint64_t sub_18AF4F158()
{
  return MEMORY[0x1E0CDB680]();
}

uint64_t sub_18AF4F164()
{
  return MEMORY[0x1E0CDB690]();
}

uint64_t sub_18AF4F170()
{
  return MEMORY[0x1E0CDB6A0]();
}

uint64_t sub_18AF4F17C()
{
  return MEMORY[0x1E0CDB6B0]();
}

uint64_t sub_18AF4F188()
{
  return MEMORY[0x1E0CDB6C0]();
}

uint64_t sub_18AF4F194()
{
  return MEMORY[0x1E0CDB6C8]();
}

uint64_t sub_18AF4F1A0()
{
  return MEMORY[0x1E0CDB6D8]();
}

uint64_t sub_18AF4F1AC()
{
  return MEMORY[0x1E0CDB6E8]();
}

uint64_t sub_18AF4F1B8()
{
  return MEMORY[0x1E0CDB700]();
}

uint64_t sub_18AF4F1C4()
{
  return MEMORY[0x1E0CDB710]();
}

uint64_t sub_18AF4F1D0()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_18AF4F1DC()
{
  return MEMORY[0x1E0CDBAA8]();
}

uint64_t sub_18AF4F1E8()
{
  return MEMORY[0x1E0CDBAC8]();
}

uint64_t sub_18AF4F1F4()
{
  return MEMORY[0x1E0CDBB18]();
}

uint64_t sub_18AF4F200()
{
  return MEMORY[0x1E0CDBC80]();
}

uint64_t sub_18AF4F20C()
{
  return MEMORY[0x1E0CDBC98]();
}

uint64_t sub_18AF4F218()
{
  return MEMORY[0x1E0CDBD20]();
}

uint64_t sub_18AF4F224()
{
  return MEMORY[0x1E0CDBD60]();
}

uint64_t sub_18AF4F230()
{
  return MEMORY[0x1E0CDBD68]();
}

uint64_t sub_18AF4F23C()
{
  return MEMORY[0x1E0CDBDB8]();
}

uint64_t sub_18AF4F248()
{
  return MEMORY[0x1E0CDBE00]();
}

uint64_t sub_18AF4F254()
{
  return MEMORY[0x1E0CDC328]();
}

uint64_t sub_18AF4F260()
{
  return MEMORY[0x1E0CDC618]();
}

uint64_t sub_18AF4F26C()
{
  return MEMORY[0x1E0CDC628]();
}

uint64_t sub_18AF4F278()
{
  return MEMORY[0x1E0CDC970]();
}

uint64_t sub_18AF4F284()
{
  return MEMORY[0x1E0CDC998]();
}

uint64_t sub_18AF4F290()
{
  return MEMORY[0x1E0CDCA30]();
}

uint64_t sub_18AF4F29C()
{
  return MEMORY[0x1E0CDCB70]();
}

uint64_t sub_18AF4F2A8()
{
  return MEMORY[0x1E0CDCB88]();
}

uint64_t sub_18AF4F2B4()
{
  return MEMORY[0x1E0CDCDB8]();
}

uint64_t sub_18AF4F2C0()
{
  return MEMORY[0x1E0CDCDC8]();
}

uint64_t sub_18AF4F2CC()
{
  return MEMORY[0x1E0CDCE50]();
}

uint64_t sub_18AF4F2D8()
{
  return MEMORY[0x1E0CDCE58]();
}

uint64_t sub_18AF4F2E4()
{
  return MEMORY[0x1E0CDCE70]();
}

uint64_t sub_18AF4F2F0()
{
  return MEMORY[0x1E0CDCE80]();
}

uint64_t sub_18AF4F2FC()
{
  return MEMORY[0x1E0CDCE88]();
}

uint64_t sub_18AF4F308()
{
  return MEMORY[0x1E0CDCE98]();
}

uint64_t sub_18AF4F314()
{
  return MEMORY[0x1E0CDCEA8]();
}

uint64_t sub_18AF4F320()
{
  return MEMORY[0x1E0CDCEC0]();
}

uint64_t sub_18AF4F32C()
{
  return MEMORY[0x1E0CDCED0]();
}

uint64_t sub_18AF4F338()
{
  return MEMORY[0x1E0CDCFC8]();
}

uint64_t sub_18AF4F344()
{
  return MEMORY[0x1E0CDD220]();
}

uint64_t sub_18AF4F350()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_18AF4F35C()
{
  return MEMORY[0x1E0CDD300]();
}

uint64_t sub_18AF4F368()
{
  return MEMORY[0x1E0CDD320]();
}

uint64_t sub_18AF4F374()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_18AF4F380()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_18AF4F38C()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_18AF4F398()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_18AF4F3A4()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_18AF4F3B0()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_18AF4F3BC()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_18AF4F3C8()
{
  return MEMORY[0x1E0CDD418]();
}

uint64_t sub_18AF4F3D4()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_18AF4F3E0()
{
  return MEMORY[0x1E0CDD4C8]();
}

uint64_t sub_18AF4F3EC()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_18AF4F3F8()
{
  return MEMORY[0x1E0CDD520]();
}

uint64_t sub_18AF4F404()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_18AF4F410()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_18AF4F41C()
{
  return MEMORY[0x1E0CDD5C0]();
}

uint64_t sub_18AF4F428()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_18AF4F434()
{
  return MEMORY[0x1E0CDD5E8]();
}

uint64_t sub_18AF4F440()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_18AF4F44C()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_18AF4F458()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_18AF4F464()
{
  return MEMORY[0x1E0CDD678]();
}

uint64_t sub_18AF4F470()
{
  return MEMORY[0x1E0CDD718]();
}

uint64_t sub_18AF4F47C()
{
  return MEMORY[0x1E0CDD728]();
}

uint64_t sub_18AF4F488()
{
  return MEMORY[0x1E0CDD750]();
}

uint64_t sub_18AF4F494()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_18AF4F4A0()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_18AF4F4AC()
{
  return MEMORY[0x1E0CDD930]();
}

uint64_t sub_18AF4F4B8()
{
  return MEMORY[0x1E0CDDAA0]();
}

uint64_t sub_18AF4F4C4()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_18AF4F4D0()
{
  return MEMORY[0x1E0CDDBE0]();
}

uint64_t sub_18AF4F4DC()
{
  return MEMORY[0x1E0CDDBF0]();
}

uint64_t sub_18AF4F4E8()
{
  return MEMORY[0x1E0CDDC18]();
}

uint64_t sub_18AF4F4F4()
{
  return MEMORY[0x1E0CDDC38]();
}

uint64_t sub_18AF4F500()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_18AF4F50C()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_18AF4F518()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_18AF4F524()
{
  return MEMORY[0x1E0CDDE00]();
}

uint64_t sub_18AF4F530()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_18AF4F53C()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_18AF4F548()
{
  return MEMORY[0x1E0CDDEE0]();
}

uint64_t sub_18AF4F554()
{
  return MEMORY[0x1E0CDDF10]();
}

uint64_t sub_18AF4F560()
{
  return MEMORY[0x1E0CDDFD8]();
}

uint64_t sub_18AF4F56C()
{
  return MEMORY[0x1E0CDE028]();
}

uint64_t sub_18AF4F578()
{
  return MEMORY[0x1E0CDE050]();
}

uint64_t sub_18AF4F584()
{
  return MEMORY[0x1E0CDE0C8]();
}

uint64_t sub_18AF4F590()
{
  return MEMORY[0x1E0CDE258]();
}

uint64_t sub_18AF4F59C()
{
  return MEMORY[0x1E0CDE280]();
}

uint64_t sub_18AF4F5A8()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_18AF4F5B4()
{
  return MEMORY[0x1E0CDE490]();
}

uint64_t sub_18AF4F5C0()
{
  return MEMORY[0x1E0CDE508]();
}

uint64_t sub_18AF4F5CC()
{
  return MEMORY[0x1E0CDE780]();
}

uint64_t sub_18AF4F5D8()
{
  return MEMORY[0x1E0CDE810]();
}

uint64_t sub_18AF4F5E4()
{
  return MEMORY[0x1E0CDE890]();
}

uint64_t sub_18AF4F5F0()
{
  return MEMORY[0x1E0CDE8D0]();
}

uint64_t sub_18AF4F5FC()
{
  return MEMORY[0x1E0CDEA80]();
}

uint64_t sub_18AF4F608()
{
  return MEMORY[0x1E0CDEBB0]();
}

uint64_t sub_18AF4F614()
{
  return MEMORY[0x1E0CDEC38]();
}

uint64_t sub_18AF4F620()
{
  return MEMORY[0x1E0CDEC50]();
}

uint64_t sub_18AF4F62C()
{
  return MEMORY[0x1E0CDEC80]();
}

uint64_t sub_18AF4F638()
{
  return MEMORY[0x1E0CDED70]();
}

uint64_t sub_18AF4F644()
{
  return MEMORY[0x1E0CDEF48]();
}

uint64_t sub_18AF4F650()
{
  return MEMORY[0x1E0CDEF50]();
}

uint64_t sub_18AF4F65C()
{
  return MEMORY[0x1E0CDF068]();
}

uint64_t sub_18AF4F668()
{
  return MEMORY[0x1E0CDF088]();
}

uint64_t sub_18AF4F674()
{
  return MEMORY[0x1E0CDF0D0]();
}

uint64_t sub_18AF4F680()
{
  return MEMORY[0x1E0CDF138]();
}

uint64_t sub_18AF4F68C()
{
  return MEMORY[0x1E0CDF170]();
}

uint64_t sub_18AF4F698()
{
  return MEMORY[0x1E0CDF278]();
}

uint64_t sub_18AF4F6A4()
{
  return MEMORY[0x1E0CDF2B8]();
}

uint64_t sub_18AF4F6B0()
{
  return MEMORY[0x1E0CDF308]();
}

uint64_t sub_18AF4F6BC()
{
  return MEMORY[0x1E0CDF3A0]();
}

uint64_t sub_18AF4F6C8()
{
  return MEMORY[0x1E0CDF3B8]();
}

uint64_t sub_18AF4F6D4()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_18AF4F6E0()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_18AF4F6EC()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_18AF4F6F8()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_18AF4F704()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_18AF4F710()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_18AF4F71C()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_18AF4F728()
{
  return MEMORY[0x1E0CDF520]();
}

uint64_t sub_18AF4F734()
{
  return MEMORY[0x1E0CDF538]();
}

uint64_t sub_18AF4F740()
{
  return MEMORY[0x1E0CDF540]();
}

uint64_t sub_18AF4F74C()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_18AF4F758()
{
  return MEMORY[0x1E0CDF5F8]();
}

uint64_t sub_18AF4F764()
{
  return MEMORY[0x1E0CDF608]();
}

uint64_t sub_18AF4F770()
{
  return MEMORY[0x1E0CDF630]();
}

uint64_t sub_18AF4F77C()
{
  return MEMORY[0x1E0CDF6A0]();
}

uint64_t sub_18AF4F788()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_18AF4F794()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_18AF4F7A0()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_18AF4F7AC()
{
  return MEMORY[0x1E0CDF7A0]();
}

uint64_t sub_18AF4F7B8()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_18AF4F7C4()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_18AF4F7D0()
{
  return MEMORY[0x1E0CDF890]();
}

uint64_t sub_18AF4F7DC()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_18AF4F7E8()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_18AF4F7F4()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_18AF4F800()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_18AF4F80C()
{
  return MEMORY[0x1E0CDF9E0]();
}

uint64_t sub_18AF4F818()
{
  return MEMORY[0x1E0CDF9F8]();
}

uint64_t sub_18AF4F824()
{
  return MEMORY[0x1E0CDFA30]();
}

uint64_t sub_18AF4F830()
{
  return MEMORY[0x1E0CDFAE0]();
}

uint64_t sub_18AF4F83C()
{
  return MEMORY[0x1E0CDFAF0]();
}

uint64_t sub_18AF4F848()
{
  return MEMORY[0x1E0CDFB40]();
}

uint64_t sub_18AF4F854()
{
  return MEMORY[0x1E0CDFB48]();
}

uint64_t sub_18AF4F860()
{
  return MEMORY[0x1E0CDFB50]();
}

uint64_t sub_18AF4F86C()
{
  return MEMORY[0x1E0CDFB68]();
}

uint64_t sub_18AF4F878()
{
  return MEMORY[0x1E0CDFB70]();
}

uint64_t sub_18AF4F884()
{
  return MEMORY[0x1E0CDFC88]();
}

uint64_t sub_18AF4F890()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_18AF4F89C()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_18AF4F8A8()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_18AF4F8B4()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_18AF4F8C0()
{
  return MEMORY[0x1E0CDFD58]();
}

uint64_t sub_18AF4F8CC()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_18AF4F8D8()
{
  return MEMORY[0x1E0CDFE40]();
}

uint64_t sub_18AF4F8E4()
{
  return MEMORY[0x1E0CDFE50]();
}

uint64_t sub_18AF4F8F0()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_18AF4F8FC()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_18AF4F908()
{
  return MEMORY[0x1E0CDFF50]();
}

uint64_t sub_18AF4F914()
{
  return MEMORY[0x1E0CDFF68]();
}

uint64_t sub_18AF4F920()
{
  return MEMORY[0x1E0CE00E0]();
}

uint64_t sub_18AF4F92C()
{
  return MEMORY[0x1E0CE0120]();
}

uint64_t sub_18AF4F938()
{
  return MEMORY[0x1E0CE0130]();
}

uint64_t sub_18AF4F944()
{
  return MEMORY[0x1E0CE0140]();
}

uint64_t sub_18AF4F950()
{
  return MEMORY[0x1E0CE0178]();
}

uint64_t sub_18AF4F95C()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_18AF4F968()
{
  return MEMORY[0x1E0CE0200]();
}

uint64_t sub_18AF4F974()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_18AF4F980()
{
  return MEMORY[0x1E0CE0228]();
}

uint64_t sub_18AF4F98C()
{
  return MEMORY[0x1E0CE02A0]();
}

uint64_t sub_18AF4F998()
{
  return MEMORY[0x1E0CE02C8]();
}

uint64_t sub_18AF4F9A4()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_18AF4F9B0()
{
  return MEMORY[0x1E0CE0330]();
}

uint64_t sub_18AF4F9BC()
{
  return MEMORY[0x1E0CE04C0]();
}

uint64_t sub_18AF4F9C8()
{
  return MEMORY[0x1E0CE05F0]();
}

uint64_t sub_18AF4F9D4()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_18AF4F9E0()
{
  return MEMORY[0x1E0CE0670]();
}

uint64_t sub_18AF4F9EC()
{
  return MEMORY[0x1E0CE0698]();
}

uint64_t sub_18AF4F9F8()
{
  return MEMORY[0x1E0CE06B8]();
}

uint64_t sub_18AF4FA04()
{
  return MEMORY[0x1E0CE06C8]();
}

uint64_t sub_18AF4FA10()
{
  return MEMORY[0x1E0CE06D0]();
}

uint64_t sub_18AF4FA1C()
{
  return MEMORY[0x1E0C964D8]();
}

uint64_t sub_18AF4FA28()
{
  return MEMORY[0x1E0C964E0]();
}

uint64_t sub_18AF4FA34()
{
  return MEMORY[0x1E0C964E8]();
}

uint64_t sub_18AF4FA40()
{
  return MEMORY[0x1E0C964F0]();
}

uint64_t sub_18AF4FA4C()
{
  return MEMORY[0x1E0C964F8]();
}

uint64_t sub_18AF4FA58()
{
  return MEMORY[0x1E0C96500]();
}

uint64_t sub_18AF4FA64()
{
  return MEMORY[0x1E0C96508]();
}

uint64_t sub_18AF4FA70()
{
  return MEMORY[0x1E0C96518]();
}

uint64_t sub_18AF4FA7C()
{
  return MEMORY[0x1E0C96520]();
}

uint64_t sub_18AF4FA88()
{
  return MEMORY[0x1E0C96528]();
}

uint64_t sub_18AF4FA94()
{
  return MEMORY[0x1E0C96530]();
}

uint64_t sub_18AF4FAA0()
{
  return MEMORY[0x1E0C96538]();
}

uint64_t sub_18AF4FAAC()
{
  return MEMORY[0x1E0C96540]();
}

uint64_t sub_18AF4FAB8()
{
  return MEMORY[0x1E0C96558]();
}

uint64_t sub_18AF4FAC4()
{
  return MEMORY[0x1E0C96560]();
}

uint64_t sub_18AF4FAD0()
{
  return MEMORY[0x1E0C96568]();
}

uint64_t sub_18AF4FADC()
{
  return MEMORY[0x1E0C96570]();
}

uint64_t sub_18AF4FAE8()
{
  return MEMORY[0x1E0C96578]();
}

uint64_t sub_18AF4FAF4()
{
  return MEMORY[0x1E0C96580]();
}

uint64_t sub_18AF4FB00()
{
  return MEMORY[0x1E0C96590]();
}

uint64_t sub_18AF4FB0C()
{
  return MEMORY[0x1E0C96598]();
}

uint64_t sub_18AF4FB18()
{
  return MEMORY[0x1E0C965A0]();
}

uint64_t sub_18AF4FB24()
{
  return MEMORY[0x1E0C965A8]();
}

uint64_t sub_18AF4FB30()
{
  return MEMORY[0x1E0C965B0]();
}

uint64_t sub_18AF4FB3C()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_18AF4FB48()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_18AF4FB54()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_18AF4FB60()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_18AF4FB6C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18AF4FB78()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_18AF4FB84()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_18AF4FB90()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_18AF4FB9C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_18AF4FBA8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_18AF4FBB4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_18AF4FBC0()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_18AF4FBCC()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_18AF4FBD8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_18AF4FBE4()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_18AF4FBF0()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_18AF4FBFC()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_18AF4FC08()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_18AF4FC14()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_18AF4FC20()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_18AF4FC2C()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_18AF4FC38()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18AF4FC44()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_18AF4FC50()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18AF4FC5C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18AF4FC68()
{
  return MEMORY[0x1E0CB19B0]();
}

uint64_t sub_18AF4FC74()
{
  return MEMORY[0x1E0CB1A40]();
}

uint64_t sub_18AF4FC80()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_18AF4FC8C()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_18AF4FC98()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_18AF4FCA4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18AF4FCB0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_18AF4FCBC()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_18AF4FCC8()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_18AF4FCD4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18AF4FCE0()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_18AF4FCEC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18AF4FCF8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_18AF4FD04()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_18AF4FD10()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_18AF4FD1C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_18AF4FD28()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18AF4FD34()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_18AF4FD40()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_18AF4FD4C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_18AF4FD58()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_18AF4FD64()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_18AF4FD70()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_18AF4FD7C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_18AF4FD88()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_18AF4FD94()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_18AF4FDA0()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_18AF4FDAC()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_18AF4FDB8()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_18AF4FDC4()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_18AF4FDD0()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_18AF4FDDC()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_18AF4FDE8()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_18AF4FDF4()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_18AF4FE00()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_18AF4FE0C()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_18AF4FE18()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_18AF4FE24()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t sub_18AF4FE30()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_18AF4FE3C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_18AF4FE48()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_18AF4FE54()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_18AF4FE60()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_18AF4FE6C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_18AF4FE78()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_18AF4FE84()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_18AF4FE90()
{
  return MEMORY[0x1E0DF1FD0]();
}

uint64_t sub_18AF4FE9C()
{
  return MEMORY[0x1E0DEB5A0]();
}

uint64_t sub_18AF4FEA8()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_18AF4FEB4()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_18AF4FEC0()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_18AF4FECC()
{
  return MEMORY[0x1E0CB1CE0]();
}

uint64_t sub_18AF4FED8()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_18AF4FEE4()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_18AF4FEF0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18AF4FEFC()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_18AF4FF08()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_18AF4FF14()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_18AF4FF20()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_18AF4FF2C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_18AF4FF38()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_18AF4FF44()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_18AF4FF50()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_18AF4FF5C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_18AF4FF68()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_18AF4FF74()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_18AF4FF80()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_18AF4FF8C()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_18AF4FF98()
{
  return MEMORY[0x1E0CE0730]();
}

uint64_t sub_18AF4FFA4()
{
  return MEMORY[0x1E0CAA5D8]();
}

uint64_t sub_18AF4FFB0()
{
  return MEMORY[0x1E0CAA5E0]();
}

uint64_t sub_18AF4FFBC()
{
  return MEMORY[0x1E0CAA5F8]();
}

uint64_t sub_18AF4FFC8()
{
  return MEMORY[0x1E0DC2F48]();
}

uint64_t sub_18AF4FFD4()
{
  return MEMORY[0x1E0CF0CC8]();
}

uint64_t sub_18AF4FFE0()
{
  return MEMORY[0x1E0CF0CE8]();
}

uint64_t sub_18AF4FFEC()
{
  return MEMORY[0x1E0D50378]();
}

uint64_t sub_18AF4FFF8()
{
  return MEMORY[0x1E0D50380]();
}

uint64_t sub_18AF50004()
{
  return MEMORY[0x1E0CE0760]();
}

uint64_t sub_18AF50010()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_18AF5001C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18AF50028()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_18AF50034()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_18AF50040()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_18AF5004C()
{
  return MEMORY[0x1E0DC3008]();
}

uint64_t sub_18AF50058()
{
  return MEMORY[0x1E0DC3010]();
}

uint64_t sub_18AF50064()
{
  return MEMORY[0x1E0DC3038]();
}

uint64_t sub_18AF50070()
{
  return MEMORY[0x1E0DC3070]();
}

uint64_t sub_18AF5007C()
{
  return MEMORY[0x1E0DC3080]();
}

uint64_t sub_18AF50088()
{
  return MEMORY[0x1E0DC3110]();
}

uint64_t sub_18AF50094()
{
  return MEMORY[0x1E0DC3128]();
}

uint64_t sub_18AF500A0()
{
  return MEMORY[0x1E0DC3138]();
}

uint64_t sub_18AF500AC()
{
  return MEMORY[0x1E0DC3148]();
}

uint64_t sub_18AF500B8()
{
  return MEMORY[0x1E0DC31A0]();
}

uint64_t sub_18AF500C4()
{
  return MEMORY[0x1E0DC31B8]();
}

uint64_t sub_18AF500D0()
{
  return MEMORY[0x1E0DC31D8]();
}

uint64_t sub_18AF500DC()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_18AF500E8()
{
  return MEMORY[0x1E0DC3238]();
}

uint64_t sub_18AF500F4()
{
  return MEMORY[0x1E0DC3240]();
}

uint64_t sub_18AF50100()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_18AF5010C()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_18AF50118()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_18AF50124()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18AF50130()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18AF5013C()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_18AF50148()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_18AF50154()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18AF50160()
{
  return MEMORY[0x1E0DEBFC8]();
}

uint64_t sub_18AF5016C()
{
  return MEMORY[0x1E0DEC010]();
}

uint64_t sub_18AF50178()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18AF50184()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_18AF50190()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_18AF5019C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_18AF501A8()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_18AF501B4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_18AF501C0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_18AF501CC()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_18AF501D8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18AF501E4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18AF501F0()
{
  return MEMORY[0x1E0DEC300]();
}

uint64_t sub_18AF501FC()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_18AF50208()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_18AF50214()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_18AF50220()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18AF5022C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_18AF50238()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_18AF50244()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_18AF50250()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_18AF5025C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_18AF50268()
{
  return MEMORY[0x1E0DF0B20]();
}

uint64_t sub_18AF50274()
{
  return MEMORY[0x1E0DF0B48]();
}

uint64_t sub_18AF50280()
{
  return MEMORY[0x1E0DF0B58]();
}

uint64_t sub_18AF5028C()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_18AF50298()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_18AF502A4()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_18AF502B0()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_18AF502BC()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_18AF502C8()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_18AF502D4()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_18AF502E0()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_18AF502EC()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_18AF502F8()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_18AF50304()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18AF50310()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_18AF5031C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_18AF50328()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_18AF50334()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_18AF50340()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_18AF5034C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_18AF50358()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_18AF50364()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_18AF50370()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18AF5037C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_18AF50388()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_18AF50394()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_18AF503A0()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_18AF503AC()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_18AF503B8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_18AF503C4()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_18AF503D0()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_18AF503DC()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_18AF503E8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_18AF503F4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18AF50400()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_18AF5040C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_18AF50418()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18AF50424()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_18AF50430()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_18AF5043C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_18AF50448()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_18AF50454()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_18AF50460()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_18AF5046C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_18AF50478()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_18AF50484()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_18AF50490()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_18AF5049C()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_18AF504A8()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_18AF504B4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18AF504C0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18AF504CC()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_18AF504D8()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_18AF504E4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_18AF504F0()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_18AF504FC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_18AF50508()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_18AF50514()
{
  return MEMORY[0x1E0DEE750]();
}

uint64_t sub_18AF50520()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_18AF5052C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_18AF50538()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t sub_18AF50544()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t ABAddressBookCopyAllLabels()
{
  return MEMORY[0x1E0CF5608]();
}

uint64_t ABAddressBookCopyBundleURL()
{
  return MEMORY[0x1E0CF5688]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x1E0CF5710](options, error);
}

uint64_t ABAddressBookDeleteLabel()
{
  return MEMORY[0x1E0CF5718]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1E0D01490]();
}

uint64_t BSRectRoundForScale()
{
  return MEMORY[0x1E0D014F0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1E0D015B8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x1E0D15CE8]();
}

uint64_t CEMEmojiLocaleDataCreateEmojiTokensForString()
{
  return MEMORY[0x1E0D15D10]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1E0D15D90]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x1E0D15DC8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFArrayRef CFLocaleCopyISOCountryCodes(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98780]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1E0C99218](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

uint64_t CGImageCreateByScaling()
{
  return MEMORY[0x1E0CBC2A0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
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

uint64_t CMFBlockListAddItemForAllServices()
{
  return MEMORY[0x1E0D13258]();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x1E0D13268]();
}

uint64_t CMFBlockListRemoveItemFromAllServices()
{
  return MEMORY[0x1E0D13270]();
}

uint64_t CNAbstractMethodException()
{
  return MEMORY[0x1E0D136F0]();
}

uint64_t CNCreateCollatorWithPreferredLocale()
{
  return MEMORY[0x1E0D13728]();
}

uint64_t CNDispatchSemaphoreWait()
{
  return MEMORY[0x1E0D13730]();
}

uint64_t CNImageUtilsCreateMmappedBitmapContext()
{
  return MEMORY[0x1E0C968E8]();
}

uint64_t CNImageUtilsCroppedImageDataFromFullSizeImageData()
{
  return MEMORY[0x1E0C968F0]();
}

uint64_t CNInitializerUnavailableException()
{
  return MEMORY[0x1E0D137E8]();
}

uint64_t CNReleaseCollator()
{
  return MEMORY[0x1E0D138F0]();
}

uint64_t CNResultWithLock()
{
  return MEMORY[0x1E0D13900]();
}

uint64_t CNStringContainsEmojiCharacters()
{
  return MEMORY[0x1E0D13928]();
}

uint64_t CNStringContainsNonLatinCharacters()
{
  return MEMORY[0x1E0D13938]();
}

uint64_t CNUnimplementedMethodException()
{
  return MEMORY[0x1E0D13948]();
}

uint64_t CPCanSendMMS()
{
  return MEMORY[0x1E0CFA210]();
}

uint64_t CPCanSendMail()
{
  return MEMORY[0x1E0CFA218]();
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

uint64_t CreateCMFItemFromString()
{
  return MEMORY[0x1E0D132B8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1E0DB0FF0]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x1E0DC4568]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

uint64_t UICreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0DC4940]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

UIEdgeInsets UIEdgeInsetsFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  UIEdgeInsets result;

  MEMORY[0x1E0DC49B0](string);
  result.right = v4;
  result.bottom = v3;
  result.left = v2;
  result.top = v1;
  return result;
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

uint64_t UIImageGetTableNext()
{
  return MEMORY[0x1E0DC4C20]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIKeyboardGetActiveInputModes()
{
  return MEMORY[0x1E0DC4E98]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x1E0DC4EA0]();
}

uint64_t UIKeyboardInputModeGetVariant()
{
  return MEMORY[0x1E0DC4F18]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0DC5258]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1E0DC52D8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1E0DDD660]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _PNCopyFormattedNumberSuggestionForDigitsWithCountry()
{
  return MEMORY[0x1E0D178A8]();
}

uint64_t _UIClickPresentationBackgroundColor()
{
  return MEMORY[0x1E0DC5788]();
}

uint64_t _UIClickPresentationBackgroundEffects()
{
  return MEMORY[0x1E0DC5790]();
}

uint64_t _UITableViewDefaultSectionCornerRadiusForTraitCollection()
{
  return MEMORY[0x1E0DC5A30]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

uint64_t cn_objectResultWithObjectLock()
{
  return MEMORY[0x1E0D13BF0]();
}

uint64_t cn_runWithObjectLock()
{
  return MEMORY[0x1E0D13BF8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
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

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x1E0DF0F78]();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x1E0DEEC20]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

uint64_t uscript_getScript()
{
  return MEMORY[0x1E0DE6898]();
}

