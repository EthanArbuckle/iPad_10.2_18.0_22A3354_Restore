id sub_24312C2C8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id result;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  id v37;
  unsigned int v38;
  char **v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF20]), sel_init);
  v62 = v3;
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedContext);
  if (!v4
    || (v5 = v4,
        v6 = objc_msgSend(v4, sel_managedObjectContext),
        v5,
        !v6))
  {
    v6 = v3;
LABEL_28:

    return v2;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedContext);
  if (!result)
  {
    __break(1u);
    goto LABEL_57;
  }
  v8 = result;
  v9 = objc_msgSend(result, sel_managedObjectContext);

  if (!v9)
  {

    goto LABEL_28;
  }
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572865E0);
  v10 = sub_2431411BC();
  v11 = v60;
  if (v60 == 1)
  {
    MEMORY[0x24BDAC7A8](v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572865E8);
    sub_2431411BC();
    v11 = v61;
  }
  if (!v11)
    goto LABEL_32;
  swift_unknownObjectRetain();
  objc_opt_self();
  v12 = swift_dynamicCastObjCClass();
  if (v12)
  {
    v32 = v12;
    v33 = CGSizeMake(300.0, 300.0);
    v35 = objc_msgSend((id)objc_opt_self(), sel_createTextViewWithNote_size_, v32, v33, v34);
    v36 = (void *)objc_opt_self();
    v37 = v35;
    v38 = objc_msgSend(v36, sel_isEnabled);
    v39 = &selRef_setPaperEnabled_;
    if (!v38)
      v39 = &selRef_setStylusDrawingEnabled_;
    objc_msgSend(v37, *v39, 1);
    objc_msgSend(v37, sel_setDataDetectorTypes_, 0);
    v40 = objc_msgSend(v37, sel_textDragInteraction);
    objc_msgSend(v40, sel_setEnabled_, 0);

    v41 = objc_msgSend(v37, sel_textStorage);
    objc_opt_self();
    v42 = (void *)swift_dynamicCastObjCClass();
    if (v42)
      objc_msgSend(v42, sel_fixupAfterEditing);

    v43 = v37;
    sub_24312D084(v43);

    objc_msgSend(v43, sel_setUserInteractionEnabled_, 1);
    objc_msgSend(v43, sel_setSelectable_, 0);
    objc_msgSend(v43, sel_setScrollEnabled_, 0);
    v44 = (void *)objc_opt_self();
    sub_24312E204(0, &qword_257286658);
    objc_msgSend(v44, sel_registerTextAttachmentClass_forFileType_, swift_getObjCClassFromMetadata(), *MEMORY[0x24BDE3400]);
    sub_24312E204(0, &qword_257286660);
    objc_msgSend(v44, sel_registerTextAttachmentClass_forFileType_, swift_getObjCClassFromMetadata(), *MEMORY[0x24BDE3408]);
    v45 = (void *)objc_opt_self();
    v46 = v43;
    v47 = objc_msgSend(v45, sel_clearColor);
    objc_msgSend(v46, sel_setBackgroundColor_, v47);

    v48 = objc_msgSend(v45, sel_ICTintColor);
    objc_msgSend(v46, sel_setTintColor_, v48);

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    return v46;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRetain();
  if (!swift_dynamicCastObjCProtocolConditional())
  {
    swift_unknownObjectRelease_n();
LABEL_32:

    swift_bridgeObjectRelease();
    return v2;
  }
  v58 = v9;
  CGSizeMake(300.0, 300.0);
  v13 = CGRectMake();
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6DF48]), sel_initWithFrame_, v13, v14, v15, v16);
  objc_msgSend(v17, sel_setDelegate_, *(_QWORD *)(v1 + 56));
  result = objc_msgSend(v17, sel_webView);
  if (!result)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  v18 = result;
  v59 = v17;
  v19 = objc_msgSend(result, sel_scrollView);

  v20 = objc_msgSend(v19, sel_subviews);
  sub_24312E204(0, &qword_257286650);
  v21 = sub_243141144();

  if (v21 >> 62)
    goto LABEL_43;
  v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v22)
  {
    v55 = v11;
    v56 = v6;
    v57 = v2;
    v6 = (id)(v21 & 0xC000000000000001);
    v11 = 4;
    while (1)
    {
      v23 = v6 ? (id)MEMORY[0x2494F30C8](v11 - 4, v21) : *(id *)(v21 + 8 * v11);
      v2 = v23;
      v24 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
        break;
      v25 = objc_msgSend(v23, sel_className, v55);
      if (v25)
      {
        v26 = v25;
        v27 = sub_243141114();
        v29 = v28;

        if (v29)
        {
          if (v27 == 0x6E65746E6F434B57 && v29 == 0xED00007765695674)
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
LABEL_40:
            sub_24312D084(v2);

LABEL_41:
            v6 = v56;
            v2 = v57;
            goto LABEL_45;
          }
          v31 = sub_243141288();
          swift_bridgeObjectRelease();
          if ((v31 & 1) != 0)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_40;
          }
        }
      }

      ++v11;
      if (v24 == v22)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_41;
      }
    }
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain_n();
    v22 = sub_243141264();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease_n();
LABEL_45:
  v49 = v59;
  if ((uint64_t)objc_msgSend(v62, sel_count) < 1)
  {
    swift_bridgeObjectRetain();
    v51 = (id)sub_243141108();
    swift_bridgeObjectRelease();
    objc_msgSend(v59, sel_setHtmlString_attachments_, v51, 0);
  }
  else
  {
    if (objc_msgSend(v59, sel_delegate))
    {
      type metadata accessor for NotesSiriSingleNoteHelper();
      if (swift_dynamicCastClass())
      {
        v50 = v62;
        sub_24312D96C();
        swift_unknownObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    v52 = (void *)sub_243141108();
    swift_bridgeObjectRelease();
    v51 = objc_msgSend(v62, sel_allObjects);
    if (!v51)
    {
      sub_243141144();
      v51 = (id)sub_243141138();
      swift_bridgeObjectRelease();
    }
    v49 = v59;
    objc_msgSend(v59, sel_setHtmlString_attachments_, v52, v51, v55);

  }
  result = objc_msgSend(v49, sel_webView);
  if (result)
  {
    v53 = result;
    v54 = objc_msgSend(result, sel_scrollView);

    objc_msgSend(v54, sel_setScrollEnabled_, 0);
    objc_msgSend(v49, sel_setInsideSiriSnippet_, 1);

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();

    return v49;
  }
LABEL_58:
  __break(1u);
  return result;
}

id sub_24312CCEC@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X2>, _BYTE *a3@<X3>, uint64_t *a4@<X8>)
{
  void *ObjCClassFromMetadata;
  void *v9;
  uint64_t v10;
  id result;

  sub_24312E204(0, &qword_257286670);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v9 = (void *)sub_243141108();
  v10 = (uint64_t)objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v9, a1);

  if (v10)
  {
    *a2 = objc_msgSend((id)v10, sel_isPasswordProtected);
    result = objc_msgSend((id)v10, sel_isUnsupported);
  }
  else
  {
    result = 0;
    *a2 = 0;
    v10 = 1;
  }
  *a3 = (_BYTE)result;
  *a4 = v10;
  return result;
}

void sub_24312CDCC(void *a1@<X1>, _BYTE *a2@<X2>, uint64_t *a3@<X3>, void **a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void **v31;

  v31 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_243140AFC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243140AF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24312E128((uint64_t)v10);
    v15 = 0;
    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  v16 = (void *)sub_243140AD8();
  v17 = objc_msgSend(a1, sel_ic_objectIDFromURL_, v16);

  if (!v17)
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v15 = 0;
    goto LABEL_16;
  }
  v18 = objc_msgSend(a1, sel_ic_existingObjectWithID_, v17);
  if (!v18)
  {
LABEL_9:

    goto LABEL_10;
  }
  v19 = v18;
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClass();
  if (!v20)
  {

    goto LABEL_9;
  }
  v15 = v20;
  *a2 = objc_msgSend(v20, sel_isPlainText);
  v21 = objc_msgSend(v15, sel_content);
  if (v21)
  {
    v22 = v21;
    v30 = sub_243141114();
    v24 = v23;

    v25 = v30;
  }
  else
  {
    v25 = 0;
    v24 = 0xE000000000000000;
  }
  *a3 = v25;
  a3[1] = v24;
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v15, sel_attachments);
  if (v26)
  {
    v27 = v26;
    sub_243141180();

    v28 = (id)sub_243141174();
    swift_bridgeObjectRelease();
  }
  else
  {
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF20]), sel_init);

  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v29 = *v31;
  *v31 = v28;

LABEL_16:
  *a5 = v15;
}

void sub_24312D084(void *a1)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;

  objc_msgSend(a1, sel_setUserInteractionEnabled_, 0);
  v2 = objc_msgSend(a1, sel_subviews);
  sub_24312E204(0, &qword_257286650);
  v3 = sub_243141144();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_243141264();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x2494F30C8](i, v3);
      else
        v6 = *(id *)(v3 + 8 * i + 32);
      v7 = v6;
      sub_24312D084();

    }
    goto LABEL_10;
  }
  __break(1u);
}

id sub_24312D19C(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat Height;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  id result;
  void *v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  char v44;
  CGRect v45;

  v6 = v5;
  if ((a2 & 1) != 0)
    *(double *)&a1 = 0.0;
  if ((a4 & 1) != 0)
    *(double *)&a3 = 0.0;
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = a5;
    v13 = objc_msgSend(v11, sel_textLayoutManager);
    if (v13)
    {
      v14 = v13;
      v15 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v15, sel_bounds);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v45.origin.x = v17;
      v45.origin.y = v19;
      v45.size.width = v21;
      v45.size.height = v23;
      Height = CGRectGetHeight(v45);
      v25 = Height + Height;
      v26 = *(double *)(v6 + 64);
      if (v26 == -1.0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
        sub_243141060();
        if (v44 == 1 && *(double *)&qword_257286520 != -1.0)
          goto LABEL_22;
        objc_msgSend(v11, sel_contentSize);
        objc_msgSend(v12, sel_systemLayoutSizeFittingSize_, *(double *)&a1);
        qword_257286520 = *(_QWORD *)&v27;
        if (v25 >= v27)
          goto LABEL_22;
        sub_24314106C();
        v28 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      }
      else
      {
        qword_257286520 = *(_QWORD *)(v6 + 64);
        if (v25 >= v26)
        {
LABEL_22:
          v42 = *(double *)&qword_257286520;
          v43 = *(double *)(v6 + 16);

          v39 = CGSizeMake(*(double *)&a1, v42 + v43);
          return *(id *)&v39;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
        sub_24314106C();
        v28 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      }
      v40 = v28;
      v41 = (void *)sub_243141108();
      objc_msgSend(v40, sel_postNotificationName_object_, v41, 0);

      goto LABEL_22;
    }

  }
  objc_opt_self();
  v29 = swift_dynamicCastObjCClass();
  if (!v29)
  {
    objc_msgSend(a5, sel_systemLayoutSizeFittingSize_, *(double *)&a1, *(double *)&a3);
    return *(id *)&v39;
  }
  v30 = (void *)v29;
  v31 = a5;
  result = objc_msgSend(v30, sel_webView);
  if (result)
  {
    v33 = result;
    v34 = objc_msgSend(result, sel_scrollView);

    objc_msgSend(v34, sel_contentSize);
    v36 = v35;

    objc_msgSend(v31, sel_systemLayoutSizeFittingSize_, *(double *)&a1, v36);
    v38 = v37;

    return (id)v38;
  }
  __break(1u);
  return result;
}

id sub_24312D510()
{
  return sub_24312C2C8();
}

id sub_24312D564(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  return sub_24312D19C(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_24312D5A4()
{
  sub_24312E168();
  return sub_243140E68();
}

uint64_t sub_24312D5F4()
{
  sub_24312E168();
  return sub_243140E14();
}

uint64_t sub_24312D644()
{
  return sub_243140FB8();
}

void sub_24312D65C()
{
  sub_24312E168();
  sub_243140E5C();
  __break(1u);
}

uint64_t sub_24312D680@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = (void *)sub_243141108();
    v8 = sub_24312DB10((uint64_t)v7);
    v9 = objc_msgSend(v8, sel_dataFileURL);
    if (v9)
    {
      v10 = v9;
      sub_243140AE4();

      v11 = sub_243140AFC();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
    }
    else
    {

      v14 = sub_243140AFC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
    }
    return sub_24312E1BC((uint64_t)v6, a2);
  }
  else
  {
    v12 = sub_243140AFC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a2, 1, 1, v12);
  }
}

void sub_24312D96C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v0 = sub_243140AB4();
  v7 = *(_QWORD *)(v0 - 8);
  v8 = v0;
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24312E204(0, &qword_257286688);
  v3 = (void *)MEMORY[0x2494F305C](MEMORY[0x24BEE4AF8]);
  sub_2431411C8();
  sub_243140AA8();
  while (v13)
  {
    sub_24312E1AC(&v12, &v11);
    sub_24312E204(0, &qword_257286690);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = v10;
      v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6DF40]), sel_initWithNoteAttachmentObject_, v10);
      objc_msgSend(v3, sel_ic_addNonNilObject_, v5);

    }
    sub_243140AA8();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v8);
  v6 = *(void **)(v9
                + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations);
  *(_QWORD *)(v9
            + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations) = v3;

}

id sub_24312DB10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id result;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = sub_243140AB4();
  v12 = *(_QWORD *)(v3 - 8);
  v13 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_retain(*(id *)(v1
                         + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations));
  sub_2431411E0();

  sub_243140AA8();
  while (v17)
  {
    sub_24312E1AC(&v16, &v15);
    sub_24312E204(0, &qword_257286680);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v7 = v14;
      result = objc_msgSend(v14, sel_contentID);
      if (!result)
      {
        __break(1u);
        return result;
      }
      v9 = result;
      v10 = objc_msgSend(result, sel_isEqual_, a1);

      if (v10)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v13);
        return v7;
      }

    }
    sub_243140AA8();
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v13);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6DF40]), sel_init);
}

id sub_24312DD40()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotesSiriSingleNoteHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NotesSiriSingleNoteHelper()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for NotesSiriTextEditorWrapper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotesSiriTextEditorWrapper(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();

}

uint64_t initializeWithCopy for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  v6 = *(void **)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v4 = *(void **)(a2 + 56);
  v5 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for NotesSiriTextEditorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v5 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriTextEditorWrapper(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesSiriTextEditorWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesSiriTextEditorWrapper()
{
  return &type metadata for NotesSiriTextEditorWrapper;
}

uint64_t sub_24312E044()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_24312E054()
{
  unint64_t result;

  result = qword_2572865D0;
  if (!qword_2572865D0)
  {
    result = MEMORY[0x2494F3464](&unk_2431417CC, &type metadata for NotesSiriTextEditorWrapper);
    atomic_store(result, (unint64_t *)&qword_2572865D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F344C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_24312E0D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_24312CCEC(*(_QWORD *)(v1 + 24), *(_BYTE **)(v1 + 32), *(_BYTE **)(v1 + 40), a1);
}

void sub_24312E0F4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_24312CDCC(*(void **)(v1 + 24), *(_BYTE **)(v1 + 32), *(uint64_t **)(v1 + 40), *(void ***)(v1 + 48), a1);
}

double CGRectMake()
{
  return 0.0;
}

uint64_t sub_24312E128(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24312E168()
{
  unint64_t result;

  result = qword_257286678;
  if (!qword_257286678)
  {
    result = MEMORY[0x2494F3464](&unk_24314181C, &type metadata for NotesSiriTextEditorWrapper);
    atomic_store(result, (unint64_t *)&qword_257286678);
  }
  return result;
}

_OWORD *sub_24312E1AC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24312E1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24312E204(uint64_t a1, unint64_t *a2)
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

double sub_24312E23C@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  char *v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  id v38;
  char v39;
  double result;
  char *v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v41 - v8;
  v10 = sub_243140AFC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v41 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v41 - v18;
  v46 = 0;
  sub_243141054();
  v45 = v48;
  sub_243140AF0();
  swift_bridgeObjectRelease();
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v20(v9, 1, v10) == 1)
  {
    sub_24312E128((uint64_t)v9);
LABEL_12:
    v25 = 0;
    v27 = 0xE000000000000000;
    goto LABEL_13;
  }
  v42 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v20;
  v43 = v14;
  v41 = v17;
  v44 = v7;
  v21 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v21(v19, v9, v10);
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_243140AD8();
  v24 = objc_msgSend(v22, sel_NotesAppIDForNoteMentionedInURL_, v23);

  if (!v24)
  {
    v28 = (void *)sub_243140AD8();
    v29 = objc_msgSend(v22, sel_isShowHTMLNoteURL_, v28);

    if (v29)
    {
      v30 = (void *)sub_243140AD8();
      v31 = objc_msgSend(v22, sel_objectIDURIRepresentationForHTMLNoteMentionedInURL_, v30);

      if (v31)
      {
        v32 = v43;
        sub_243140AE4();

        v33 = (uint64_t)v44;
        v21(v44, v32, v10);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v33, 0, 1, v10);
        if (v42(v33, 1, v10) != 1)
        {
          v34 = v41;
          v21(v41, (char *)v33, v10);
          v25 = sub_243140ACC();
          v27 = v35;
          v36 = *(void (**)(char *, uint64_t))(v11 + 8);
          v36(v34, v10);
          v36(v19, v10);
          goto LABEL_13;
        }
      }
      else
      {
        v33 = (uint64_t)v44;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v44, 1, 1, v10);
      }
      sub_24312E128(v33);
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
    goto LABEL_12;
  }
  v25 = sub_243141114();
  v27 = v26;

  (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
LABEL_13:
  v37 = v45;
  v38 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotesSiriSingleNoteHelper()), sel_init);
  qword_257286520 = 0xBFF0000000000000;
  v39 = v47;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v27;
  result = 28.0;
  *(_OWORD *)(a1 + 16) = xmmword_243141770;
  *(_BYTE *)(a1 + 32) = v39;
  *(_QWORD *)(a1 + 40) = v37;
  *(_QWORD *)(a1 + 48) = 0x4074800000000000;
  *(_QWORD *)(a1 + 56) = v38;
  *(double *)(a1 + 64) = a2;
  return result;
}

uint64_t NotesSiriListView.viewModels.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NotesSiriListView.init(noteIdentifier:headerText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[48];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286700);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend((id)objc_opt_self(), sel_startSharedContextWithOptions_, 66116);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286708);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2431418B0;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  NotesSiriListView.init(noteIdentifiers:modernManagedObjectContext:htmlManagedObjectContext:query:)(inited, 0, 0, a3, a4, (uint64_t)v12);
  v14 = type metadata accessor for NotesSiriListView();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
  {
    sub_243136140((uint64_t)v12, &qword_257286700);
    v16 = 1;
  }
  else
  {
    sub_24312EA08((uint64_t)v12, a5);
    v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a5, v16, 1, v14);
}

id NotesSiriListView.init(noteIdentifiers:modernManagedObjectContext:htmlManagedObjectContext:query:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id result;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a4;
  v31 = a6;
  v10 = type metadata accessor for NotesSiriListView();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v13 = MEMORY[0x24BEE4AF8];
  sub_2431410CC();
  v14 = (uint64_t *)((char *)v13 + *(int *)(v10 + 24));
  *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  swift_storeEnumTagMultiPayload();
  if (a2)
  {
    v15 = a2;
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_sharedContext);
    if (!v18
      || (v19 = v18,
          v15 = objc_msgSend(v18, sel_managedObjectContext),
          v19,
          !v15))
    {

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  if (a3)
  {
    v16 = a2;
    v17 = a3;
LABEL_10:
    swift_bridgeObjectRetain();
    v23 = v15;
    v24 = a3;
    v25 = v17;
    v26 = sub_243134444(a1, v25, v30, a5, v23);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *v13 = v26;
    v27 = v31;
    sub_243135550((uint64_t)v13, v31, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v27, 0, 1, v10);
    return (id)sub_243135594((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
  }
  v20 = (void *)objc_opt_self();
  v16 = a2;
  result = objc_msgSend(v20, sel_sharedContext);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v22 = result;
  v17 = objc_msgSend(result, sel_managedObjectContext);

  if (v17)
    goto LABEL_10;
  swift_bridgeObjectRelease();

LABEL_12:
  v28 = v31;
  swift_bridgeObjectRelease();
  sub_243135594((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v28, 1, 1, v10);
}

uint64_t type metadata accessor for NotesSiriListView()
{
  uint64_t result;

  result = qword_257286788;
  if (!qword_257286788)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24312EA08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSiriListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t NotesSiriListView.init(models:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v10;

  v4 = type metadata accessor for NotesSiriListView();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v7 = MEMORY[0x24BEE4AF8];
  sub_2431410CC();
  v8 = (_QWORD *)((char *)v7 + *(int *)(v4 + 24));
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRelease();
  *v7 = a1;
  sub_243135550((uint64_t)v7, a2, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  return sub_243135594((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
}

uint64_t NotesSiriListView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286718);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286720);
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_243141264();
    result = swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_3;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
LABEL_3:
  if ((v11 & 0xC000000000000001) != 0)
  {
    v12 = MEMORY[0x2494F30C8](0, v11);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(_QWORD *)(v11 + 32);
    swift_retain();
LABEL_6:
    sub_24312ED5C(v12, (uint64_t)v5);
    swift_release();
    v13 = sub_243141084();
    sub_24312F3D4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v13, v14, &qword_257286718, &qword_257286720);
    sub_243136140((uint64_t)v5, &qword_257286718);
    sub_243135DC4((uint64_t)v10, a1, &qword_257286720);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  __break(1u);
  return result;
}

uint64_t sub_24312ED5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  char v78;

  v3 = v2;
  v69 = a2;
  v5 = sub_243140EBC();
  v67 = *(_QWORD *)(v5 - 8);
  v68 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_243140DCC();
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v57 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for NotesSiriListView();
  v51 = *(_QWORD *)(v8 - 8);
  v52 = *(_QWORD *)(v51 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B30);
  v58 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572867F0);
  MEMORY[0x24BDAC7A8](v59);
  v54 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B38);
  v64 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v55 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286718);
  MEMORY[0x24BDAC7A8](v65);
  v60 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287120);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_243140B2C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v50 - v22;
  v24 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  swift_beginAccess();
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v25(v23, v24, v17);
  v26 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
  swift_beginAccess();
  v25(v21, v26, v17);
  sub_243133698((uint64_t)v16);
  v27 = sub_243140B50();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v16, 0, 1, v27);
  v28 = sub_24313E878((uint64_t)v23, (uint64_t)v21, (uint64_t)v16);
  v30 = v29;
  sub_243136140((uint64_t)v16, &qword_257287120);
  v31 = *(void (**)(char *, uint64_t))(v18 + 8);
  v31(v21, v17);
  v31(v23, v17);
  swift_bridgeObjectRelease();
  v72 = a1;
  v73 = v28;
  v74 = v30;
  v75 = xmmword_2431418C0;
  v76 = xmmword_2431418D0;
  v77 = 0x4018000000000000;
  v78 = 0;
  v32 = v50;
  sub_243135550(v3, v50, (uint64_t (*)(_QWORD))type metadata accessor for NotesSiriListView);
  v33 = (*(unsigned __int8 *)(v51 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = a1;
  sub_24312EA08(v32, v34 + v33);
  swift_retain_n();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286800);
  v36 = sub_243134F8C();
  v37 = v53;
  sub_243140FA0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v38 = v57;
  sub_243140DB4();
  v72 = v35;
  v73 = v36;
  swift_getOpaqueTypeConformance2();
  v39 = (uint64_t)v54;
  v40 = v56;
  sub_243140FAC();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v38, v63);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v40);
  v41 = v66;
  sub_243140EB0();
  v42 = sub_243134EF8();
  v43 = v55;
  v44 = v59;
  sub_243140FD0();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v41, v68);
  sub_243136140(v39, &qword_2572867F0);
  v72 = sub_24312F950(a1);
  v73 = v45;
  v70 = v44;
  v71 = v42;
  swift_getOpaqueTypeConformance2();
  sub_243135684();
  v46 = (uint64_t)v60;
  v47 = v61;
  sub_243140FC4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v43, v47);
  v72 = sub_243140BEC();
  v73 = v48;
  sub_243140CA0();
  swift_bridgeObjectRelease();
  return sub_243136140(v46, &qword_257286718);
}

__n128 sub_24312F3D4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
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
    sub_243141198();
    v28 = (void *)sub_243140ED4();
    sub_243140C28();

    v19 = a17;
  }
  sub_243140CC4();
  sub_243136270(v17, a9, a16);
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

uint64_t sub_24312F5A0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  const void *v13;
  const void *v14;
  uint64_t v15;
  void *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v14 = v13;
  v15 = a9;
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
    sub_243141198();
    v24 = (void *)sub_243140ED4();
    sub_243140C28();

    v15 = a9;
  }
  sub_243140CC4();
  memcpy((void *)v15, v14, 0x268uLL);
  *(_OWORD *)(v15 + 680) = v31;
  *(_OWORD *)(v15 + 696) = v32;
  *(_OWORD *)(v15 + 712) = v33;
  *(_OWORD *)(v15 + 616) = v27;
  *(_OWORD *)(v15 + 632) = v28;
  *(_OWORD *)(v15 + 648) = v29;
  *(_OWORD *)(v15 + 664) = v30;
  return sub_243135E58((uint64_t)v14);
}

uint64_t sub_24312F750@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  const void *v13;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

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
    sub_243141198();
    v23 = (void *)sub_243140ED4();
    sub_243140C28();

  }
  sub_243140CC4();
  memcpy(a9, v13, 0x160uLL);
  a9[26] = v29;
  a9[27] = v30;
  a9[28] = v31;
  a9[22] = v25;
  a9[23] = v26;
  a9[24] = v27;
  a9[25] = v28;
  return sub_243135FAC((uint64_t)v13);
}

double sub_24312F8F8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_24312F3D4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_257286B20, &qword_257286B28).n128_u64[0];
  return result;
}

uint64_t sub_24312F950(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  swift_bridgeObjectRetain();
  v2 = sub_243140B80();
  v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v5 = sub_243140B8C();
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = (uint64_t *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  v10 = *v8;
  v9 = v8[1];
  v11 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString + 8);
  v41 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  v13 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  v12 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet + 8);
  v42 = v2;
  v43 = v4;
  swift_bridgeObjectRetain();
  if (!v9)
  {
    swift_bridgeObjectRetain();
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v11)
      goto LABEL_12;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v14 = sub_243133AA8(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v16 = v14[2];
  v15 = v14[3];
  if (v16 >= v15 >> 1)
    v14 = sub_243133AA8((_QWORD *)(v15 > 1), v16 + 1, 1, v14);
  v14[2] = v16 + 1;
  v17 = &v14[2 * v16];
  v17[4] = v10;
  v17[5] = v9;
  if (v11)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_243133AA8(0, v14[2] + 1, 1, v14);
    v19 = v14[2];
    v18 = v14[3];
    if (v19 >= v18 >> 1)
      v14 = sub_243133AA8((_QWORD *)(v18 > 1), v19 + 1, 1, v14);
    v14[2] = v19 + 1;
    v20 = &v14[2 * v19];
    v20[4] = v41;
    v20[5] = v11;
  }
LABEL_12:
  if (v12)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_243133AA8(0, v14[2] + 1, 1, v14);
    v22 = v14[2];
    v21 = v14[3];
    if (v22 >= v21 >> 1)
      v14 = sub_243133AA8((_QWORD *)(v21 > 1), v22 + 1, 1, v14);
    v14[2] = v22 + 1;
    v23 = &v14[2 * v22];
    v23[4] = v13;
    v23[5] = v12;
  }
  if (v43)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_243133AA8(0, v14[2] + 1, 1, v14);
    v25 = v14[2];
    v24 = v14[3];
    if (v25 >= v24 >> 1)
      v14 = sub_243133AA8((_QWORD *)(v24 > 1), v25 + 1, 1, v14);
    v14[2] = v25 + 1;
    v26 = &v14[2 * v25];
    v26[4] = v42;
    v26[5] = v43;
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_243133AA8(0, v14[2] + 1, 1, v14);
    v28 = v14[2];
    v27 = v14[3];
    if (v28 >= v27 >> 1)
      v14 = sub_243133AA8((_QWORD *)(v27 > 1), v28 + 1, 1, v14);
    v14[2] = v28 + 1;
    v29 = &v14[2 * v28];
    v29[4] = v5;
    v29[5] = v7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286B40);
  swift_arrayDestroy();
  v30 = v14[2];
  if (v30)
  {
    v31 = v14 + 5;
    v32 = MEMORY[0x24BEE4AF8];
    do
    {
      v37 = *(v31 - 1);
      v36 = *v31;
      v38 = HIBYTE(*v31) & 0xF;
      if ((*v31 & 0x2000000000000000) == 0)
        v38 = v37 & 0xFFFFFFFFFFFFLL;
      if (v38)
      {
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_2431341F4(0, *(_QWORD *)(v32 + 16) + 1, 1);
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
          sub_2431341F4(v33 > 1, v34 + 1, 1);
        *(_QWORD *)(v32 + 16) = v34 + 1;
        v35 = v32 + 16 * v34;
        *(_QWORD *)(v35 + 32) = v37;
        *(_QWORD *)(v35 + 40) = v36;
      }
      v31 += 2;
      --v30;
    }
    while (v30);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286B48);
  sub_243136430(&qword_257286B50, &qword_257286B48, MEMORY[0x24BEE12B0]);
  v39 = sub_2431410FC();
  swift_release();
  return v39;
}

uint64_t sub_24312FE28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;

  v2 = sub_2431410F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_243140AFC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v11 = a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  v12 = (void *)sub_243140AD8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  objc_msgSend(v10, sel_setPunchOutUri_, v12);

  type metadata accessor for NotesSiriListView();
  sub_2431410C0();
  v13 = v10;
  sub_2431410E4();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24312FFB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[12];
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286988);
  MEMORY[0x24BDAC7A8](v19);
  v3 = (uint64_t *)&v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_24314103C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = sub_243141024();
  v8 = objc_msgSend((id)objc_opt_self(), sel_ICTintColor);
  v9 = MEMORY[0x2494F2E7C](v8);
  KeyPath = swift_getKeyPath();
  v17 = sub_243140EA4();
  v11 = sub_243140EF8();
  v12 = swift_getKeyPath();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF40B0], v4);
  v13 = swift_getKeyPath();
  (*(void (**)(char *, _BYTE *, uint64_t))(v5 + 16))((char *)v3 + *(int *)(v19 + 28), v7, v4);
  *v3 = v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A68);
  sub_243136270((uint64_t)v3, a1 + *(int *)(v14 + 36), &qword_257286988);
  *(_QWORD *)a1 = v18;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_QWORD *)(a1 + 16) = v9;
  *(_DWORD *)(a1 + 24) = v17;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_243136140((uint64_t)v3, &qword_257286988);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2431301E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[4];
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286850);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v20[-v8];
  sub_243141078();
  sub_243140C7C();
  v27 = v28;
  v26 = v29;
  v25 = v30;
  v24 = v31;
  v22 = v33;
  v23 = v32;
  *(_QWORD *)v9 = sub_243140D54();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286858);
  sub_2431303EC(a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  sub_243141078();
  sub_243140C7C();
  v11 = v34;
  v21 = v35;
  v12 = v36;
  v13 = v37;
  v14 = v38;
  v15 = v39;
  sub_243136270((uint64_t)v9, (uint64_t)v7, &qword_257286850);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = v27;
  *(_BYTE *)(a2 + 24) = v26;
  *(_QWORD *)(a2 + 32) = v25;
  *(_BYTE *)(a2 + 40) = v24;
  v16 = v22;
  *(_QWORD *)(a2 + 48) = v23;
  *(_QWORD *)(a2 + 56) = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286860);
  sub_243136270((uint64_t)v7, a2 + *(int *)(v17 + 48), &qword_257286850);
  v18 = a2 + *(int *)(v17 + 64);
  *(_QWORD *)v18 = 0;
  *(_BYTE *)(v18 + 8) = 1;
  *(_QWORD *)(v18 + 16) = v11;
  *(_BYTE *)(v18 + 24) = v21;
  *(_QWORD *)(v18 + 32) = v12;
  *(_BYTE *)(v18 + 40) = v13;
  *(_QWORD *)(v18 + 48) = v14;
  *(_QWORD *)(v18 + 56) = v15;
  sub_243136140((uint64_t)v9, &qword_257286850);
  return sub_243136140((uint64_t)v7, &qword_257286850);
}

uint64_t sub_2431303EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  uint64_t v66;
  unsigned __int8 v67;
  uint64_t v68;
  uint64_t v69;

  v63 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286868);
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v59 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286870);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v62 = (uint64_t)&v48 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v58 = (uint64_t)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v57 = (uint64_t)&v48 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v48 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286878);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286880);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v48 - v27;
  *(_QWORD *)v28 = sub_243140DF0();
  *((_QWORD *)v28 + 1) = 0x4010000000000000;
  v28[16] = 0;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286888);
  sub_2431309E8((uint64_t *)a1, (uint64_t)&v28[*(int *)(v29 + 44)]);
  v30 = *(_QWORD *)a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  sub_243136270(v30, (uint64_t)v16, &qword_257286668);
  v31 = sub_243140AFC();
  v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v16, 1, v31);
  sub_243136140((uint64_t)v16, &qword_257286668);
  if (v32 == 1)
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286890);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v22, 1, 1, v33);
  }
  else
  {
    v56 = sub_24314100C();
    sub_243141078();
    sub_243140C7C();
    v55 = v64;
    v54 = v65;
    v53 = v66;
    v52 = v67;
    v51 = v68;
    v50 = v69;
    *(_QWORD *)v8 = sub_243140DE4();
    *((_QWORD *)v8 + 1) = 0;
    v8[16] = 1;
    v49 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572868A0) + 44)];
    v34 = v57;
    sub_243136270(v30, v57, &qword_257286668);
    v35 = (_OWORD *)swift_allocObject();
    v36 = *(_OWORD *)(a1 + 16);
    v35[1] = *(_OWORD *)a1;
    v35[2] = v36;
    v37 = *(_OWORD *)(a1 + 48);
    v35[3] = *(_OWORD *)(a1 + 32);
    v35[4] = v37;
    sub_243136270(v34, v58, &qword_257286668);
    v38 = (_QWORD *)swift_allocObject();
    v38[2] = sub_2431352F8;
    v38[3] = v35;
    v38[4] = sub_243133444;
    v38[5] = 0;
    sub_243135338(a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572868A8);
    sub_2431359B4(&qword_2572868B0, &qword_2572868A8, (uint64_t (*)(void))sub_24313536C, (uint64_t (*)(void))sub_2431354EC);
    v39 = v59;
    sub_243140C58();
    sub_243136140(v34, &qword_257286668);
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v49, v39, v61);
    v40 = v62;
    sub_243135DC4((uint64_t)v8, v62, &qword_257286870);
    sub_243136270(v40, (uint64_t)v8, &qword_257286870);
    *(_QWORD *)v20 = 0;
    v20[8] = 1;
    v41 = v55;
    *((_QWORD *)v20 + 2) = v56;
    *((_QWORD *)v20 + 3) = v41;
    v20[32] = v54;
    *((_QWORD *)v20 + 5) = v53;
    v20[48] = v52;
    v42 = v50;
    *((_QWORD *)v20 + 7) = v51;
    *((_QWORD *)v20 + 8) = v42;
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286918);
    sub_243136270((uint64_t)v8, (uint64_t)&v20[*(int *)(v43 + 64)], &qword_257286870);
    swift_retain();
    sub_243136140(v40, &qword_257286870);
    sub_243136140((uint64_t)v8, &qword_257286870);
    swift_release();
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286890);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v20, 0, 1, v44);
    sub_243135DC4((uint64_t)v20, (uint64_t)v22, &qword_257286878);
  }
  sub_243136270((uint64_t)v28, (uint64_t)v26, &qword_257286880);
  sub_243136270((uint64_t)v22, (uint64_t)v20, &qword_257286878);
  v45 = v63;
  sub_243136270((uint64_t)v26, v63, &qword_257286880);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286898);
  sub_243136270((uint64_t)v20, v45 + *(int *)(v46 + 48), &qword_257286878);
  sub_243136140((uint64_t)v22, &qword_257286878);
  sub_243136140((uint64_t)v28, &qword_257286880);
  sub_243136140((uint64_t)v20, &qword_257286878);
  return sub_243136140((uint64_t)v26, &qword_257286880);
}

uint64_t sub_2431309E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286950);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286958);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286960);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v27 - v20;
  *(_QWORD *)v21 = sub_243140D54();
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 0;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286968);
  sub_243130C88(a1, (uint64_t)&v21[*(int *)(v22 + 44)]);
  *(_QWORD *)v15 = sub_243140D54();
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 0;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286970);
  sub_243131D5C(a1, (uint64_t)&v15[*(int *)(v23 + 44)]);
  *(_QWORD *)v9 = sub_243140D54();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286978);
  sub_2431325E0((uint64_t)a1, (uint64_t)&v9[*(int *)(v24 + 44)]);
  sub_243136270((uint64_t)v21, (uint64_t)v19, &qword_257286960);
  sub_243136270((uint64_t)v15, (uint64_t)v13, &qword_257286958);
  sub_243136270((uint64_t)v9, (uint64_t)v7, &qword_257286950);
  sub_243136270((uint64_t)v19, a2, &qword_257286960);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286980);
  sub_243136270((uint64_t)v13, a2 + *(int *)(v25 + 48), &qword_257286958);
  sub_243136270((uint64_t)v7, a2 + *(int *)(v25 + 64), &qword_257286950);
  sub_243136140((uint64_t)v9, &qword_257286950);
  sub_243136140((uint64_t)v15, &qword_257286958);
  sub_243136140((uint64_t)v21, &qword_257286960);
  sub_243136140((uint64_t)v7, &qword_257286950);
  sub_243136140((uint64_t)v13, &qword_257286958);
  return sub_243136140((uint64_t)v19, &qword_257286960);
}

uint64_t sub_243130C88@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD v28[2];
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v27 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A40);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A48);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  *(_QWORD *)v5 = sub_243140D54();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A50);
  sub_243130EE8(a1, (uint64_t)&v5[*(int *)(v12 + 44)]);
  sub_243141078();
  sub_243140C7C();
  sub_243136270((uint64_t)v5, (uint64_t)v9, &qword_257286A40);
  v13 = &v9[*(int *)(v6 + 36)];
  v14 = v35;
  *(_OWORD *)v13 = v34;
  *((_OWORD *)v13 + 1) = v14;
  *((_OWORD *)v13 + 2) = v36;
  sub_243136140((uint64_t)v5, &qword_257286A40);
  v26 = v11;
  sub_243135DC4((uint64_t)v9, (uint64_t)v11, &qword_257286A48);
  sub_243131A74((uint64_t)v28);
  v15 = v28[0];
  v16 = v28[1];
  v17 = v29;
  v18 = v30;
  v19 = v31;
  v25 = v32;
  v20 = v33;
  v21 = sub_243140DD8();
  sub_243136270((uint64_t)v11, (uint64_t)v9, &qword_257286A48);
  v22 = v27;
  sub_243136270((uint64_t)v9, v27, &qword_257286A48);
  v23 = v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257286A58) + 48);
  *(_QWORD *)v23 = v15;
  *(_QWORD *)(v23 + 8) = v16;
  *(_BYTE *)(v23 + 16) = v17;
  *(_QWORD *)(v23 + 24) = v18;
  *(_QWORD *)(v23 + 32) = v19;
  *(_QWORD *)(v23 + 40) = v25;
  *(_BYTE *)(v23 + 48) = v20;
  *(_QWORD *)(v23 + 56) = v21;
  *(_QWORD *)(v23 + 64) = sub_243131D38;
  *(_QWORD *)(v23 + 72) = 0;
  sub_243135664(v15, v16, v17);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243136140((uint64_t)v26, &qword_257286A48);
  sub_243135674(v15, v16, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_243136140((uint64_t)v9, &qword_257286A48);
}

uint64_t sub_243130EE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;

  v97 = a2;
  v85 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2572869D8);
  MEMORY[0x24BDAC7A8](v85);
  v84 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869E0);
  v4 = MEMORY[0x24BDAC7A8](v78);
  v76 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v77 = (uint64_t)&v75 - v6;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A60);
  MEMORY[0x24BDAC7A8](v79);
  v81 = (uint64_t)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A68);
  MEMORY[0x24BDAC7A8](v80);
  v83 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A70);
  MEMORY[0x24BDAC7A8](v92);
  v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A78);
  MEMORY[0x24BDAC7A8](v94);
  v96 = (char **)((char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A80);
  MEMORY[0x24BDAC7A8](v90);
  v91 = (uint64_t)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A88);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A90);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v75 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v75 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v75 - v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286A98);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286988);
  MEMORY[0x24BDAC7A8](v86);
  v30 = (uint64_t *)((char *)&v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  v31 = sub_24314103C();
  v88 = *(_QWORD *)(v31 - 8);
  v89 = v31;
  MEMORY[0x24BDAC7A8](v31);
  v87 = (char *)&v75 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286AA0);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v75 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = *a1;
  if (*(_BYTE *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) == 1)
  {
    v83 = v20;
    v84 = (char *)v26;
    v85 = v28;
    v38 = *(_BYTE *)(v37 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) == 1;
    v82 = v34;
    v75 = v36;
    if (v38)
    {
      v83 = (char *)sub_243141024();
      LODWORD(v81) = sub_243140EA4();
      v39 = sub_243140EF8();
      KeyPath = swift_getKeyPath();
      v42 = v87;
      v41 = v88;
      v43 = v89;
      (*(void (**)(char *, _QWORD, uint64_t))(v88 + 104))(v87, *MEMORY[0x24BDF40B0], v89);
      v44 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))((char *)v30 + *(int *)(v86 + 28), v42, v43);
      *v30 = v44;
      sub_243136270((uint64_t)v30, (uint64_t)&v23[*(int *)(v14 + 36)], &qword_257286988);
      *(_QWORD *)v23 = v83;
      *((_DWORD *)v23 + 2) = v81;
      *((_QWORD *)v23 + 2) = KeyPath;
      *((_QWORD *)v23 + 3) = v39;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_243136140((uint64_t)v30, &qword_257286988);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
      swift_release();
      swift_release();
      swift_release();
      sub_243135DC4((uint64_t)v23, (uint64_t)v25, &qword_257286A90);
    }
    else
    {
      v81 = sub_243141024();
      LODWORD(v80) = sub_243140EA4();
      v50 = sub_243140EF8();
      v51 = swift_getKeyPath();
      v53 = v87;
      v52 = v88;
      v54 = v89;
      (*(void (**)(char *, _QWORD, uint64_t))(v88 + 104))(v87, *MEMORY[0x24BDF40B0], v89);
      v55 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))((char *)v30 + *(int *)(v86 + 28), v53, v54);
      *v30 = v55;
      sub_243136270((uint64_t)v30, (uint64_t)&v17[*(int *)(v14 + 36)], &qword_257286988);
      *(_QWORD *)v17 = v81;
      *((_DWORD *)v17 + 2) = v80;
      *((_QWORD *)v17 + 2) = v51;
      *((_QWORD *)v17 + 3) = v50;
      swift_retain();
      swift_retain();
      swift_retain();
      sub_243136140((uint64_t)v30, &qword_257286988);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
      swift_release();
      swift_release();
      swift_release();
      v25 = v83;
      sub_243135DC4((uint64_t)v17, (uint64_t)v83, &qword_257286A90);
    }
    sub_243136270((uint64_t)v25, (uint64_t)v85, &qword_257286A90);
    swift_storeEnumTagMultiPayload();
    sub_243135A88();
    v56 = (uint64_t)v75;
    sub_243140E80();
    v57 = v96;
    sub_243136140((uint64_t)v25, &qword_257286A90);
    v58 = &qword_257286AA0;
    sub_243136270(v56, v91, &qword_257286AA0);
    swift_storeEnumTagMultiPayload();
    sub_243135A24();
    sub_243135B90();
    v59 = (uint64_t)v93;
    sub_243140E80();
    sub_243136270(v59, (uint64_t)v57, &qword_257286A88);
    swift_storeEnumTagMultiPayload();
    sub_2431359B4(&qword_257286AA8, &qword_257286A88, (uint64_t (*)(void))sub_243135A24, sub_243135B90);
    sub_243140E80();
    sub_243136140(v59, &qword_257286A88);
    v60 = v56;
  }
  else
  {
    v46 = (uint64_t)v83;
    v45 = v84;
    v47 = (uint64_t)v85;
    v75 = v10;
    if (*(_BYTE *)(v37 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) != 1)
    {
      v61 = v96;
      *v96 = 0;
      *((_BYTE *)v61 + 8) = 1;
      swift_storeEnumTagMultiPayload();
      sub_2431359B4(&qword_257286AA8, &qword_257286A88, (uint64_t (*)(void))sub_243135A24, sub_243135B90);
      return sub_243140E80();
    }
    v82 = v34;
    if (*(_BYTE *)(v37 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) == 1)
    {
      sub_24312FFB4((uint64_t)v83);
      v48 = &qword_257286A68;
      sub_243136270(v46, v81, &qword_257286A68);
    }
    else
    {
      v63 = sub_243141024();
      LODWORD(v83) = sub_243140EA4();
      v65 = v87;
      v64 = v88;
      v66 = v89;
      (*(void (**)(char *, _QWORD, uint64_t))(v88 + 104))(v87, *MEMORY[0x24BDF40B0], v89);
      v67 = swift_getKeyPath();
      (*(void (**)(char *, char *, uint64_t))(v64 + 16))((char *)v30 + *(int *)(v86 + 28), v65, v66);
      *v30 = v67;
      v68 = (uint64_t)v45;
      sub_243136270((uint64_t)v30, (uint64_t)&v45[*(int *)(v47 + 36)], &qword_257286988);
      *(_QWORD *)v45 = v63;
      *((_DWORD *)v45 + 2) = (_DWORD)v83;
      swift_retain();
      sub_243136140((uint64_t)v30, &qword_257286988);
      (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v66);
      swift_release();
      v69 = sub_243140EF8();
      v70 = swift_getKeyPath();
      v71 = v76;
      sub_243136270(v68, v76, &qword_2572869D8);
      v72 = (uint64_t *)(v71 + *(int *)(v78 + 36));
      *v72 = v70;
      v72[1] = v69;
      sub_243136140(v68, &qword_2572869D8);
      v48 = &qword_2572869E0;
      v73 = v71;
      v46 = v77;
      sub_243135DC4(v73, v77, &qword_2572869E0);
      sub_243136270(v46, v81, &qword_2572869E0);
    }
    swift_storeEnumTagMultiPayload();
    sub_243135BB4();
    sub_2431357A4();
    v49 = (uint64_t)v75;
    sub_243140E80();
    sub_243136140(v46, v48);
    v58 = &qword_257286A70;
    sub_243136270(v49, v91, &qword_257286A70);
    swift_storeEnumTagMultiPayload();
    sub_243135A24();
    sub_243135B90();
    v74 = (uint64_t)v93;
    sub_243140E80();
    sub_243136270(v74, (uint64_t)v96, &qword_257286A88);
    swift_storeEnumTagMultiPayload();
    sub_2431359B4(&qword_257286AA8, &qword_257286A88, (uint64_t (*)(void))sub_243135A24, sub_243135B90);
    sub_243140E80();
    sub_243136140(v74, &qword_257286A88);
    v60 = v49;
  }
  return sub_243136140(v60, v58);
}

uint64_t sub_243131A74@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t (*v40)(_BYTE *, uint64_t);
  uint64_t v41;
  _BYTE v42[12];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286E30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v42[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_243140A84();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v42[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v42[-v11];
  v13 = *v1;
  v14 = *v1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  swift_beginAccess();
  sub_243136270(v14, (uint64_t)v5, &qword_257286E30);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_243136140((uint64_t)v5, &qword_257286E30);
    v15 = (uint64_t *)(v13 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
    swift_beginAccess();
    v16 = *v15;
    v17 = v15[1];
    v46 = v16;
    v47 = v17;
    sub_243135684();
    swift_bridgeObjectRetain();
    v18 = sub_243140F64();
    v20 = v19;
    v22 = v21 & 1;
    sub_243140F1C();
    v23 = sub_243140F40();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    swift_release();
    sub_243135674(v18, v20, v22);
    swift_bridgeObjectRelease();
    result = swift_getKeyPath();
    KeyPath = result;
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v12, v5, v6);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
    v32 = sub_243140F58();
    v34 = v33;
    v36 = v35 & 1;
    sub_243140F1C();
    v44 = sub_243140F40();
    v45 = v37;
    v43 = v38;
    v29 = v39;
    swift_release();
    sub_243135674(v32, v34, v36);
    v27 = v43;
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v40 = *(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8);
    v41 = v6;
    v23 = v44;
    v25 = v45;
    result = v40(v12, v41);
  }
  *(_QWORD *)a1 = v23;
  *(_QWORD *)(a1 + 8) = v25;
  *(_BYTE *)(a1 + 16) = v27 & 1;
  *(_QWORD *)(a1 + 24) = v29;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_243131D38()
{
  uint64_t v0;

  v0 = sub_243140DF0();
  return MEMORY[0x2494F2B10](v0);
}

uint64_t sub_243131D5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v30[4];
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v38 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869B0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v30[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869B8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v30[-v10];
  *(_QWORD *)v5 = sub_243140D54();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869C0);
  sub_24313204C(a1, (uint64_t)&v5[*(int *)(v12 + 44)]);
  sub_243141078();
  sub_243140C7C();
  sub_243136270((uint64_t)v5, (uint64_t)v9, &qword_2572869B0);
  v13 = &v9[*(int *)(v6 + 36)];
  v14 = (uint64_t)v9;
  v15 = v48;
  *v13 = v47;
  v13[1] = v15;
  v13[2] = v49;
  sub_243136140((uint64_t)v5, &qword_2572869B0);
  v16 = (uint64_t)v11;
  v36 = v11;
  sub_243135DC4((uint64_t)v9, (uint64_t)v11, &qword_2572869B8);
  v35 = sub_243140D48();
  sub_2431329E8(a1, (uint64_t)v39);
  v17 = v39[1];
  v18 = v40;
  v19 = v41;
  v33 = v39[0];
  v34 = v42;
  v20 = v44;
  v32 = v43;
  v21 = v45;
  v22 = v46;
  v31 = sub_243140EA4();
  KeyPath = swift_getKeyPath();
  v37 = v14;
  sub_243136270(v16, v14, &qword_2572869B8);
  v24 = v38;
  sub_243136270(v14, v38, &qword_2572869B8);
  v25 = v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572869C8) + 48);
  v26 = v34;
  *(_QWORD *)v25 = v35;
  *(_QWORD *)(v25 + 8) = 0;
  *(_BYTE *)(v25 + 16) = 1;
  v27 = v33;
  *(_QWORD *)(v25 + 24) = v33;
  *(_QWORD *)(v25 + 32) = v17;
  *(_BYTE *)(v25 + 40) = v18;
  *(_QWORD *)(v25 + 48) = v19;
  *(_QWORD *)(v25 + 56) = v26;
  v28 = v32;
  *(_QWORD *)(v25 + 64) = v32;
  *(_QWORD *)(v25 + 72) = v20;
  *(_QWORD *)(v25 + 80) = v21;
  *(_BYTE *)(v25 + 88) = v22;
  *(_DWORD *)(v25 + 92) = v31;
  *(_QWORD *)(v25 + 96) = KeyPath;
  *(_QWORD *)(v25 + 104) = 1;
  *(_BYTE *)(v25 + 112) = 0;
  sub_243135664(v27, v17, v18);
  swift_bridgeObjectRetain();
  sub_243135724(v26, v28, v20, v21, v22);
  swift_retain();
  sub_243136140((uint64_t)v36, &qword_2572869B8);
  sub_243135674(v27, v17, v18);
  swift_bridgeObjectRelease();
  sub_243135764(v26, v28, v20, v21, v22);
  swift_release();
  return sub_243136140(v37, &qword_2572869B8);
}

uint64_t sub_24313204C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  __int128 v33;
  uint64_t v34;
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
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v45 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286990);
  MEMORY[0x24BDAC7A8](v37);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286998);
  v5 = MEMORY[0x24BDAC7A8](v44);
  v38 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v39 = (uint64_t)&v36 - v7;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869D0);
  MEMORY[0x24BDAC7A8](v42);
  v43 = (uint64_t)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286988);
  MEMORY[0x24BDAC7A8](v40);
  v10 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_24314103C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869D8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572869E0);
  v18 = MEMORY[0x24BDAC7A8](v41);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  if (*(_BYTE *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) == 1
    && *(_BYTE *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) == 1)
  {
    v22 = (char *)&v36 - v21;
    v23 = sub_243141024();
    LODWORD(v39) = sub_243140EA4();
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDF40B0], v11);
    KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)v10 + *(int *)(v40 + 28), v14, v11);
    *v10 = KeyPath;
    sub_243136270((uint64_t)v10, (uint64_t)&v17[*(int *)(v15 + 36)], &qword_257286988);
    *(_QWORD *)v17 = v23;
    *((_DWORD *)v17 + 2) = v39;
    swift_retain();
    sub_243136140((uint64_t)v10, &qword_257286988);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    swift_release();
    v25 = sub_243140EF8();
    v26 = swift_getKeyPath();
    sub_243136270((uint64_t)v17, (uint64_t)v20, &qword_2572869D8);
    v27 = (uint64_t *)&v20[*(int *)(v41 + 36)];
    *v27 = v26;
    v27[1] = v25;
    sub_243136140((uint64_t)v17, &qword_2572869D8);
    v28 = &qword_2572869E0;
    sub_243135DC4((uint64_t)v20, (uint64_t)v22, &qword_2572869E0);
    sub_243136270((uint64_t)v22, v43, &qword_2572869E0);
    swift_storeEnumTagMultiPayload();
    sub_2431357A4();
    sub_243136344(&qword_257286A30, &qword_257286998, (uint64_t (*)(void))sub_243135930, MEMORY[0x24BDEBEE0]);
    sub_243140E80();
    v29 = (uint64_t)v22;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDF40B0], v11);
    v30 = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)v10 + *(int *)(v40 + 28), v14, v11);
    *v10 = v30;
    sub_243136270((uint64_t)v10, (uint64_t)&v4[*(int *)(v37 + 36)], &qword_257286988);
    *(_QWORD *)v4 = 0;
    v4[8] = 1;
    sub_243136140((uint64_t)v10, &qword_257286988);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_243141078();
    sub_243140C7C();
    v31 = v38;
    sub_243136270((uint64_t)v4, v38, &qword_257286990);
    v32 = (_OWORD *)(v31 + *(int *)(v44 + 36));
    v33 = v47;
    *v32 = v46;
    v32[1] = v33;
    v32[2] = v48;
    sub_243136140((uint64_t)v4, &qword_257286990);
    v28 = &qword_257286998;
    v34 = v39;
    sub_243135DC4(v31, v39, &qword_257286998);
    sub_243136270(v34, v43, &qword_257286998);
    swift_storeEnumTagMultiPayload();
    sub_2431357A4();
    sub_243136344(&qword_257286A30, &qword_257286998, (uint64_t (*)(void))sub_243135930, MEMORY[0x24BDEBEE0]);
    sub_243140E80();
    v29 = v34;
  }
  return sub_243136140(v29, v28);
}

uint64_t sub_2431325E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  _OWORD *v19;
  __int128 v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v32[12];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _QWORD v41[2];
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v38 = a1;
  v39 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286988);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)&v32[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_24314103C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286990);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v32[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286998);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v40 = &v32[-v16];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDF40B0], v5);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _BYTE *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v2 + 28), v8, v5);
  *v4 = KeyPath;
  sub_243136270((uint64_t)v4, (uint64_t)&v11[*(int *)(v9 + 36)], &qword_257286988);
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  sub_243136140((uint64_t)v4, &qword_257286988);
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  sub_243141078();
  sub_243140C7C();
  v18 = (uint64_t)v15;
  sub_243136270((uint64_t)v11, (uint64_t)v15, &qword_257286990);
  v19 = &v15[*(int *)(v12 + 36)];
  v20 = v49;
  *v19 = v48;
  v19[1] = v20;
  v19[2] = v50;
  sub_243136140((uint64_t)v11, &qword_257286990);
  v21 = v40;
  sub_243135DC4((uint64_t)v15, (uint64_t)v40, &qword_257286998);
  swift_bridgeObjectRetain();
  v36 = sub_243140D48();
  sub_243132E48((uint64_t)v41);
  v22 = v41[0];
  v23 = v41[1];
  LOBYTE(v15) = v42;
  v24 = v43;
  v34 = v45;
  v35 = v44;
  LOBYTE(v11) = v46;
  v38 = v47;
  v25 = sub_243140EF8();
  v26 = swift_getKeyPath();
  v33 = sub_243140EA4();
  swift_bridgeObjectRelease();
  v37 = v18;
  sub_243136270((uint64_t)v21, v18, &qword_257286998);
  v27 = v39;
  sub_243136270(v18, v39, &qword_257286998);
  v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572869A0) + 48);
  v29 = v35;
  *(_QWORD *)v28 = v36;
  *(_QWORD *)(v28 + 8) = 0;
  *(_BYTE *)(v28 + 16) = 1;
  *(_QWORD *)(v28 + 24) = v22;
  *(_QWORD *)(v28 + 32) = v23;
  *(_BYTE *)(v28 + 40) = (_BYTE)v15;
  *(_QWORD *)(v28 + 48) = v24;
  *(_QWORD *)(v28 + 56) = v29;
  v30 = v34;
  *(_QWORD *)(v28 + 64) = v34;
  *(_BYTE *)(v28 + 72) = (_BYTE)v11;
  *(_QWORD *)(v28 + 80) = v38;
  *(_QWORD *)(v28 + 88) = v26;
  *(_QWORD *)(v28 + 96) = v25;
  *(_DWORD *)(v28 + 104) = v33;
  sub_243135664(v22, v23, (char)v15);
  swift_bridgeObjectRetain();
  sub_243135664(v29, v30, (char)v11);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_243136140((uint64_t)v40, &qword_257286998);
  sub_243135674(v22, v23, (char)v15);
  swift_bridgeObjectRelease();
  sub_243135674(v29, v30, (char)v11);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_243136140(v37, &qword_257286998);
}

uint64_t sub_2431329E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286E30);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_243140A84();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v66 = (char *)&v62 - v11;
  v12 = a1[2];
  v76 = a1[1];
  v77 = v12;
  v13 = sub_243135684();
  swift_bridgeObjectRetain();
  v64 = v13;
  v14 = sub_243140F64();
  v16 = v15;
  v18 = v17 & 1;
  sub_243140EF8();
  v19 = sub_243140F40();
  v68 = v20;
  v69 = v19;
  v67 = v21;
  v70 = v22;
  swift_release();
  sub_243135674(v14, v16, v18);
  swift_bridgeObjectRelease();
  v23 = *a1;
  v24 = *a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
  swift_beginAccess();
  sub_243136270(v24, (uint64_t)v6, &qword_257286E30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_243136140((uint64_t)v6, &qword_257286E30);
    v25 = *(_QWORD *)(v23 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet + 8);
    if (v25)
    {
      v76 = *(_QWORD *)(v23 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
      v77 = v25;
      swift_bridgeObjectRetain();
      v26 = sub_243140F64();
      v28 = v27;
      v30 = v29 & 1;
      sub_243140EF8();
      v31 = sub_243140F40();
      v33 = v32;
      v35 = v34;
      v37 = v36;
      swift_release();
      sub_243135674(v26, v28, v30);
      swift_bridgeObjectRelease();
      v71 = v31;
      v72 = v33;
      v73 = v35 & 1;
      v74 = v37;
      v75 = 1;
      sub_243140E80();
      v38 = v76;
      v39 = v77;
      v40 = v78;
      v41 = v79;
      v42 = v80;
    }
    else
    {
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = -1;
    }
  }
  else
  {
    v63 = v8;
    v43 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v44 = v66;
    v62 = v7;
    v43(v66, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v65, v44, v7);
    v45 = sub_243140F58();
    v47 = v46;
    v49 = v48 & 1;
    sub_243140EF8();
    v50 = sub_243140F40();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    swift_release();
    sub_243135674(v45, v47, v49);
    swift_bridgeObjectRelease();
    v71 = v50;
    v72 = v52;
    v73 = v54 & 1;
    v74 = v56;
    v75 = 0;
    sub_243140E80();
    v38 = v76;
    v39 = v77;
    v40 = v78;
    v41 = v79;
    v42 = v80;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v62);
  }
  v57 = v67;
  v58 = v67 & 1;
  v60 = v68;
  v59 = v69;
  *(_QWORD *)a2 = v69;
  *(_QWORD *)(a2 + 8) = v60;
  *(_BYTE *)(a2 + 16) = v57 & 1;
  *(_QWORD *)(a2 + 24) = v70;
  *(_QWORD *)(a2 + 32) = v38;
  *(_QWORD *)(a2 + 40) = v39;
  *(_QWORD *)(a2 + 48) = v40;
  *(_QWORD *)(a2 + 56) = v41;
  *(_BYTE *)(a2 + 64) = v42;
  sub_243135664(v59, v60, v57 & 1);
  swift_bridgeObjectRetain();
  sub_243135724(v38, v39, v40, v41, v42);
  sub_243135764(v38, v39, v40, v41, v42);
  sub_243135674(v59, v60, v58);
  return swift_bridgeObjectRelease();
}

uint64_t sub_243132E48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  sub_243141024();
  v2 = sub_243140F70();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_243140BA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_243135684();
  v9 = sub_243140F64();
  v11 = v10;
  v13 = v12 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v12 & 1;
  *(_QWORD *)(a1 + 56) = v14;
  sub_243135664(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_243135664(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_243135674(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_243135674(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_243132FC8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void);
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v48 = a1;
  v51 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286928);
  MEMORY[0x24BDAC7A8](v2);
  v50 = (uint64_t)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_243140CB8();
  MEMORY[0x24BDAC7A8](v49);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_243141030();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286930);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572868E0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572868D0);
  MEMORY[0x24BDAC7A8](v47);
  v46 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
  sub_243141048();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_243141018();
  swift_release();
  v18 = v48;
  sub_243141078();
  sub_243140C7C();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  v19 = &v16[*(int *)(v14 + 36)];
  v20 = v53;
  *(_OWORD *)v19 = v52;
  *((_OWORD *)v19 + 1) = v20;
  *((_OWORD *)v19 + 2) = v54;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v21 = *(_QWORD *)(v18 + 56);
  v22 = v49;
  v23 = &v5[*(int *)(v49 + 20)];
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_243140D9C();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104);
  v26(v23, v24, v25);
  *(_QWORD *)v5 = v21;
  *((_QWORD *)v5 + 1) = v21;
  v27 = (uint64_t)v46;
  v28 = (uint64_t)&v46[*(int *)(v47 + 36)];
  v29 = MEMORY[0x24BDED998];
  sub_243135550((uint64_t)v5, v28, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572868F0) + 36)) = 256;
  sub_243136270((uint64_t)v16, v27, &qword_2572868E0);
  sub_243135594((uint64_t)v5, (uint64_t (*)(_QWORD))v29);
  sub_243136140((uint64_t)v16, &qword_2572868E0);
  v26(&v5[*(int *)(v22 + 20)], v24, v25);
  *(_QWORD *)v5 = v21;
  *((_QWORD *)v5 + 1) = v21;
  LODWORD(v16) = sub_243140E8C();
  sub_243140C70();
  v30 = v50;
  sub_243135550((uint64_t)v5, v50, (uint64_t (*)(_QWORD))v29);
  v31 = v30 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257286938) + 36);
  v32 = v56;
  *(_OWORD *)v31 = v55;
  *(_OWORD *)(v31 + 16) = v32;
  *(_QWORD *)(v31 + 32) = v57;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286940);
  *(_DWORD *)(v30 + *(int *)(v33 + 52)) = (_DWORD)v16;
  *(_WORD *)(v30 + *(int *)(v33 + 56)) = 256;
  v34 = sub_243141078();
  v36 = v35;
  v37 = (uint64_t *)(v30 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257286948) + 36));
  *v37 = v34;
  v37[1] = v36;
  sub_243135594((uint64_t)v5, (uint64_t (*)(_QWORD))v29);
  v38 = sub_243141078();
  v40 = v39;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572868C0);
  v42 = v51;
  v43 = v51 + *(int *)(v41 + 36);
  sub_243136270(v30, v43, &qword_257286928);
  v44 = (uint64_t *)(v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257286900) + 36));
  *v44 = v38;
  v44[1] = v40;
  sub_243136270(v27, v42, &qword_2572868D0);
  sub_243136140(v30, &qword_257286928);
  return sub_243136140(v27, &qword_2572868D0);
}

double sub_243133444@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  __int128 v8;

  v2 = sub_24314100C();
  sub_243141078();
  sub_243140C7C();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  result = *(double *)&v8;
  *(_OWORD *)(a1 + 40) = v8;
  return result;
}

uint64_t sub_2431334BC@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _OWORD v17[4];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286830);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286838);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1[1];
  v17[0] = *v1;
  v17[1] = v9;
  v10 = v1[3];
  v17[2] = v1[2];
  v17[3] = v10;
  *(_QWORD *)v5 = sub_243140DF0();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286840);
  sub_2431301E0((uint64_t)v17, (uint64_t)&v5[*(int *)(v11 + 44)]);
  v12 = sub_243141084();
  sub_24312F3D4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1, v12, v13, &qword_257286830, &qword_257286838);
  sub_243136140((uint64_t)v5, &qword_257286830);
  v14 = sub_243140EEC();
  sub_243136270((uint64_t)v8, a1, &qword_257286838);
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257286848) + 36);
  *(_BYTE *)v15 = v14;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  *(_BYTE *)(v15 + 40) = 1;
  return sub_243136140((uint64_t)v8, &qword_257286838);
}

uint64_t sub_243133654()
{
  return sub_243140D0C();
}

uint64_t sub_243133674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_243134378(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDCEEA8], MEMORY[0x24BDEE3D8]);
}

uint64_t sub_243133698@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_243140D3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243136270(v2, (uint64_t)v10, &qword_257286710);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_243140B50();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_243141198();
    v14 = sub_243140ED4();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_243133BB4(0x656C61636F4CLL, 0xE600000000000000, &v20);
      sub_2431411F8();
      _os_log_impl(&dword_24312A000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494F34F4](v18, -1, -1);
      MEMORY[0x2494F34F4](v16, -1, -1);
    }

    sub_243140D30();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2431338CC@<X0>(void (*a1)(uint64_t)@<X1>, void (*a2)(_QWORD *__return_ptr)@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[2];
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;

  v18 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286920);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572868C0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_243140C94();
  if (v11)
  {
    a1(v11);
    sub_243136270((uint64_t)v10, (uint64_t)v7, &qword_2572868C0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286910);
    sub_24313536C();
    sub_2431354EC();
    sub_243140E80();
    swift_release();
    return sub_243136140((uint64_t)v10, &qword_2572868C0);
  }
  else
  {
    a2(v19);
    v13 = v19[1];
    v14 = v20;
    v15 = v21;
    v16 = v22;
    v17 = v23;
    *(_QWORD *)v7 = v19[0];
    *((_QWORD *)v7 + 1) = v13;
    v7[16] = v14;
    *((_QWORD *)v7 + 3) = v15;
    v7[32] = v16;
    *(_OWORD *)(v7 + 40) = v17;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286910);
    sub_24313536C();
    sub_2431354EC();
    return sub_243140E80();
  }
}

_QWORD *sub_243133AA8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257286708);
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
    sub_24313617C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_243133BB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_243133C84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2431362D4((uint64_t)v12, *a3);
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
      sub_2431362D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_243133C84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_243141204();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_243133E3C(a5, a6);
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
  v8 = sub_24314124C();
  if (!v8)
  {
    sub_243141258();
    __break(1u);
LABEL_17:
    result = sub_243141270();
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

uint64_t sub_243133E3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_243133ED0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2431340A8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2431340A8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_243133ED0(uint64_t a1, unint64_t a2)
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
      v3 = sub_243134044(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_243141234();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_243141258();
      __break(1u);
LABEL_10:
      v2 = sub_243141120();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_243141270();
    __break(1u);
LABEL_14:
    result = sub_243141258();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_243134044(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286B58);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2431340A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286B58);
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
  result = sub_243141270();
  __break(1u);
  return result;
}

uint64_t sub_2431341F4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_243134210(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_243134210(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286708);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_243141270();
  __break(1u);
  return result;
}

uint64_t sub_243134378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_2431343F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_243140CF4();
  *a1 = result;
  return result;
}

uint64_t sub_24313441C()
{
  swift_retain();
  return sub_243140D00();
}

uint64_t sub_243134444(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18[2];
  uint64_t v19;

  v6 = v5;
  result = MEMORY[0x24BEE4AF8];
  v19 = MEMORY[0x24BEE4AF8];
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v13 = (uint64_t *)(a1 + 40);
    do
    {
      v14 = *v13;
      v18[0] = *(v13 - 1);
      v18[1] = v14;
      swift_bridgeObjectRetain();
      sub_24313B6D4(v18, a2, a3, a4, a5, &v17);
      if (v6)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      v15 = swift_bridgeObjectRelease();
      if (v17)
      {
        MEMORY[0x2494F2FB4](v15);
        if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24314115C();
        sub_243141168();
        sub_243141150();
      }
      v13 += 2;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

uint64_t sub_243134594()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for NotesSiriListView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2431410D8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v7 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_243140B50();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t destroy for NotesSiriListView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = sub_243140B50();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for NotesSiriListView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2431410D8();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_243140B50();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for NotesSiriListView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 24);
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    sub_243136140((uint64_t)a1 + v10, &qword_257286710);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_243140B50();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *initializeWithTake for NotesSiriListView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_243140B50();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for NotesSiriListView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    sub_243136140((uint64_t)a1 + v10, &qword_257286710);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_243140B50();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_243134B60(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2431410D8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286728);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriListView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_243134C10(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = sub_2431410D8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286728);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_243134CB0()
{
  unint64_t v0;
  unint64_t v1;

  sub_2431410D8();
  if (v0 <= 0x3F)
  {
    sub_243134D44();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_243134D44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257286798[0])
  {
    sub_243140B50();
    v0 = sub_243140C64();
    if (!v1)
      atomic_store(v0, qword_257286798);
  }
}

unint64_t sub_243134D9C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2572867D0;
  if (!qword_2572867D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572867D8);
    v2 = sub_243136344(&qword_2572867E0, &qword_257286720, (uint64_t (*)(void))sub_243134E64, MEMORY[0x24BDEDBB8]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2572867D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494F3458](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_243134E64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2572867E8;
  if (!qword_2572867E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286718);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572867F0);
    v2[3] = sub_243134EF8();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_243135054();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572867E8);
  }
  return result;
}

unint64_t sub_243134EF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2572867F8;
  if (!qword_2572867F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572867F0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286800);
    v2[3] = sub_243134F8C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_243135054();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572867F8);
  }
  return result;
}

unint64_t sub_243134F8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286808;
  if (!qword_257286808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286800);
    v2[0] = sub_243135010();
    v2[1] = sub_243136430(&qword_257286818, &qword_257286820, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286808);
  }
  return result;
}

unint64_t sub_243135010()
{
  unint64_t result;

  result = qword_257286810;
  if (!qword_257286810)
  {
    result = MEMORY[0x2494F3464](&unk_24314199C, &type metadata for NotesSiriListView.NoteRow);
    atomic_store(result, (unint64_t *)&qword_257286810);
  }
  return result;
}

unint64_t sub_243135054()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257286828;
  if (!qword_257286828)
  {
    v1 = sub_243140EC8();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_257286828);
  }
  return result;
}

uint64_t destroy for NotesSiriListView.NoteRow()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NotesSiriListView.NoteRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NotesSiriListView.NoteRow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
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

uint64_t assignWithTake for NotesSiriListView.NoteRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListView.NoteRow(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NotesSiriListView.NoteRow(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for NotesSiriListView.NoteRow()
{
  return &type metadata for NotesSiriListView.NoteRow;
}

uint64_t sub_2431352BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2431352CC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2431352F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_243132FC8(v1 + 16, a1);
}

uint64_t sub_243135300()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24313532C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2431338CC(*(void (**)(uint64_t))(v1 + 16), *(void (**)(_QWORD *__return_ptr))(v1 + 32), a1);
}

uint64_t sub_243135338(uint64_t a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_24313536C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2572868B8;
  if (!qword_2572868B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572868C0);
    v2[0] = sub_2431353F0();
    v2[1] = sub_243136430(&qword_2572868F8, &qword_257286900, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572868B8);
  }
  return result;
}

unint64_t sub_2431353F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2572868C8;
  if (!qword_2572868C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572868D0);
    v2[0] = sub_243135474();
    v2[1] = sub_243136430(&qword_2572868E8, &qword_2572868F0, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572868C8);
  }
  return result;
}

unint64_t sub_243135474()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2572868D8;
  if (!qword_2572868D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572868E0);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572868D8);
  }
  return result;
}

unint64_t sub_2431354EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286908;
  if (!qword_257286908)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286910);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286908);
  }
  return result;
}

uint64_t sub_243135550(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243135594(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2431355D0()
{
  return sub_243140CD0();
}

uint64_t sub_2431355F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_243134378(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

uint64_t sub_243135614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_243140CF4();
  *a1 = result;
  return result;
}

uint64_t sub_24313563C()
{
  swift_retain();
  return sub_243140D00();
}

uint64_t sub_243135664(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_243135674(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_243135684()
{
  unint64_t result;

  result = qword_2572869A8;
  if (!qword_2572869A8)
  {
    result = MEMORY[0x2494F3464](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2572869A8);
  }
  return result;
}

uint64_t sub_2431356C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_243140D18();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2431356F8()
{
  return sub_243140D24();
}

uint64_t sub_243135724(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255)
    return sub_24313573C(a1, a2, a3);
  return a1;
}

uint64_t sub_24313573C(uint64_t a1, uint64_t a2, char a3)
{
  sub_243135664(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_243135764(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255)
    return sub_24313577C(a1, a2, a3);
  return a1;
}

uint64_t sub_24313577C(uint64_t a1, uint64_t a2, char a3)
{
  sub_243135674(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_2431357A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2572869E8;
  if (!qword_2572869E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572869E0);
    v2[0] = sub_243135828();
    v2[1] = sub_243136430(&qword_257286A20, &qword_257286A28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572869E8);
  }
  return result;
}

unint64_t sub_243135828()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2572869F0;
  if (!qword_2572869F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2572869D8);
    v2[0] = sub_2431358AC();
    v2[1] = sub_243136430(&qword_257286A18, &qword_257286988, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572869F0);
  }
  return result;
}

unint64_t sub_2431358AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2572869F8;
  if (!qword_2572869F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286A00);
    v2 = sub_243136430(&qword_257286A08, &qword_257286A10, MEMORY[0x24BDF0710]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2572869F8);
  }
  return result;
}

unint64_t sub_243135930()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257286A38;
  if (!qword_257286A38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286990);
    v2 = sub_243136430(&qword_257286A18, &qword_257286988, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF4610];
    v3[1] = v2;
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257286A38);
  }
  return result;
}

uint64_t sub_2431359B4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_243135A24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AB0;
  if (!qword_257286AB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286AA0);
    v2[0] = sub_243135A88();
    v2[1] = v2[0];
    result = MEMORY[0x2494F3464](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AB0);
  }
  return result;
}

unint64_t sub_243135A88()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AB8;
  if (!qword_257286AB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286A90);
    v2[0] = sub_243135B0C();
    v2[1] = sub_243136430(&qword_257286A18, &qword_257286988, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AB8);
  }
  return result;
}

unint64_t sub_243135B0C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AC0;
  if (!qword_257286AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286AC8);
    v2[0] = sub_2431358AC();
    v2[1] = sub_243136430(&qword_257286A20, &qword_257286A28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AC0);
  }
  return result;
}

uint64_t sub_243135B90()
{
  return sub_2431359B4(&qword_257286AD0, &qword_257286A70, (uint64_t (*)(void))sub_243135BB4, (uint64_t (*)(void))sub_2431357A4);
}

unint64_t sub_243135BB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AD8;
  if (!qword_257286AD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286A68);
    v2[0] = sub_243135C38();
    v2[1] = sub_243136430(&qword_257286A18, &qword_257286988, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AD8);
  }
  return result;
}

unint64_t sub_243135C38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AE0;
  if (!qword_257286AE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286AE8);
    v2[0] = sub_243135CBC();
    v2[1] = sub_243136430(&qword_257286A20, &qword_257286A28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AE0);
  }
  return result;
}

unint64_t sub_243135CBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286AF0;
  if (!qword_257286AF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286AF8);
    v2[0] = sub_243135D40();
    v2[1] = sub_243136430(&qword_257286A08, &qword_257286A10, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286AF0);
  }
  return result;
}

unint64_t sub_243135D40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257286B00;
  if (!qword_257286B00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286B08);
    v2 = sub_243136430(&qword_257286B10, &qword_257286B18, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257286B00);
  }
  return result;
}

uint64_t sub_243135DC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243135E08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_243140CDC();
  *a1 = result;
  return result;
}

uint64_t sub_243135E30()
{
  swift_retain();
  return sub_243140CE8();
}

uint64_t sub_243135E58(uint64_t a1)
{
  sub_243135ECC(*(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232), *(_QWORD *)(a1 + 240), *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280), *(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 296), *(_QWORD *)(a1 + 304), *(_QWORD *)(a1 + 312), *(_QWORD *)(a1 + 320),
    *(_QWORD *)(a1 + 328),
    *(_QWORD *)(a1 + 336),
    *(_QWORD *)(a1 + 344),
    *(_QWORD *)(a1 + 352),
    *(_QWORD *)(a1 + 360),
    *(_BYTE *)(a1 + 368));
  return a1;
}

uint64_t sub_243135ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  sub_243135664(a4, a5, a6 & 1);
  swift_bridgeObjectRetain();
  if ((a25 & 1) != 0)
  {
    sub_243135664(a16, a17, a18 & 1);
    swift_bridgeObjectRetain();
    sub_243135664(a20, a21, a22 & 1);
  }
  else
  {
    swift_retain();
    sub_243135664(a21, a22, a23 & 1);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_243135FAC(uint64_t a1)
{
  sub_243135ECC(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    *(_QWORD *)(a1 + 256),
    *(_QWORD *)(a1 + 264),
    *(_QWORD *)(a1 + 272),
    *(_BYTE *)(a1 + 280));
  return a1;
}

uint64_t sub_24313602C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for NotesSiriListView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 24) & ~v2);
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 20);
  v5 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286710);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_243140B50();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_243136110()
{
  uint64_t v0;

  type metadata accessor for NotesSiriListView();
  return sub_24312FE28(*(_QWORD *)(v0 + 16));
}

uint64_t sub_243136140(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24313617C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_243141270();
  __break(1u);
  return result;
}

uint64_t sub_243136270(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_2431362D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_243136310()
{
  return sub_243136344(&qword_257286B60, &qword_257286848, (uint64_t (*)(void))sub_2431363AC, MEMORY[0x24BDECC60]);
}

uint64_t sub_243136344(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2431363AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286B68;
  if (!qword_257286B68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286838);
    v2[0] = sub_243136430(&qword_257286B70, &qword_257286830, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286B68);
  }
  return result;
}

uint64_t sub_243136430(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494F3464](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void NotesSiriSingleNoteView.init(identifier:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t inited;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  __int128 aBlock;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v6 = (int *)type metadata accessor for NotesSiriSingleNoteView();
  v53 = *((_QWORD *)v6 - 1);
  v7 = *(_QWORD *)(v53 + 64);
  v8 = MEMORY[0x24BDAC7A8](v6);
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 0;
  v55 = a3 + *(int *)(v8 + 28);
  sub_243140AF0();
  sub_2431410CC();
  *(_QWORD *)(a3 + v6[9]) = 0x4028000000000000;
  v9 = a3 + v6[10];
  LOBYTE(v58) = 0;
  sub_243141054();
  v10 = *((_QWORD *)&aBlock + 1);
  *(_BYTE *)v9 = aBlock;
  *(_QWORD *)(v9 + 8) = v10;
  v11 = (_QWORD *)(a3 + v6[11]);
  *(_QWORD *)&v58 = 0xBFF0000000000000;
  sub_243141054();
  v12 = *((_QWORD *)&aBlock + 1);
  *v11 = aBlock;
  v11[1] = v12;
  v13 = a3 + v6[12];
  LOBYTE(v58) = 0;
  sub_243141054();
  v14 = *((_QWORD *)&aBlock + 1);
  *(_BYTE *)v13 = aBlock;
  *(_QWORD *)(v13 + 8) = v14;
  v15 = (_QWORD *)(a3 + v6[13]);
  *v15 = 0;
  v15[1] = 0xE000000000000000;
  v57 = v6[14];
  *(_BYTE *)(a3 + v57) = 0;
  v56 = v6[15];
  *(_BYTE *)(a3 + v56) = 0;
  *(_QWORD *)(a3 + v6[16]) = 0x4034000000000000;
  *(_QWORD *)(a3 + v6[17]) = 0x4038000000000000;
  *(_QWORD *)(a3 + v6[18]) = 0x403C000000000000;
  v16 = (_OWORD *)(a3 + v6[19]);
  v62 = 0;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286B88);
  sub_243141054();
  v17 = v64;
  v18 = v65;
  v19 = v66;
  v20 = v67;
  *v16 = aBlock;
  v16[1] = v17;
  v16[2] = v18;
  v16[3] = v19;
  v16[4] = v20;
  v21 = (void *)objc_opt_self();
  objc_msgSend(v21, sel_startSharedContextWithOptions_, 66116);
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  swift_bridgeObjectRetain();
  v22 = objc_msgSend(v21, sel_sharedContext);
  if (!v22)
    goto LABEL_14;
  v23 = v22;
  v52 = v7;
  v24 = objc_msgSend(v22, sel_managedObjectContext);

  if (!v24)
    goto LABEL_14;
  v51 = (uint64_t)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = objc_msgSend((id)objc_opt_self(), sel_sharedContext);
  if (!v25)
    goto LABEL_19;
  v26 = v25;
  v27 = objc_msgSend(v25, sel_managedObjectContext);

  if (!v27)
  {

LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286708);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2431418B0;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  v29 = v27;
  v30 = v24;
  v31 = sub_243134444(inited, v29, 0, 0, v30);
  v50 = v29;

  v49 = v30;
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a3 + 16) = v31;
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = sub_243141264();
    if (v32)
      goto LABEL_7;
  }
  else
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v32)
    {
LABEL_7:
      if (v32 >= 1)
      {
        v33 = 0;
        v54 = v31 & 0xC000000000000001;
        v34 = v31;
        v35 = v55;
        do
        {
          if (v54)
          {
            v36 = MEMORY[0x2494F30C8](v33, v31);
          }
          else
          {
            v36 = *(_QWORD *)(v31 + 8 * v33 + 32);
            swift_retain();
          }
          ++v33;
          sub_243136140(v35, &qword_257286668);
          v37 = v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
          swift_beginAccess();
          v38 = sub_243140AFC();
          v39 = *(_QWORD *)(v38 - 8);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v35, v37, v38);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v35, 0, 1, v38);
          v40 = (uint64_t *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
          swift_beginAccess();
          v42 = *v40;
          v41 = v40[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *v15 = v42;
          v15[1] = v41;
          *(_BYTE *)(a3 + v57) = *(_BYTE *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected);
          *(_BYTE *)(a3 + v56) = *(_BYTE *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported);
          LOBYTE(v41) = *(_BYTE *)(v36 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote);
          swift_release();
          *(_BYTE *)(a3 + 24) = v41;
          v31 = v34;
        }
        while (v32 != v33);
        goto LABEL_16;
      }
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  v43 = (void *)objc_opt_self();
  v44 = v51;
  sub_243139718(a3, v51);
  v45 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  v46 = swift_allocObject();
  sub_243139760(v44, v46 + v45);
  *(_QWORD *)&v65 = sub_2431397A4;
  *((_QWORD *)&v65 + 1) = v46;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v64 = sub_243136BC8;
  *((_QWORD *)&v64 + 1) = &block_descriptor;
  v47 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v43, sel_setOpenURLHandler_, v47);
  _Block_release(v47);

}

uint64_t type metadata accessor for NotesSiriSingleNoteView()
{
  uint64_t result;

  result = qword_257286C08;
  if (!qword_257286C08)
    return swift_getSingletonMetadata();
  return result;
}

void sub_243136AC0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v3 = sub_2431410F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v8 = (void *)sub_243140AD8();
  objc_msgSend(v7, sel_setPunchOutUri_, v8);

  type metadata accessor for NotesSiriSingleNoteView();
  sub_2431410C0();
  v9 = v7;
  sub_2431410E4();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (a2)
    a2(1);

}

uint64_t sub_243136BC8(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *, uint64_t);
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = sub_243140AFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *, uint64_t))(a1 + 32);
  sub_243140AE4();
  v10 = _Block_copy(a3);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_24313B41C;
  }
  else
  {
    v11 = 0;
  }
  swift_retain();
  v9(v8, v10, v11);
  sub_24313B3E8((uint64_t)v10);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_243136CC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  ValueMetadata **v15;
  ValueMetadata *v16;
  ValueMetadata *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  ValueMetadata *v30;
  unint64_t v31;
  id v32;
  double v33;

  v2 = v1;
  v29 = a1;
  v3 = sub_243140DCC();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for NotesSiriSingleNoteView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257286E00);
  v10 = *(_QWORD *)(v9 - 8);
  v24 = v9;
  v25 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D38);
  MEMORY[0x24BDAC7A8](v26);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (ValueMetadata **)(v2 + *(int *)(v6 + 44));
  v16 = *v15;
  v17 = v15[1];
  v30 = v16;
  v31 = (unint64_t)v17;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286C88);
  sub_243141060();
  sub_24312E23C((uint64_t)&v30, v33);
  sub_243139718(v2, (uint64_t)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v19 = swift_allocObject();
  sub_243139760((uint64_t)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  v20 = sub_24312E054();
  sub_243140FA0();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  sub_243140DB4();
  v30 = &type metadata for NotesSiriTextEditorWrapper;
  v31 = v20;
  swift_getOpaqueTypeConformance2();
  v21 = v24;
  sub_243140FAC();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v28);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v21);
  v30 = (ValueMetadata *)sub_243140BBC();
  v31 = v22;
  sub_243135684();
  sub_243140CA0();
  swift_bridgeObjectRelease();
  return sub_243136140((uint64_t)v14, &qword_257286D38);
}

uint64_t sub_243136F88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;

  v2 = sub_2431410F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v10 = type metadata accessor for NotesSiriSingleNoteView();
  sub_243136270(a1 + *(int *)(v10 + 28), (uint64_t)v8, &qword_257286668);
  v11 = sub_243140AFC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    v13 = (void *)sub_243140AD8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }
  objc_msgSend(v9, sel_setPunchOutUri_, v13);

  sub_2431410C0();
  v14 = v9;
  sub_2431410E4();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t NotesSiriSingleNoteView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (**v27)(uint64_t);
  void (*v28)(char *, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (**v34)(uint64_t);
  uint64_t v36[3];
  void (*v37)(char *, char *, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;

  v2 = v1;
  v41 = a1;
  v3 = type metadata accessor for NotesSiriSingleNoteView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_2431411A4();
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B90);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B98);
  MEMORY[0x24BDAC7A8](v39);
  v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v1 + *(int *)(v3 + 40);
  v15 = *(_BYTE *)v14;
  v16 = *(_QWORD *)(v14 + 8);
  v43 = v15;
  v44 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
  sub_243141060();
  *v11 = sub_243141078();
  v11[1] = v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286BA0);
  sub_2431374A8(v1, (uint64_t)v11 + *(int *)(v18 + 44));
  v38 = (id)objc_opt_self();
  v19 = objc_msgSend(v38, sel_defaultCenter);
  if (qword_257286528 != -1)
    swift_once();
  sub_2431411B0();

  sub_243139718(v2, (uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = *(unsigned __int8 *)(v4 + 80);
  v21 = (v20 + 16) & ~v20;
  v36[2] = v21 + v5;
  v36[0] = v2;
  v36[1] = v20 | 7;
  v22 = swift_allocObject();
  sub_243139760((uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  sub_243136270((uint64_t)v11, (uint64_t)v13, &qword_257286B90);
  v23 = v39;
  v24 = v40;
  v25 = &v13[*(int *)(v39 + 52)];
  v26 = v42;
  v37 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v37(v25, v8, v42);
  v27 = (uint64_t (**)(uint64_t))&v13[*(int *)(v23 + 56)];
  *v27 = sub_243139814;
  v27[1] = (uint64_t (*)(uint64_t))v22;
  v28 = *(void (**)(char *, uint64_t))(v24 + 8);
  v28(v8, v26);
  sub_243136140((uint64_t)v11, &qword_257286B90);
  v29 = objc_msgSend(v38, sel_defaultCenter);
  if (qword_257286530 != -1)
    swift_once();
  sub_2431411B0();

  sub_243139718(v36[0], (uint64_t)v6);
  v30 = swift_allocObject();
  sub_243139760((uint64_t)v6, v30 + v21);
  v31 = v41;
  sub_243136270((uint64_t)v13, v41, &qword_257286B98);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286BA8);
  v33 = v42;
  v37((char *)(v31 + *(int *)(v32 + 52)), v8, v42);
  v34 = (uint64_t (**)(uint64_t))(v31 + *(int *)(v32 + 56));
  *v34 = sub_243139824;
  v34[1] = (uint64_t (*)(uint64_t))v30;
  v28(v8, v33);
  return sub_243136140((uint64_t)v13, &qword_257286B98);
}

uint64_t sub_2431374A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v51 = a2;
  v3 = type metadata accessor for NotesSiriSingleNoteView();
  v43 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v43 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v44 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286C90);
  v47 = *(_QWORD *)(v5 - 8);
  v48 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286C98);
  v8 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  v50 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286CA0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v42 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286CA8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286CB0);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v42 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v42 - v26;
  *(_QWORD *)v18 = sub_243140DF0();
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 0;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286CB8);
  sub_2431378F0(a1, (uint64_t)&v18[*(int *)(v28 + 44)]);
  sub_243136270((uint64_t)v18, (uint64_t)v25, &qword_257286CA8);
  *(_QWORD *)&v25[*(int *)(v19 + 36)] = 0;
  sub_243136140((uint64_t)v18, &qword_257286CA8);
  sub_243135DC4((uint64_t)v25, (uint64_t)v27, &qword_257286CB0);
  if (*(_BYTE *)(a1 + 24) == 1)
  {
    v52 = sub_243141000();
    v53 = 0x3F50624DD2F1A9FCLL;
    v29 = v44;
    sub_243139718(a1, v44);
    v30 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    v31 = swift_allocObject();
    sub_243139760(v29, v31 + v30);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286CC8);
    sub_243136344(&qword_257286CD0, &qword_257286CC8, (uint64_t (*)(void))sub_24313A9CC, MEMORY[0x24BDECC38]);
    v32 = v46;
    sub_243140FA0();
    swift_release();
    swift_release();
    v34 = v47;
    v33 = v48;
    v35 = (uint64_t)v45;
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v45, v32, v48);
    v36 = v49;
    *(_QWORD *)(v35 + *(int *)(v49 + 36)) = 0x3FF0000000000000;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v33);
    sub_243135DC4(v35, (uint64_t)v15, &qword_257286C98);
    v37 = 0;
    v38 = v36;
  }
  else
  {
    v37 = 1;
    v38 = v49;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v15, v37, 1, v38);
  sub_243136270((uint64_t)v27, (uint64_t)v22, &qword_257286CB0);
  sub_243136270((uint64_t)v15, (uint64_t)v13, &qword_257286CA0);
  v39 = v51;
  sub_243136270((uint64_t)v22, v51, &qword_257286CB0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286CC0);
  sub_243136270((uint64_t)v13, v39 + *(int *)(v40 + 48), &qword_257286CA0);
  sub_243136140((uint64_t)v15, &qword_257286CA0);
  sub_243136140((uint64_t)v27, &qword_257286CB0);
  sub_243136140((uint64_t)v13, &qword_257286CA0);
  return sub_243136140((uint64_t)v22, &qword_257286CB0);
}

uint64_t sub_2431378F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v44[2];
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[5];
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v53 = a2;
  v3 = type metadata accessor for NotesSiriSingleNoteView();
  v46 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v47 = v4;
  v49 = (uint64_t)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_243140B68();
  MEMORY[0x24BDAC7A8](v5);
  v44[1] = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2431410B4();
  v50 = *(_QWORD *)(v7 - 8);
  v51 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D00);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D08);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v52 = (uint64_t)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v44 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D10);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)v44 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v44 - v24;
  *(_QWORD *)v23 = sub_243140D54();
  *((_QWORD *)v23 + 1) = 0;
  v26 = 1;
  v23[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286D18);
  sub_243137DA4(a1);
  v27 = (uint64_t)v23;
  v28 = v10;
  sub_243135DC4(v27, (uint64_t)v25, &qword_257286D10);
  v29 = a1 + *(int *)(v3 + 48);
  v30 = *(_BYTE *)v29;
  v31 = *(_QWORD *)(v29 + 8);
  LOBYTE(v58) = v30;
  v59 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
  sub_243141060();
  if (v55 == 1)
  {
    v32 = sub_243140BC8();
    v60 = MEMORY[0x24BEE0D00];
    v61 = MEMORY[0x24BEAE5B8];
    v58 = v32;
    v59 = v33;
    v57 = 0;
    v55 = 0u;
    v56 = 0u;
    sub_243140B5C();
    v54[3] = sub_243141090();
    v54[4] = MEMORY[0x24BEADA30];
    __swift_allocate_boxed_opaque_existential_1(v54);
    sub_24314109C();
    v34 = v48;
    sub_2431410A8();
    v35 = v49;
    sub_243139718(a1, v49);
    v36 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    v37 = swift_allocObject();
    sub_243139760(v35, v37 + v36);
    sub_24313ABB4(&qword_257286D28, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE00], MEMORY[0x24BEADDF0]);
    v38 = v45;
    v39 = v51;
    sub_243140FA0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v34, v39);
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v16, v38, v9);
    v26 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v16, v26, 1, v9);
  sub_243136270((uint64_t)v25, (uint64_t)v20, &qword_257286D10);
  v40 = v52;
  sub_243136270((uint64_t)v16, v52, &qword_257286D08);
  v41 = v53;
  sub_243136270((uint64_t)v20, v53, &qword_257286D10);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D20);
  sub_243136270(v40, v41 + *(int *)(v42 + 48), &qword_257286D08);
  sub_243136140((uint64_t)v16, &qword_257286D08);
  sub_243136140((uint64_t)v25, &qword_257286D10);
  sub_243136140(v40, &qword_257286D08);
  return sub_243136140((uint64_t)v20, &qword_257286D10);
}

uint64_t sub_243137DA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  int v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[100];
  _BYTE v80[592];
  _BYTE v81[616];
  _BYTE v82[728];
  _BYTE v83[800];
  uint64_t v84;
  uint64_t v85;
  char v86;
  _BYTE v87[599];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v75 = v2;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D30);
  MEMORY[0x24BDAC7A8](v62);
  v65 = (uint64_t)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D38);
  MEMORY[0x24BDAC7A8](v64);
  v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D40);
  v6 = MEMORY[0x24BDAC7A8](v61);
  v59 = (uint64_t)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v60 = (uint64_t)&v59 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D48);
  MEMORY[0x24BDAC7A8](v9);
  v63 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D50);
  MEMORY[0x24BDAC7A8](v77);
  v78 = (uint64_t)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_243140DCC();
  v72 = *(_QWORD *)(v12 - 8);
  v73 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D58);
  v67 = *(_QWORD *)(v14 - 8);
  v68 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v66 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D60);
  v16 = MEMORY[0x24BDAC7A8](v76);
  v71 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v70 = (char *)&v59 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v74 = (uint64_t)&v59 - v20;
  v21 = type metadata accessor for NotesSiriSingleNoteView();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v59 - v27;
  v29 = *(unsigned __int8 *)(v1 + *(int *)(v26 + 56));
  sub_243139718(v1, (uint64_t)&v59 - v27);
  if (v29 == 1)
  {
    sub_24313AAD4((uint64_t)v28);
LABEL_4:
    v31 = sub_243140DF0();
    sub_2431385B4(v1, (uint64_t)v80);
    v65 = v9;
    v81[600] = 1;
    memcpy(&v81[7], v80, 0x250uLL);
    v84 = v31;
    v85 = 0;
    v86 = 1;
    memcpy(v87, v81, sizeof(v87));
    sub_243141084();
    sub_24312F5A0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v82, 0.0, 1, 0.0, 1);
    sub_24313AEE0((uint64_t)v80);
    v32 = sub_243140EF8();
    KeyPath = swift_getKeyPath();
    v34 = sub_243140E98();
    v35 = sub_243140EEC();
    v81[608] = 1;
    memcpy(v79, v82, 0x2D8uLL);
    v79[91] = KeyPath;
    v79[92] = v32;
    LODWORD(v79[93]) = v34;
    LOBYTE(v79[94]) = v35;
    memset(&v79[95], 0, 32);
    LOBYTE(v79[99]) = 1;
    sub_243139718(v1, (uint64_t)v25);
    v36 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    v37 = swift_allocObject();
    sub_243139760((uint64_t)v25, v37 + v36);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286D80);
    v39 = sub_243136344(&qword_257286D88, &qword_257286D80, (uint64_t (*)(void))sub_24313ACC8, MEMORY[0x24BDECC60]);
    v40 = v66;
    sub_243140FA0();
    swift_release();
    memcpy(v83, v79, 0x319uLL);
    sub_24313B050((uint64_t)v83);
    v41 = v69;
    sub_243140DB4();
    v79[0] = v38;
    v79[1] = v39;
    swift_getOpaqueTypeConformance2();
    v42 = (uint64_t)v71;
    v43 = v68;
    sub_243140FAC();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v41, v73);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v40, v43);
    v79[0] = sub_243140BBC();
    v79[1] = v44;
    sub_243135684();
    v45 = v70;
    sub_243140CA0();
    swift_bridgeObjectRelease();
    v46 = &qword_257286D60;
    sub_243136140(v42, &qword_257286D60);
    v47 = (uint64_t)v45;
    v48 = v74;
    sub_243135DC4(v47, v74, &qword_257286D60);
    sub_243136270(v48, v78, &qword_257286D60);
    swift_storeEnumTagMultiPayload();
    sub_24313ABF4();
    sub_24313AE54();
    sub_243140E80();
    v49 = v48;
    return sub_243136140(v49, v46);
  }
  v30 = v28[*(int *)(v21 + 60)];
  sub_24313AAD4((uint64_t)v28);
  if (v30 == 1)
    goto LABEL_4;
  v50 = *(unsigned __int8 *)(v1 + 24);
  v51 = (uint64_t)v5;
  sub_243136CC8((uint64_t)v5);
  if (v50 == 1)
  {
    v52 = *(_QWORD *)(v1 + *(int *)(v21 + 36));
    v53 = sub_243140EE0();
    v54 = v59;
    sub_243136270((uint64_t)v5, v59, &qword_257286D38);
    v55 = v54 + *(int *)(v61 + 36);
    *(_BYTE *)v55 = v53;
    *(_QWORD *)(v55 + 8) = v52;
    *(_QWORD *)(v55 + 16) = 0;
    *(_QWORD *)(v55 + 24) = v52;
    *(_QWORD *)(v55 + 32) = 0;
    *(_BYTE *)(v55 + 40) = 0;
    sub_243136140((uint64_t)v5, &qword_257286D38);
    v56 = &qword_257286D40;
    v51 = v60;
    sub_243135DC4(v54, v60, &qword_257286D40);
    sub_243136270(v51, v65, &qword_257286D40);
  }
  else
  {
    v56 = &qword_257286D38;
    sub_243136270((uint64_t)v5, v65, &qword_257286D38);
  }
  swift_storeEnumTagMultiPayload();
  sub_243136344(&qword_257286D68, &qword_257286D40, (uint64_t (*)(void))sub_24313AB10, MEMORY[0x24BDECC60]);
  sub_24313AB10();
  v57 = (uint64_t)v63;
  sub_243140E80();
  sub_243136140(v51, v56);
  v46 = &qword_257286D48;
  sub_243136270(v57, v78, &qword_257286D48);
  swift_storeEnumTagMultiPayload();
  sub_24313ABF4();
  sub_24313AE54();
  sub_243140E80();
  v49 = v57;
  return sub_243136140(v49, v46);
}

uint64_t sub_2431385B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[29];
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  _BYTE v34[335];
  _BYTE __src[328];
  _BYTE v36[344];
  _BYTE __dst[488];
  char v38;
  char v39;
  char v40;
  _BYTE v41[472];

  type metadata accessor for NotesSiriSingleNoteView();
  sub_243141078();
  sub_243140C7C();
  v4 = v21;
  v17 = v22;
  v18 = v20;
  v5 = v23;
  v6 = v24;
  v7 = v25;
  v8 = sub_243140D54();
  sub_2431387DC(a1, (uint64_t)__src);
  v36[336] = 1;
  memcpy(&v36[7], __src, 0x148uLL);
  v31 = v8;
  v32 = 0;
  v33 = 1;
  memcpy(v34, v36, sizeof(v34));
  sub_243141084();
  sub_24312F750(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v19, 0.0, 1, 0.0, 1);
  sub_24313B0E4((uint64_t)__src);
  sub_243141078();
  sub_243140C7C();
  v9 = v26;
  v10 = v27;
  v11 = v28;
  v12 = v29;
  memcpy(__dst, v19, 0x1D0uLL);
  v40 = 1;
  v39 = v4;
  v38 = v5;
  memcpy((void *)(a2 + 64), v19, 0x1D0uLL);
  __dst[480] = 1;
  __dst[472] = v10;
  __dst[464] = v12;
  v13 = v40;
  v14 = v39;
  v15 = v38;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v13;
  *(_QWORD *)(a2 + 16) = v18;
  *(_BYTE *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v17;
  *(_BYTE *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = v7;
  *(_QWORD *)(a2 + 528) = 0;
  *(_BYTE *)(a2 + 536) = 1;
  *(_QWORD *)(a2 + 544) = v9;
  *(_BYTE *)(a2 + 552) = v10;
  *(_QWORD *)(a2 + 560) = v11;
  *(_BYTE *)(a2 + 568) = v12;
  *(_OWORD *)(a2 + 576) = v30;
  memcpy(v41, v19, 0x1D0uLL);
  sub_24313B158((uint64_t)__dst, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_243135ECC);
  return sub_24313B158((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_24313AF64);
}

uint64_t sub_2431387DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  _BYTE v42[175];
  char v43;
  char v44;
  char v45;
  char v46;
  _OWORD v47[12];
  char v48;
  char v49;
  __int128 v50;
  _BYTE v51[176];
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
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
  char v71;

  v4 = type metadata accessor for NotesSiriSingleNoteView();
  sub_243141078();
  sub_243140C7C();
  v26 = v54;
  v29 = v55;
  v30 = v53;
  v5 = v56;
  v27 = v58;
  v28 = v57;
  if (*(_BYTE *)(a1 + *(int *)(v4 + 56)) == 1)
  {
    v6 = sub_243140DF0();
    sub_243138D0C(a1, (uint64_t)&v31);
    *(_OWORD *)&v42[71] = v35;
    *(_OWORD *)&v42[55] = v34;
    *(_OWORD *)&v42[119] = v38;
    *(_OWORD *)&v42[135] = v39;
    *(_QWORD *)&v42[167] = v41;
    *(_OWORD *)&v42[151] = v40;
    *(_OWORD *)&v42[87] = v36;
    *(_OWORD *)&v42[103] = v37;
    *(_OWORD *)&v42[7] = v31;
    *(_OWORD *)&v42[23] = v32;
    *(_OWORD *)&v42[39] = v33;
    *(_OWORD *)&v51[113] = *(_OWORD *)&v42[112];
    *(_OWORD *)&v51[129] = *(_OWORD *)&v42[128];
    *(_OWORD *)&v51[145] = *(_OWORD *)&v42[144];
    *(_OWORD *)&v51[160] = *(_OWORD *)&v42[159];
    *(_OWORD *)&v51[49] = *(_OWORD *)&v42[48];
    *(_OWORD *)&v51[65] = *(_OWORD *)&v42[64];
    *(_OWORD *)&v51[81] = *(_OWORD *)&v42[80];
    *(_OWORD *)&v51[97] = *(_OWORD *)&v42[96];
    *(_OWORD *)&v51[1] = *(_OWORD *)v42;
    *(_OWORD *)&v51[17] = *(_OWORD *)&v42[16];
    v49 = 1;
    v50 = (unint64_t)v6;
    v51[0] = 1;
    *(_OWORD *)&v51[33] = *(_OWORD *)&v42[32];
    sub_24313B25C((uint64_t)&v50);
  }
  else
  {
    v7 = sub_243140DF0();
    sub_243138FD0(a1, (uint64_t)&v31);
    *(_OWORD *)&v42[119] = v38;
    *(_OWORD *)&v42[103] = v37;
    *(_OWORD *)&v42[55] = v34;
    *(_OWORD *)&v42[39] = v33;
    *(_OWORD *)&v42[135] = v39;
    *(_OWORD *)&v42[151] = v40;
    *(_OWORD *)&v42[71] = v35;
    *(_OWORD *)&v42[87] = v36;
    *(_OWORD *)&v42[7] = v31;
    *(_OWORD *)&v42[23] = v32;
    *(_OWORD *)&v51[113] = *(_OWORD *)&v42[112];
    *(_OWORD *)&v51[129] = *(_OWORD *)&v42[128];
    *(_OWORD *)&v51[145] = *(_OWORD *)&v42[144];
    *(_OWORD *)&v51[49] = *(_OWORD *)&v42[48];
    *(_OWORD *)&v51[65] = *(_OWORD *)&v42[64];
    *(_OWORD *)&v51[81] = *(_OWORD *)&v42[80];
    *(_OWORD *)&v51[97] = *(_OWORD *)&v42[96];
    *(_OWORD *)&v51[1] = *(_OWORD *)v42;
    *(_OWORD *)&v51[17] = *(_OWORD *)&v42[16];
    v49 = 1;
    v50 = (unint64_t)v7;
    v51[0] = 1;
    *(_QWORD *)&v51[160] = *((_QWORD *)&v40 + 1);
    *(_OWORD *)&v51[33] = *(_OWORD *)&v42[32];
    sub_24313B1DC((uint64_t)&v50);
  }
  sub_243135DC4((uint64_t)&v50, (uint64_t)v47, &qword_257286DD8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286DE0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257286DE8);
  v8 = MEMORY[0x24BDF4700];
  sub_243136430(&qword_257286DF0, &qword_257286DE0, MEMORY[0x24BDF4700]);
  sub_243136430(&qword_257286DF8, &qword_257286DE8, v8);
  sub_243140E80();
  sub_243141078();
  sub_243140C7C();
  *(_OWORD *)&v51[144] = v69;
  *(_OWORD *)&v51[160] = v70;
  v9 = v65;
  *(_OWORD *)&v51[80] = v65;
  *(_OWORD *)&v51[96] = v66;
  v10 = v67;
  *(_OWORD *)&v51[112] = v67;
  *(_OWORD *)&v51[128] = v68;
  v11 = v61;
  *(_OWORD *)&v51[16] = v61;
  *(_OWORD *)&v51[32] = v62;
  v12 = v63;
  *(_OWORD *)&v51[48] = v63;
  *(_OWORD *)&v51[64] = v64;
  v13 = v59;
  v50 = v59;
  *(_OWORD *)v51 = v60;
  v14 = v70;
  v47[10] = v69;
  v47[11] = v70;
  v15 = v66;
  v47[6] = v65;
  v47[7] = v66;
  v16 = v68;
  v47[8] = v67;
  v47[9] = v68;
  v17 = v62;
  v47[2] = v61;
  v47[3] = v62;
  v18 = v64;
  v47[4] = v63;
  v47[5] = v64;
  v19 = v60;
  v47[0] = v59;
  v47[1] = v60;
  *(_OWORD *)(a2 + 224) = v69;
  *(_OWORD *)(a2 + 240) = v14;
  *(_OWORD *)(a2 + 160) = v9;
  *(_OWORD *)(a2 + 176) = v15;
  *(_OWORD *)(a2 + 192) = v10;
  *(_OWORD *)(a2 + 208) = v16;
  *(_OWORD *)(a2 + 96) = v11;
  *(_OWORD *)(a2 + 112) = v17;
  *(_OWORD *)(a2 + 128) = v12;
  *(_OWORD *)(a2 + 144) = v18;
  v20 = *(_QWORD *)v42;
  v21 = v42[8];
  v22 = *(_QWORD *)&v42[16];
  v23 = v42[24];
  v52 = v71;
  v48 = v71;
  LOBYTE(v31) = 1;
  v49 = v26;
  v46 = v5;
  *(_BYTE *)(a2 + 256) = v71;
  *(_OWORD *)(a2 + 64) = v13;
  *(_OWORD *)(a2 + 80) = v19;
  v45 = 1;
  v44 = v21;
  v43 = v23;
  v24 = v49;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = v30;
  *(_BYTE *)(a2 + 24) = v24;
  *(_QWORD *)(a2 + 32) = v29;
  *(_BYTE *)(a2 + 40) = v5;
  *(_QWORD *)(a2 + 48) = v28;
  *(_QWORD *)(a2 + 56) = v27;
  *(_QWORD *)(a2 + 264) = 0;
  *(_BYTE *)(a2 + 272) = 1;
  *(_QWORD *)(a2 + 280) = v20;
  *(_BYTE *)(a2 + 288) = v21;
  *(_QWORD *)(a2 + 296) = v22;
  *(_BYTE *)(a2 + 304) = v23;
  *(_OWORD *)(a2 + 312) = *(_OWORD *)&v42[32];
  sub_24313B1E8((uint64_t)v47, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_243135ECC);
  return sub_24313B1E8((uint64_t)&v50, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_24313AF64);
}

uint64_t sub_243138D0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NotesSiriSingleNoteView() + 52));
  v4 = v3[1];
  v33 = *v3;
  v34 = v4;
  sub_243135684();
  swift_bridgeObjectRetain();
  v5 = sub_243140F64();
  v25 = v6;
  v26 = v5;
  v8 = v7;
  v10 = v9 & 1;
  sub_243141078();
  sub_243140C7C();
  v11 = v4;
  v23 = v35;
  v24 = v33;
  v12 = v36;
  v21 = v38;
  v22 = v37;
  v20 = sub_243140D48();
  sub_243138EF0((uint64_t)&v27);
  v13 = v27;
  v14 = v28;
  v15 = v29;
  v16 = v30;
  v17 = v31;
  v18 = v32;
  LOBYTE(v27) = v10;
  v43 = 1;
  v42 = v11;
  v41 = v12;
  v40 = 1;
  v39 = v31;
  *(_QWORD *)a2 = v26;
  *(_QWORD *)(a2 + 8) = v25;
  *(_BYTE *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v8;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v24;
  *(_BYTE *)(a2 + 56) = v11;
  *(_QWORD *)(a2 + 64) = v23;
  *(_BYTE *)(a2 + 72) = v12;
  *(_QWORD *)(a2 + 80) = v22;
  *(_QWORD *)(a2 + 88) = v21;
  *(_QWORD *)(a2 + 96) = v20;
  *(_QWORD *)(a2 + 104) = 0;
  *(_BYTE *)(a2 + 112) = 1;
  *(_QWORD *)(a2 + 120) = v13;
  *(_DWORD *)(a2 + 128) = v14;
  *(_QWORD *)(a2 + 136) = v15;
  *(_QWORD *)(a2 + 144) = v16;
  *(_BYTE *)(a2 + 152) = v17;
  *(_QWORD *)(a2 + 160) = v18;
  sub_243135664(v26, v25, v10);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243135664(v15, v16, v17);
  swift_bridgeObjectRetain();
  swift_release();
  sub_243135674(v15, v16, v17);
  swift_bridgeObjectRelease();
  sub_243135674(v26, v25, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_243138EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = sub_243141024();
  v3 = sub_243140EA4();
  sub_243140B74();
  sub_243135684();
  v4 = sub_243140F64();
  v6 = v5;
  *(_QWORD *)a1 = v2;
  *(_DWORD *)(a1 + 8) = v3;
  LOBYTE(v3) = v7 & 1;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v7 & 1;
  *(_QWORD *)(a1 + 40) = v8;
  swift_retain();
  sub_243135664(v4, v6, v3);
  swift_bridgeObjectRetain();
  sub_243135674(v4, v6, v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_243138FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[7];
  _BYTE v38[7];
  _BYTE v39[7];
  _BYTE v40[7];
  _BYTE v41[7];

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NotesSiriSingleNoteView() + 52));
  v31 = *v3;
  v32 = v3[1];
  sub_243135684();
  swift_bridgeObjectRetain();
  v28 = sub_243140F64();
  v29 = v4;
  v27 = v5;
  v7 = v6 & 1;
  sub_243141078();
  sub_243140C7C();
  sub_243140BB0();
  v8 = sub_243140F64();
  v10 = v9;
  v12 = v11 & 1;
  sub_243140F04();
  v13 = sub_243140F28();
  v25 = v14;
  v26 = v15;
  v17 = v16 & 1;
  sub_243135674(v8, v10, v12);
  swift_bridgeObjectRelease();
  v30 = sub_243140BE0();
  v18 = sub_243140F64();
  v20 = v19;
  v22 = v21 & 1;
  *(_DWORD *)(a2 + 17) = v30;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v30 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v41;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v41[3];
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v40[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v40;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v39;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v38;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v37;
  *(_QWORD *)a2 = v28;
  *(_QWORD *)(a2 + 8) = v29;
  *(_BYTE *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 24) = v27;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v31;
  *(_BYTE *)(a2 + 56) = v32;
  *(_QWORD *)(a2 + 64) = v33;
  *(_BYTE *)(a2 + 72) = v34;
  *(_QWORD *)(a2 + 80) = v35;
  *(_QWORD *)(a2 + 88) = v36;
  *(_QWORD *)(a2 + 96) = v13;
  *(_QWORD *)(a2 + 104) = v25;
  *(_BYTE *)(a2 + 112) = v17;
  *(_QWORD *)(a2 + 120) = v26;
  *(_QWORD *)(a2 + 128) = v18;
  *(_QWORD *)(a2 + 136) = v19;
  *(_BYTE *)(a2 + 144) = v21 & 1;
  *(_QWORD *)(a2 + 152) = v23;
  sub_243135664(v28, v29, v7);
  swift_bridgeObjectRetain();
  sub_243135664(v13, v25, v17);
  swift_bridgeObjectRetain();
  sub_243135664(v18, v20, v22);
  swift_bridgeObjectRetain();
  sub_243135674(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_243135674(v13, v25, v17);
  swift_bridgeObjectRelease();
  sub_243135674(v28, v29, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2431392C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v3 = type metadata accessor for NotesSiriSingleNoteView();
  v4 = (char *)(a2 + *(int *)(v3 + 40));
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 1);
  LOBYTE(v16) = v5;
  v17 = v6;
  LOBYTE(v18) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
  sub_24314106C();
  v7 = sub_243140A78();
  if (!v7)
  {
    v18 = 0u;
    v19 = 0u;
    return sub_243136140((uint64_t)&v18, &qword_257286C80);
  }
  v8 = v7;
  sub_243141228();
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_243139624((uint64_t)&v16), (v10 & 1) != 0))
  {
    sub_2431362D4(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24313A954((uint64_t)&v16);
  if (!*((_QWORD *)&v19 + 1))
    return sub_243136140((uint64_t)&v18, &qword_257286C80);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v12 = v16;
    v13 = (uint64_t *)(a2 + *(int *)(v3 + 44));
    v14 = *v13;
    v15 = v13[1];
    v16 = v14;
    v17 = v15;
    *(_QWORD *)&v18 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257286C88);
    return sub_24314106C();
  }
  return result;
}

uint64_t sub_243139450()
{
  type metadata accessor for NotesSiriSingleNoteView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572865D8);
  return sub_24314106C();
}

unint64_t static NSNotification.SiriNoteTextViewSizeDidChange.getter()
{
  return 0xD000000000000029;
}

id sub_2431394D8()
{
  return (id)sub_243141108();
}

unint64_t static NSNotification.SiriNoteIsLong.getter()
{
  return 0xD00000000000001ALL;
}

id sub_243139520()
{
  return (id)sub_243141108();
}

uint64_t sub_24313954C()
{
  uint64_t result;

  result = sub_243141108();
  qword_257286B78 = result;
  return result;
}

id static NSNotificationName.SiriNoteTextViewSizeDidChange.getter()
{
  return sub_2431395EC(&qword_257286528, (id *)&qword_257286B78);
}

uint64_t sub_24313959C()
{
  uint64_t result;

  result = sub_243141108();
  qword_257286B80 = result;
  return result;
}

id static NSNotificationName.SiriNoteIsLong.getter()
{
  return sub_2431395EC(&qword_257286530, (id *)&qword_257286B80);
}

id sub_2431395EC(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

unint64_t sub_243139624(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_243141210();
  return sub_243139654(a1, v2);
}

unint64_t sub_243139654(uint64_t a1, uint64_t a2)
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
      sub_24313A988(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2494F30A4](v9, a1);
      sub_24313A954((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_243139718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243139760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2431397A4(uint64_t a1, void (*a2)(uint64_t))
{
  type metadata accessor for NotesSiriSingleNoteView();
  sub_243136AC0(a1, a2);
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

uint64_t sub_243139814(uint64_t a1)
{
  return sub_243139830(a1, sub_2431392C4);
}

uint64_t sub_243139824(uint64_t a1)
{
  return sub_243139830(a1, (uint64_t (*)(uint64_t, uint64_t))sub_243139450);
}

uint64_t sub_243139830(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NotesSiriSingleNoteView() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_24313987C()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for NotesSiriSingleNoteView(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v8 = a3[7];
    v9 = (void *)(a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = sub_243140AFC();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = (char *)v4 + v16;
    v18 = (uint64_t)a2 + v16;
    v19 = sub_2431410D8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    v20 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    *v21 = *v22;
    *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
    v23 = a3[11];
    v24 = a3[12];
    v25 = (_QWORD *)((char *)v4 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (char *)v4 + v24;
    v29 = (char *)a2 + v24;
    *v28 = *v29;
    *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
    v30 = a3[13];
    v31 = a3[14];
    v32 = (_QWORD *)((char *)v4 + v30);
    v33 = (uint64_t *)((char *)a2 + v30);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    *((_BYTE *)v4 + v31) = *((_BYTE *)a2 + v31);
    v35 = a3[16];
    *((_BYTE *)v4 + a3[15]) = *((_BYTE *)a2 + a3[15]);
    *(_QWORD *)((char *)v4 + v35) = *(uint64_t *)((char *)a2 + v35);
    v36 = a3[18];
    *(_QWORD *)((char *)v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    *(_QWORD *)((char *)v4 + v36) = *(uint64_t *)((char *)a2 + v36);
    v37 = a3[19];
    v38 = (char *)v4 + v37;
    v39 = (uint64_t)a2 + v37;
    v40 = *(uint64_t *)((char *)a2 + v37 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v40)
    {
      *(_QWORD *)v38 = *(_QWORD *)v39;
      *((_QWORD *)v38 + 1) = v40;
      *((_OWORD *)v38 + 1) = *(_OWORD *)(v39 + 16);
      v38[32] = *(_BYTE *)(v39 + 32);
      v41 = *(_QWORD *)(v39 + 48);
      *((_QWORD *)v38 + 5) = *(_QWORD *)(v39 + 40);
      *((_QWORD *)v38 + 6) = v41;
      v43 = *(void **)(v39 + 56);
      v42 = *(_QWORD *)(v39 + 64);
      *((_QWORD *)v38 + 7) = v43;
      *((_QWORD *)v38 + 8) = v42;
      swift_bridgeObjectRetain();
      swift_retain();
      v44 = v43;
    }
    else
    {
      v45 = *(_OWORD *)(v39 + 48);
      *((_OWORD *)v38 + 2) = *(_OWORD *)(v39 + 32);
      *((_OWORD *)v38 + 3) = v45;
      *((_QWORD *)v38 + 8) = *(_QWORD *)(v39 + 64);
      v46 = *(_OWORD *)(v39 + 16);
      *(_OWORD *)v38 = *(_OWORD *)v39;
      *((_OWORD *)v38 + 1) = v46;
    }
    *((_QWORD *)v38 + 9) = *(_QWORD *)(v39 + 72);
  }
  swift_retain();
  return v4;
}

uint64_t destroy for NotesSiriSingleNoteView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_243140AFC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[8];
  v8 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v9 = a1 + a2[19];
  if (*(_QWORD *)(v9 + 8))
  {
    swift_bridgeObjectRelease();
    swift_release();

  }
  return swift_release();
}

uint64_t initializeWithCopy for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
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
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_243140AFC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  v18 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_BYTE *)v19 = *(_BYTE *)v20;
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  v21 = a3[11];
  v22 = a3[12];
  v23 = (_QWORD *)(a1 + v21);
  v24 = (_QWORD *)(a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = a1 + v22;
  v27 = a2 + v22;
  *(_BYTE *)v26 = *(_BYTE *)v27;
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
  v28 = a3[13];
  v29 = a3[14];
  v30 = (_QWORD *)(a1 + v28);
  v31 = (_QWORD *)(a2 + v28);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  *(_BYTE *)(a1 + v29) = *(_BYTE *)(a2 + v29);
  v33 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v33) = *(_QWORD *)(a2 + v33);
  v34 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + v34) = *(_QWORD *)(a2 + v34);
  v35 = a3[19];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = *(_QWORD *)(a2 + v35 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v38)
  {
    *(_QWORD *)v36 = *(_QWORD *)v37;
    *(_QWORD *)(v36 + 8) = v38;
    *(_OWORD *)(v36 + 16) = *(_OWORD *)(v37 + 16);
    *(_BYTE *)(v36 + 32) = *(_BYTE *)(v37 + 32);
    v39 = *(_QWORD *)(v37 + 48);
    *(_QWORD *)(v36 + 40) = *(_QWORD *)(v37 + 40);
    *(_QWORD *)(v36 + 48) = v39;
    v41 = *(void **)(v37 + 56);
    v40 = *(_QWORD *)(v37 + 64);
    *(_QWORD *)(v36 + 56) = v41;
    *(_QWORD *)(v36 + 64) = v40;
    swift_bridgeObjectRetain();
    swift_retain();
    v42 = v41;
  }
  else
  {
    v43 = *(_OWORD *)(v37 + 48);
    *(_OWORD *)(v36 + 32) = *(_OWORD *)(v37 + 32);
    *(_OWORD *)(v36 + 48) = v43;
    *(_QWORD *)(v36 + 64) = *(_QWORD *)(v37 + 64);
    v44 = *(_OWORD *)(v37 + 16);
    *(_OWORD *)v36 = *(_OWORD *)v37;
    *(_OWORD *)(v36 + 16) = v44;
  }
  *(_QWORD *)(v36 + 72) = *(_QWORD *)(v37 + 72);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_243140AFC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v19 = a3[10];
  v20 = a1 + v19;
  v21 = a2 + v19;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_release();
  v22 = a3[11];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  v25 = a3[12];
  v26 = a1 + v25;
  v27 = a2 + v25;
  *(_BYTE *)v26 = *(_BYTE *)v27;
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
  swift_retain();
  swift_release();
  v28 = a3[13];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)(a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v31 = a3[19];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = *(_QWORD *)(a1 + v31 + 8);
  v35 = *(_QWORD *)(v33 + 8);
  if (v34)
  {
    if (v35)
    {
      *(_QWORD *)v32 = *(_QWORD *)v33;
      *(_QWORD *)(v32 + 8) = *(_QWORD *)(v33 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
      *(_QWORD *)(v32 + 24) = *(_QWORD *)(v33 + 24);
      *(_BYTE *)(v32 + 32) = *(_BYTE *)(v33 + 32);
      *(_QWORD *)(v32 + 40) = *(_QWORD *)(v33 + 40);
      swift_retain();
      swift_release();
      *(_QWORD *)(v32 + 48) = *(_QWORD *)(v33 + 48);
      v36 = *(void **)(v33 + 56);
      v37 = *(void **)(v32 + 56);
      *(_QWORD *)(v32 + 56) = v36;
      v38 = v36;

      *(_QWORD *)(v32 + 64) = *(_QWORD *)(v33 + 64);
    }
    else
    {
      sub_24313A218(v32);
      *(_OWORD *)v32 = *(_OWORD *)v33;
      v42 = *(_OWORD *)(v33 + 32);
      v41 = *(_OWORD *)(v33 + 48);
      v43 = *(_OWORD *)(v33 + 16);
      *(_QWORD *)(v32 + 64) = *(_QWORD *)(v33 + 64);
      *(_OWORD *)(v32 + 32) = v42;
      *(_OWORD *)(v32 + 48) = v41;
      *(_OWORD *)(v32 + 16) = v43;
    }
  }
  else if (v35)
  {
    *(_QWORD *)v32 = *(_QWORD *)v33;
    *(_QWORD *)(v32 + 8) = *(_QWORD *)(v33 + 8);
    *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
    *(_QWORD *)(v32 + 24) = *(_QWORD *)(v33 + 24);
    *(_BYTE *)(v32 + 32) = *(_BYTE *)(v33 + 32);
    *(_QWORD *)(v32 + 40) = *(_QWORD *)(v33 + 40);
    *(_QWORD *)(v32 + 48) = *(_QWORD *)(v33 + 48);
    v39 = *(void **)(v33 + 56);
    *(_QWORD *)(v32 + 56) = v39;
    *(_QWORD *)(v32 + 64) = *(_QWORD *)(v33 + 64);
    swift_bridgeObjectRetain();
    swift_retain();
    v40 = v39;
  }
  else
  {
    *(_OWORD *)v32 = *(_OWORD *)v33;
    v44 = *(_OWORD *)(v33 + 16);
    v45 = *(_OWORD *)(v33 + 32);
    v46 = *(_OWORD *)(v33 + 48);
    *(_QWORD *)(v32 + 64) = *(_QWORD *)(v33 + 64);
    *(_OWORD *)(v32 + 32) = v45;
    *(_OWORD *)(v32 + 48) = v46;
    *(_OWORD *)(v32 + 16) = v44;
  }
  *(_QWORD *)(v32 + 72) = *(_QWORD *)(v33 + 72);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24313A218(uint64_t a1)
{
  destroy for NotesSiriTextEditorWrapper(a1);
  return a1;
}

uint64_t initializeWithTake for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
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
  _OWORD *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_243140AFC();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  v17 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  v18 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  v19 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  *(_QWORD *)(a1 + v19) = *(_QWORD *)(a2 + v19);
  v20 = a3[18];
  *(_QWORD *)(a1 + a3[17]) = *(_QWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  v21 = a3[19];
  v22 = (_OWORD *)(a1 + v21);
  v23 = (_OWORD *)(a2 + v21);
  v24 = v23[3];
  v22[2] = v23[2];
  v22[3] = v24;
  v22[4] = v23[4];
  v25 = v23[1];
  *v22 = *v23;
  v22[1] = v25;
  return a1;
}

uint64_t assignWithTake for NotesSiriSingleNoteView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_243140AFC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v21 = a1 + v20;
  v22 = a2 + v20;
  *(_BYTE *)v21 = *(_BYTE *)v22;
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  swift_release();
  v23 = a3[11];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_release();
  v26 = a3[12];
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_QWORD *)(v27 + 8) = *(_QWORD *)(v28 + 8);
  swift_release();
  v29 = a3[13];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  v34 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v34) = *(_BYTE *)(a2 + v34);
  v35 = a3[17];
  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  *(_QWORD *)(a1 + v35) = *(_QWORD *)(a2 + v35);
  v36 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v37 = a1 + v36;
  v38 = a2 + v36;
  if (!*(_QWORD *)(a1 + v36 + 8))
  {
LABEL_11:
    v41 = *(_OWORD *)(v38 + 48);
    *(_OWORD *)(v37 + 32) = *(_OWORD *)(v38 + 32);
    *(_OWORD *)(v37 + 48) = v41;
    *(_QWORD *)(v37 + 64) = *(_QWORD *)(v38 + 64);
    v42 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)v37 = *(_OWORD *)v38;
    *(_OWORD *)(v37 + 16) = v42;
    goto LABEL_12;
  }
  v39 = *(_QWORD *)(v38 + 8);
  if (!v39)
  {
    sub_24313A218(a1 + v36);
    goto LABEL_11;
  }
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *(_QWORD *)(v37 + 8) = v39;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v37 + 16) = *(_OWORD *)(v38 + 16);
  *(_BYTE *)(v37 + 32) = *(_BYTE *)(v38 + 32);
  *(_QWORD *)(v37 + 40) = *(_QWORD *)(v38 + 40);
  swift_release();
  *(_QWORD *)(v37 + 48) = *(_QWORD *)(v38 + 48);
  v40 = *(void **)(v37 + 56);
  *(_QWORD *)(v37 + 56) = *(_QWORD *)(v38 + 56);

  *(_QWORD *)(v37 + 64) = *(_QWORD *)(v38 + 64);
LABEL_12:
  *(_QWORD *)(v37 + 72) = *(_QWORD *)(v38 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriSingleNoteView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24313A6A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 28);
    }
    else
    {
      v10 = sub_2431410D8();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriSingleNoteView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24313A758(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 28);
    }
    else
    {
      v10 = sub_2431410D8();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_24313A7F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_24313A8D4();
  if (v0 <= 0x3F)
  {
    sub_2431410D8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24313A8D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257286E70)
  {
    sub_243140AFC();
    v0 = sub_2431411EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257286E70);
  }
}

uint64_t sub_24313A928()
{
  return sub_243136430(&qword_257286C78, &qword_257286BA8, MEMORY[0x24BDEDA68]);
}

uint64_t sub_24313A954(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_24313A988(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_24313A9CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286CD8;
  if (!qword_257286CD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286CE0);
    v2[0] = sub_24313AA50();
    v2[1] = sub_243136430(&qword_257286CF0, &qword_257286CF8, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286CD8);
  }
  return result;
}

unint64_t sub_24313AA50()
{
  unint64_t result;

  result = qword_257286CE8;
  if (!qword_257286CE8)
  {
    result = MEMORY[0x2494F3464](MEMORY[0x24BDF52D0], MEMORY[0x24BDF52F8]);
    atomic_store(result, (unint64_t *)&qword_257286CE8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24313AAD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NotesSiriSingleNoteView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24313AB10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_257286D70;
  if (!qword_257286D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286D38);
    v2[2] = &type metadata for NotesSiriTextEditorWrapper;
    v2[3] = sub_24312E054();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_24313ABB4((unint64_t *)&qword_257286828, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286D70);
  }
  return result;
}

uint64_t sub_24313ABB4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2494F3464](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24313ABF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_257286D78;
  if (!qword_257286D78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286D60);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286D80);
    v2[3] = sub_243136344(&qword_257286D88, &qword_257286D80, (uint64_t (*)(void))sub_24313ACC8, MEMORY[0x24BDECC60]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_24313ABB4((unint64_t *)&qword_257286828, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286D78);
  }
  return result;
}

unint64_t sub_24313ACC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286D90;
  if (!qword_257286D90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286D98);
    v2[0] = sub_24313AD4C();
    v2[1] = sub_243136430(&qword_257286A08, &qword_257286A10, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286D90);
  }
  return result;
}

unint64_t sub_24313AD4C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286DA0;
  if (!qword_257286DA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286DA8);
    v2[0] = sub_24313ADD0();
    v2[1] = sub_243136430(&qword_257286A20, &qword_257286A28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286DA0);
  }
  return result;
}

unint64_t sub_24313ADD0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286DB0;
  if (!qword_257286DB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286DB8);
    v2[0] = sub_243136430(&qword_257286DC0, &qword_257286DC8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286DB0);
  }
  return result;
}

unint64_t sub_24313AE54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257286DD0;
  if (!qword_257286DD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286D48);
    v2[0] = sub_243136344(&qword_257286D68, &qword_257286D40, (uint64_t (*)(void))sub_24313AB10, MEMORY[0x24BDECC60]);
    v2[1] = sub_24313AB10();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257286DD0);
  }
  return result;
}

uint64_t sub_24313AEE0(uint64_t a1)
{
  sub_24313AF64(*(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232), *(_QWORD *)(a1 + 240), *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280), *(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 296),
    *(_QWORD *)(a1 + 304),
    *(_QWORD *)(a1 + 312),
    *(_QWORD *)(a1 + 320),
    *(_QWORD *)(a1 + 328),
    *(_QWORD *)(a1 + 336),
    *(_BYTE *)(a1 + 344));
  return a1;
}

uint64_t sub_24313AF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25)
{
  sub_243135674(a4, a5, a6 & 1);
  if ((a25 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_243135674(a16, a17, a18 & 1);
    swift_bridgeObjectRelease();
    sub_243135674(a20, a21, a22 & 1);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_243135674(a21, a22, a23 & 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24313B050(uint64_t a1)
{
  sub_24313AF64(*(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232), *(_QWORD *)(a1 + 240), *(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 264), *(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280), *(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 296), *(_QWORD *)(a1 + 304), *(_QWORD *)(a1 + 312), *(_QWORD *)(a1 + 320),
    *(_QWORD *)(a1 + 328),
    *(_QWORD *)(a1 + 336),
    *(_QWORD *)(a1 + 344),
    *(_QWORD *)(a1 + 352),
    *(_QWORD *)(a1 + 360),
    *(_BYTE *)(a1 + 368));
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_24313B0E4(uint64_t a1)
{
  sub_24313AF64(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    *(_BYTE *)(a1 + 256));
  return a1;
}

uint64_t sub_24313B158(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 280);
  a2(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 200), *(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 216), *(_QWORD *)(a1 + 224), *(_QWORD *)(a1 + 232),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    *(_QWORD *)(a1 + 256),
    *(_QWORD *)(a1 + 264),
    *(_QWORD *)(a1 + 272),
    v4);
  return a1;
}

uint64_t sub_24313B1DC(uint64_t result)
{
  *(_BYTE *)(result + 192) = 1;
  return result;
}

uint64_t sub_24313B1E8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 192);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    v4);
  return a1;
}

uint64_t sub_24313B25C(uint64_t result)
{
  *(_BYTE *)(result + 192) = 0;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)type metadata accessor for NotesSiriSingleNoteView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + v1[7];
  v5 = sub_243140AFC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = v3 + v1[8];
  v8 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v9 = v3 + v1[19];
  if (*(_QWORD *)(v9 + 8))
  {
    swift_bridgeObjectRelease();
    swift_release();

  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24313B3B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for NotesSiriSingleNoteView() - 8) + 80);
  return sub_243136F88(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_24313B3E8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_24313B3F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24313B41C(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_24313B430()
{
  uint64_t v0;

  v0 = sub_243140C4C();
  __swift_allocate_value_buffer(v0, qword_257286E10);
  __swift_project_value_buffer(v0, (uint64_t)qword_257286E10);
  return sub_243140C34();
}

uint64_t sub_24313B478(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24313B4E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_24313B534(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243136270(a1, (uint64_t)v6, &qword_257286668);
  v7 = *a2 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  sub_24313EB0C((uint64_t)v6, v7, &qword_257286668);
  return swift_endAccess();
}

uint64_t sub_24313B5EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  return sub_243136270(v3, a1, &qword_257286668);
}

uint64_t sub_24313B644(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v10;
  id v11;
  uint64_t v12;

  swift_bridgeObjectRetain();
  v10 = a2;
  v11 = a3;
  v12 = sub_243134444(a1, v11, a4, a5, v10);

  swift_bridgeObjectRelease();
  return v12;
}

void sub_24313B6D4(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  id v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void *v48;
  id v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void (*v55)(char *, uint64_t);
  uint64_t *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  void (*v81)(char *, uint64_t);
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  uint64_t v84;
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  void (*v93)(char *, uint64_t);
  void (*v94)(char *, uint64_t);
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  id v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t *v120;
  uint64_t v121;
  void *v122;

  v114 = a4;
  v115 = a5;
  v113 = a3;
  v111 = a2;
  v120 = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v117 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v106 - v11;
  v13 = sub_243140AFC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v119 = (char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v110 = (char *)&v106 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v108 = (char *)&v106 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v106 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v112 = (char *)&v106 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v106 - v26;
  v29 = *a1;
  v28 = a1[1];
  sub_243140AF0();
  v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (v30((uint64_t)v12, 1, v13) != 1)
  {
    v109 = v6;
    v118 = v14;
    v37 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v116 = v13;
    v37(v27, v12, v13);
    v38 = (void *)objc_opt_self();
    v39 = (void *)sub_243140AD8();
    v40 = objc_msgSend(v38, sel_isShowHTMLNoteURL_, v39);

    if (!v40)
      goto LABEL_17;
    v107 = v27;
    v41 = (void *)sub_243140AD8();
    v42 = objc_msgSend(v38, sel_objectIDURIRepresentationForHTMLNoteMentionedInURL_, v41);

    if (v42)
    {
      sub_243140AE4();

      v43 = (uint64_t)v117;
      v44 = v23;
      v45 = v116;
      v37(v117, v44, v116);
      v46 = v118;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v118 + 56))(v43, 0, 1, v45);
      if (v30(v43, 1, v45) != 1)
      {
        v47 = v112;
        v37(v112, (char *)v43, v45);
        v48 = (void *)sub_243140AD8();
        v49 = v111;
        v50 = (char *)objc_msgSend(v111, sel_ic_objectIDFromURL_, v48);

        if (v50)
        {
          MEMORY[0x24BDAC7A8](v51);
          *(&v106 - 2) = (uint64_t)v49;
          *(&v106 - 1) = (uint64_t)v50;
          __swift_instantiateConcreteTypeFromMangledName(&qword_257287138);
          sub_2431411BC();
          v52 = (uint64_t)v122;
          if (v122)
          {
            type metadata accessor for NoteViewModel();
            v36 = swift_allocObject();
            v53 = v114;
            swift_bridgeObjectRetain();
            v54 = v49;
            sub_24313D830(v52, v54, v113, v53);

            v55 = *(void (**)(char *, uint64_t))(v118 + 8);
            v55(v47, v45);
            v55(v107, v45);
            goto LABEL_27;
          }
          v119 = v50;
          v96 = v107;
          v97 = v118;
          if (qword_257286538 != -1)
            swift_once();
          v98 = sub_243140C4C();
          __swift_project_value_buffer(v98, (uint64_t)qword_257286E10);
          v99 = v108;
          (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v108, v96, v45);
          v100 = sub_243140C40();
          v101 = sub_24314118C();
          if (os_log_type_enabled(v100, v101))
          {
            v102 = (uint8_t *)swift_slowAlloc();
            v103 = swift_slowAlloc();
            v122 = (void *)v103;
            *(_DWORD *)v102 = 136315138;
            v117 = (char *)(v102 + 4);
            sub_24313EA08();
            v104 = sub_24314127C();
            v121 = sub_243133BB4(v104, v105, (uint64_t *)&v122);
            sub_2431411F8();
            swift_bridgeObjectRelease();
            v93 = *(void (**)(char *, uint64_t))(v118 + 8);
            v93(v99, v45);
            _os_log_impl(&dword_24312A000, v100, v101, "HTML note not found with url: %s", v102, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2494F34F4](v103, -1, -1);
            MEMORY[0x2494F34F4](v102, -1, -1);

            v93(v112, v45);
            goto LABEL_39;
          }

          v94 = *(void (**)(char *, uint64_t))(v97 + 8);
          v94(v99, v45);
          v94(v47, v45);
          v95 = v96;
          goto LABEL_41;
        }
        (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
        goto LABEL_16;
      }
    }
    else
    {
      v43 = (uint64_t)v117;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v118 + 56))(v117, 1, 1, v116);
    }
    sub_243136140(v43, &qword_257286668);
LABEL_16:
    v27 = v107;
LABEL_17:
    v57 = (void *)sub_243140AD8();
    v58 = objc_msgSend(v38, sel_isShowNoteURL_, v57);

    if (!v58
      || (v59 = (void *)sub_243140AD8(),
          v60 = objc_msgSend(v38, sel_NotesAppIDForNoteMentionedInURL_, v59),
          v59,
          !v60))
    {
      v70 = v116;
      if (qword_257286538 != -1)
        swift_once();
      v71 = sub_243140C4C();
      __swift_project_value_buffer(v71, (uint64_t)qword_257286E10);
      v72 = v118;
      v73 = v119;
      (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v119, v27, v70);
      v74 = sub_243140C40();
      v75 = sub_24314118C();
      if (os_log_type_enabled(v74, v75))
      {
        v76 = (uint8_t *)swift_slowAlloc();
        v77 = swift_slowAlloc();
        v107 = v27;
        v78 = v77;
        v122 = (void *)v77;
        *(_DWORD *)v76 = 136315138;
        v117 = (char *)(v76 + 4);
        sub_24313EA08();
        v79 = sub_24314127C();
        v121 = sub_243133BB4(v79, v80, (uint64_t *)&v122);
        sub_2431411F8();
        swift_bridgeObjectRelease();
        v81 = *(void (**)(char *, uint64_t))(v72 + 8);
        v81(v73, v70);
        _os_log_impl(&dword_24312A000, v74, v75, "UUID invalid: %s", v76, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2494F34F4](v78, -1, -1);
        MEMORY[0x2494F34F4](v76, -1, -1);

        v81(v107, v70);
      }
      else
      {

        v82 = *(void (**)(char *, uint64_t))(v72 + 8);
        v82(v73, v70);
        v82(v27, v70);
      }
      v36 = 0;
      goto LABEL_27;
    }
    v61 = sub_243141114();
    v63 = v62;

    MEMORY[0x24BDAC7A8](v64);
    *(&v106 - 4) = v61;
    *(&v106 - 3) = v63;
    v65 = v115;
    *(&v106 - 2) = (uint64_t)v115;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257287130);
    v66 = v109;
    sub_2431411BC();
    swift_bridgeObjectRelease();
    v67 = v122;
    v45 = v116;
    if (v122)
    {
      type metadata accessor for NoteViewModel();
      v36 = swift_allocObject();
      v68 = v114;
      swift_bridgeObjectRetain();
      v69 = v65;
      sub_24313C3D8(v67, v69, v113, v68);
      (*(void (**)(char *, uint64_t))(v118 + 8))(v27, v45);
      goto LABEL_27;
    }
    v83 = v118;
    if (qword_257286538 != -1)
      swift_once();
    v84 = sub_243140C4C();
    __swift_project_value_buffer(v84, (uint64_t)qword_257286E10);
    v85 = v110;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v110, v27, v45);
    v86 = sub_243140C40();
    v87 = sub_24314118C();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc();
      v89 = swift_slowAlloc();
      v109 = v66;
      v90 = v89;
      v122 = (void *)v89;
      v107 = v27;
      *(_DWORD *)v88 = 136315138;
      sub_24313EA08();
      v91 = sub_24314127C();
      v121 = sub_243133BB4(v91, v92, (uint64_t *)&v122);
      sub_2431411F8();
      swift_bridgeObjectRelease();
      v93 = *(void (**)(char *, uint64_t))(v118 + 8);
      v93(v85, v45);
      _os_log_impl(&dword_24312A000, v86, v87, "Modern note not found with url: %s", v88, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494F34F4](v90, -1, -1);
      MEMORY[0x2494F34F4](v88, -1, -1);

LABEL_39:
      v93(v107, v45);
      goto LABEL_6;
    }

    v94 = *(void (**)(char *, uint64_t))(v83 + 8);
    v94(v85, v45);
    v95 = v27;
LABEL_41:
    v94(v95, v45);
    goto LABEL_6;
  }
  sub_243136140((uint64_t)v12, &qword_257286668);
  if (qword_257286538 != -1)
    swift_once();
  v31 = sub_243140C4C();
  __swift_project_value_buffer(v31, (uint64_t)qword_257286E10);
  swift_bridgeObjectRetain_n();
  v32 = sub_243140C40();
  v33 = sub_24314118C();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v122 = (void *)v35;
    *(_DWORD *)v34 = 136315138;
    swift_bridgeObjectRetain();
    v121 = sub_243133BB4(v29, v28, (uint64_t *)&v122);
    sub_2431411F8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24312A000, v32, v33, "URL invalid with identifier: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494F34F4](v35, -1, -1);
    MEMORY[0x2494F34F4](v34, -1, -1);

LABEL_6:
    v36 = 0;
LABEL_27:
    v56 = v120;
    goto LABEL_28;
  }

  swift_bridgeObjectRelease_n();
  v36 = 0;
  v56 = v120;
LABEL_28:
  *v56 = v36;
}

void sub_24313C2C4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(a1, sel_ic_existingObjectWithID_, a2);
  if (v4)
  {
    v5 = v4;
    v6 = swift_dynamicCastObjCProtocolConditional();
    if (v6)
    {
      *a3 = v6;
      return;
    }

  }
  *a3 = 0;
}

void sub_24313C33C(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  void *ObjCClassFromMetadata;
  void *v5;
  id v6;

  sub_24312E204(0, &qword_257286670);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v5 = (void *)sub_243141108();
  v6 = objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v5, a1);

  *a2 = v6;
}

uint64_t sub_24313C3D8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t result;
  _QWORD v25[6];

  sub_243140AC0();
  v9 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *v10 = 0;
  v10[1] = 0xE000000000000000;
  v11 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *v11 = 0;
  v11[1] = 0xE000000000000000;
  v12 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *v12 = 0;
  v12[1] = 0xE000000000000000;
  sub_243140B20();
  sub_243140B20();
  v13 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *v13 = 0;
  v13[1] = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 1;
  v14 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  v15 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  v17 = sub_243140A84();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  v18(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, 1, 1, v17);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a1;
  v19[3] = v4;
  v19[4] = a3;
  v19[5] = a4;
  v19[6] = a2;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_24313EB8C;
  *(_QWORD *)(v20 + 24) = v19;
  v25[4] = sub_24313EBEC;
  v25[5] = v20;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 1107296256;
  v25[2] = sub_24313D810;
  v25[3] = &block_descriptor_15;
  v21 = _Block_copy(v25);
  v22 = a1;
  swift_retain();
  v23 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(v23, sel_performBlockAndWait_, v21);

  _Block_release(v21);
  LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v23 & 1) == 0)
    return v4;
  __break(1u);
  return result;
}

void sub_24313C69C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  uint64_t v71;
  void (*v72)(uint64_t, char *, uint64_t);
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  id v81;
  uint64_t *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  uint64_t v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int (*v107)(char *, uint64_t, uint64_t);
  uint64_t v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  void *v120;
  char *v121;
  uint64_t v122;
  void (*v123)(char *, uint64_t);
  unsigned int (*v124)(char *, uint64_t, uint64_t);
  void (*v125)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v126;
  id v127;
  id v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  char *v140;

  v133 = a5;
  v134 = a4;
  v135 = a3;
  v136 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286E30);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v132 = (char *)&v124 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v130 = (char *)&v124 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572871A0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v124 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v124 - v14;
  v16 = sub_243140B2C();
  v139 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v137 = (char *)&v124 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v124 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v138 = (char *)&v124 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v131 = (char *)&v124 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v124 - v26;
  v28 = sub_243140AFC();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v124 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v140 = (char *)&v124 - v33;
  v34 = objc_msgSend(a1, sel_identifier);
  if (!v34)
    return;
  v35 = v34;
  v129 = v16;
  v36 = (id)NotesAppURLForNoteIdentifier();

  if (!v36)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v27, 1, 1, v28);
    goto LABEL_13;
  }
  sub_243140AE4();

  v37 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
  v37(v27, v32, v28);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v27, 0, 1, v28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
LABEL_13:
    v79 = &qword_257286668;
    v80 = (uint64_t)v27;
LABEL_14:
    sub_243136140(v80, v79);
    return;
  }
  v38 = v140;
  v37(v140, v27, v28);
  v39 = objc_msgSend(a1, sel_title);
  if (!v39)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v38, v28);
    return;
  }
  v40 = v39;
  v126 = sub_243141114();
  v42 = v41;

  v43 = objc_msgSend(a1, sel_folder);
  if (!v43)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v38, v28);
    swift_bridgeObjectRelease();
    return;
  }
  v127 = v42;
  v128 = v43;
  v44 = objc_msgSend(a1, sel_creationDate);
  if (!v44)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v139 + 56))(v15, 1, 1, v129);
    goto LABEL_20;
  }
  v45 = v44;
  sub_243140B14();

  v46 = v139;
  v47 = v129;
  v48 = *(void (**)(char *, char *, uint64_t))(v139 + 32);
  v48(v15, v21, v129);
  v125 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
  v125(v15, 0, 1, v47);
  v124 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48);
  if (v124(v15, 1, v47) == 1)
  {
LABEL_20:

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v140, v28);
    v79 = &qword_2572871A0;
    v80 = (uint64_t)v15;
    goto LABEL_14;
  }
  v48(v138, v15, v47);
  v49 = objc_msgSend(a1, sel_modificationDate);
  if (!v49)
  {
    v125(v13, 1, 1, v47);
    goto LABEL_22;
  }
  v50 = v49;
  sub_243140B14();

  v48(v13, v21, v47);
  v125(v13, 0, 1, v47);
  if (v124(v13, 1, v47) == 1)
  {
LABEL_22:

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v139 + 8))(v138, v47);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v140, v28);
    v79 = &qword_2572871A0;
    v80 = (uint64_t)v13;
    goto LABEL_14;
  }
  v48(v137, v13, v47);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v32, v140, v28);
  v51 = v136;
  v52 = v136 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 40))(v52, v32, v28);
  swift_endAccess();
  v53 = (uint64_t *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  v54 = v126;
  v126 = (uint64_t)v53;
  v55 = (uint64_t)v127;
  *v53 = v54;
  v53[1] = v55;
  swift_bridgeObjectRelease();
  v56 = v128;
  v57 = objc_msgSend(v128, sel_localizedTitle);
  v58 = v47;
  v59 = sub_243141114();
  v61 = v60;

  v62 = (uint64_t *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *v62 = v59;
  v62[1] = v61;
  swift_bridgeObjectRelease();
  v63 = objc_msgSend(v56, sel_account);
  v64 = objc_msgSend(v63, sel_localizedName);

  v65 = sub_243141114();
  v67 = v66;

  v68 = (uint64_t *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *v68 = v65;
  v68[1] = v67;
  swift_bridgeObjectRelease();
  v69 = v139;
  v70 = *(void (**)(char *, char *, uint64_t))(v139 + 16);
  v70(v21, v138, v58);
  v71 = v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  swift_beginAccess();
  v72 = *(void (**)(uint64_t, char *, uint64_t))(v69 + 40);
  v72(v71, v21, v58);
  swift_endAccess();
  v70(v21, v137, v58);
  v73 = v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
  swift_beginAccess();
  v72(v73, v21, v58);
  swift_endAccess();
  v74 = objc_msgSend((id)objc_opt_self(), sel_dateForCurrentSortTypeAccessibilityStringForNote_folderNoteSortType_, a1, 0);
  if (v74)
  {
    v75 = v74;
    v76 = sub_243141114();
    v78 = v77;

  }
  else
  {
    v76 = 0;
    v78 = 0xE000000000000000;
  }
  v81 = v134;
  v82 = (uint64_t *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *v82 = v76;
  v82[1] = v78;
  swift_bridgeObjectRelease();
  v83 = objc_msgSend(a1, sel_contentInfoText);
  v84 = sub_243141114();
  v86 = v85;

  v87 = (uint64_t *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *v87 = v84;
  v87[1] = v86;
  swift_bridgeObjectRelease();
  v88 = objc_msgSend(a1, sel_isPasswordProtected);
  *(_BYTE *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = v88;
  v89 = objc_msgSend(a1, sel_isAuthenticated);
  *(_BYTE *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = v89;
  v90 = objc_msgSend(a1, sel_isUnsupported);
  *(_BYTE *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = v90;
  v91 = objc_msgSend(a1, sel_isSharedViaICloud);
  *(_BYTE *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = v91;
  v92 = objc_msgSend(a1, sel_hasUnreadChanges);
  *(_BYTE *)(v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = v92;
  v93 = v129;
  if (!v81)
    goto LABEL_30;
  v94 = objc_msgSend(a1, sel_noteAsPlainTextWithoutTitle);
  if (!v94)
  {
    sub_243141114();
    v94 = (id)sub_243141108();
    swift_bridgeObjectRelease();
  }
  v95 = objc_msgSend(v94, sel_ic_whitespaceAndNewlineCoalescedString);

  sub_243141114();
  v96 = objc_allocWithZone(MEMORY[0x24BE6DF28]);
  swift_bridgeObjectRetain();
  v97 = (void *)sub_243141108();
  swift_bridgeObjectRelease();
  v98 = objc_msgSend(v96, sel_initWithSearchString_, v97);

  v99 = (void *)sub_243141108();
  v100 = objc_msgSend(v98, sel_firstMatchInDocumentWithGlobalFallback_, v99);

  v101 = (void *)objc_opt_self();
  v102 = (void *)sub_243141108();
  v127 = (id)objc_opt_self();
  v103 = objc_msgSend(v127, sel_ICTintColor);
  v134 = v101;
  v104 = objc_msgSend(v101, sel_attributedStringWithMatchHighlighted_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v102, v100, v103, v98, 0.0, 0.0, 286.0, 20.0);

  if (!v104)
  {
    __break(1u);
    goto LABEL_34;
  }
  v105 = (uint64_t)v130;
  sub_243140A90();

  v106 = sub_243140A84();
  v107 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 56);
  v125 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v106;
  v124 = v107;
  v107((char *)v105, 0, 1);
  swift_bridgeObjectRelease();
  v108 = v136 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
  swift_beginAccess();
  sub_24313EB0C(v105, v108, &qword_257286E30);
  swift_endAccess();
  v109 = objc_allocWithZone(MEMORY[0x24BE6DF28]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v110 = (void *)sub_243141108();
  swift_bridgeObjectRelease();
  v111 = objc_msgSend(v109, sel_initWithSearchString_, v110);

  v112 = (void *)sub_243141108();
  v113 = objc_msgSend(v111, sel_firstMatchInDocumentWithGlobalFallback_, v112);

  v114 = (void *)sub_243141108();
  v115 = objc_msgSend(v127, sel_ICTintColor);
  v116 = objc_msgSend(v134, sel_attributedStringWithMatchHighlighted_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v114, v113, v115, v111, 0.0, 0.0, 286.0, 20.0);

  if (!v116)
  {
LABEL_34:
    __break(1u);
    return;
  }
  v117 = (uint64_t)v132;
  sub_243140A90();

  ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD))v124)(v117, 0, 1, v125);
  swift_bridgeObjectRelease();
  v51 = v136;
  v118 = v136 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  swift_beginAccess();
  sub_24313EB0C(v117, v118, &qword_257286E30);
  swift_endAccess();
  v93 = v129;
LABEL_30:
  objc_msgSend(a1, sel_updateThumbnailAttachmentIdentifier);
  v119 = objc_msgSend(a1, sel_thumbnailAttachmentIdentifier);
  if (v119)
  {
    v120 = v119;
    sub_243141114();

    type metadata accessor for NoteViewModel();
    v121 = v131;
    sub_24313D39C(v133, v131);
    swift_bridgeObjectRelease();
    v122 = v51 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
    swift_beginAccess();
    sub_24313EB0C((uint64_t)v121, v122, &qword_257286668);
    swift_endAccess();
  }

  v123 = *(void (**)(char *, uint64_t))(v139 + 8);
  v123(v137, v93);
  v123(v138, v93);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v140, v28);
}

uint64_t sub_24313D39C@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *ObjCClassFromMetadata;
  void *v12;
  id v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;

  v4 = sub_243140AFC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24312E204(0, &qword_2572871A8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v12 = (void *)sub_243141108();
  v13 = objc_msgSend(ObjCClassFromMetadata, sel_cloudObjectWithIdentifier_context_, v12, a1);

  if (!v13)
  {
    if (qword_257286538 != -1)
      swift_once();
    v23 = sub_243140C4C();
    __swift_project_value_buffer(v23, (uint64_t)qword_257286E10);
    v24 = sub_243140C40();
    v25 = sub_24314118C();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_24312A000, v24, v25, "Cannot create attachment for identifier — returning nil preview image", v26, 2u);
      MEMORY[0x2494F34F4](v26, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
  objc_msgSend((id)objc_opt_self(), sel_ic_scale);
  v15 = objc_msgSend(v13, sel_attachmentPreviewImageWithMinSize_scale_, 25.0, 25.0, v14);
  if (!v15)
  {
    if (qword_257286538 != -1)
      swift_once();
    v27 = sub_243140C4C();
    __swift_project_value_buffer(v27, (uint64_t)qword_257286E10);
    v28 = sub_243140C40();
    v29 = sub_24314118C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_24312A000, v28, v29, "Cannot create preview image for attachment — returning nil preview image", v30, 2u);
      MEMORY[0x2494F34F4](v30, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
  v16 = v15;
  v17 = objc_msgSend(v15, sel_previewImageURL);
  if (!v17)
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v20(v10, 1, 1, v4);
    goto LABEL_18;
  }
  v18 = v17;
  sub_243140AE4();

  v19 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v19(v10, v7, v4);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v20(v10, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
LABEL_18:
    sub_243136140((uint64_t)v10, &qword_257286668);
    if (qword_257286538 != -1)
      swift_once();
    v32 = sub_243140C4C();
    __swift_project_value_buffer(v32, (uint64_t)qword_257286E10);
    v33 = sub_243140C40();
    v34 = sub_24314118C();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_24312A000, v33, v34, "Cannot get previewImageURL for preview image - returning nil preview image", v35, 2u);
      MEMORY[0x2494F34F4](v35, -1, -1);
    }

    v21 = a2;
    v22 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v21, v22, 1, v4);
  }

  v19(a2, v10, v4);
  v21 = a2;
  v22 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v21, v22, 1, v4);
}

uint64_t sub_24313D810(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_24313D830(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  _QWORD v23[6];

  sub_243140AC0();
  v9 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *v10 = 0;
  v10[1] = 0xE000000000000000;
  v11 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  *v11 = 0;
  v11[1] = 0xE000000000000000;
  v12 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
  *v12 = 0;
  v12[1] = 0xE000000000000000;
  sub_243140B20();
  sub_243140B20();
  v13 = (_QWORD *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *v13 = 0;
  v13[1] = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isPasswordProtected) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isAuthenticated) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isUnsupported) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isShared) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_hasUnreadChanges) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 1;
  v14 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  v15 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
  v17 = sub_243140A84();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  v18(v4 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, 1, 1, v17);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a1;
  v19[3] = v4;
  v19[4] = a3;
  v19[5] = a4;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_24313EAB8;
  *(_QWORD *)(v20 + 24) = v19;
  v23[4] = sub_24313EAD4;
  v23[5] = v20;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 1107296256;
  v23[2] = sub_24313D810;
  v23[3] = &block_descriptor_0;
  v21 = _Block_copy(v23);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a2, sel_performBlockAndWait_, v21);
  swift_unknownObjectRelease();

  _Block_release(v21);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) == 0)
    return v4;
  __break(1u);
  return result;
}

void sub_24313DAEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  void (*v25)(char *, char *, uint64_t);
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, char *, uint64_t);
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  void (*v49)(_QWORD, _QWORD, _QWORD);
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, char *, id);
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  id v97;
  void (*v98)(_QWORD, _QWORD, _QWORD);
  uint64_t v99;
  uint64_t v100;
  id v101;
  id v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;

  v105 = a3;
  v106 = a4;
  v107 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286E30);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v104 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v103 = (char *)&v95 - v8;
  v9 = (_QWORD *)sub_243140B2C();
  v10 = *(v9 - 1);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_243140AFC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v95 - v21;
  v23 = objc_msgSend((id)objc_opt_self(), sel_appURLForHTMLNote_, a1);
  if (!v23)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    goto LABEL_11;
  }
  v24 = v23;
  sub_243140AE4();

  v25 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  v25(v15, v20, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
LABEL_11:
    sub_243136140((uint64_t)v15, &qword_257286668);
    return;
  }
  v25(v22, v15, v16);
  v26 = objc_msgSend(a1, sel_title);
  if (!v26)
  {
LABEL_17:
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
    return;
  }
  v27 = v26;
  v101 = v9;
  v100 = sub_243141114();
  v28 = a1;
  v30 = v29;

  v31 = objc_msgSend(objc_msgSend(v28, sel_folder), sel_name);
  swift_unknownObjectRelease();
  if (!v31)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v102 = v30;
  v99 = sub_243141114();
  v33 = v32;

  v34 = objc_msgSend(objc_msgSend(v28, sel_account), sel_localizedName);
  swift_unknownObjectRelease();
  if (!v34)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v35 = v28;
  v36 = v33;
  v96 = sub_243141114();
  v98 = v37;

  v109 = &unk_2572A8278;
  v97 = (id)swift_dynamicCastObjCProtocolConditional();
  if (!v97)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v38 = v35;
  v39 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v95 = v22;
  v39(v20, v22, v16);
  v40 = v107;
  v41 = v107 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  swift_beginAccess();
  v42 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 40);
  swift_unknownObjectRetain();
  v42(v41, v20, v16);
  swift_endAccess();
  v43 = (uint64_t *)(v40 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  v44 = v100;
  v100 = (uint64_t)v43;
  v45 = (uint64_t)v102;
  *v43 = v44;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v46 = (uint64_t *)(v40 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_folder);
  *v46 = v99;
  v46[1] = v36;
  swift_bridgeObjectRelease();
  v47 = v40;
  v48 = (uint64_t *)(v40 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_account);
  v49 = v98;
  *v48 = v96;
  v48[1] = (uint64_t)v49;
  swift_bridgeObjectRelease();
  v108 = &unk_2572A8278;
  v50 = swift_dynamicCastObjCProtocolConditional();
  v51 = v101;
  if (v50)
  {
    v52 = v50;
    v53 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v54 = objc_msgSend(v53, sel_dateForCurrentSortTypeAccessibilityStringForNote_folderNoteSortType_, v52, 0);
    if (v54)
    {
      v55 = v54;
      v56 = sub_243141114();
      v58 = v57;

    }
    else
    {
      v56 = 0;
      v58 = 0xE000000000000000;
    }
    v47 = v107;
    v59 = (uint64_t *)(v107 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_axDateString);
    *v59 = v56;
    v59[1] = v58;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  v60 = objc_msgSend(v38, sel_creationDate);
  sub_243140B14();

  v61 = v47;
  v62 = v47 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  swift_beginAccess();
  v63 = *(void (**)(uint64_t, char *, id))(v10 + 40);
  v63(v62, v12, v51);
  swift_endAccess();
  v64 = objc_msgSend(v38, sel_modificationDate);
  sub_243140B14();

  v65 = v47 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate;
  swift_beginAccess();
  v63(v65, v12, v51);
  swift_endAccess();
  v66 = v97;
  v67 = objc_msgSend(v97, sel_contentInfoText);
  v68 = sub_243141114();
  v70 = v69;

  v71 = (uint64_t *)(v61 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_subtitleSnippet);
  *v71 = v68;
  v71[1] = v70;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v61 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_isModernNote) = 0;
  if (v106)
  {
    v72 = objc_msgSend(v66, sel_noteAsPlainTextWithoutTitle);
    sub_243141114();

    v73 = objc_allocWithZone(MEMORY[0x24BE6DF28]);
    swift_bridgeObjectRetain();
    v74 = (void *)sub_243141108();
    swift_bridgeObjectRelease();
    v75 = objc_msgSend(v73, sel_initWithSearchString_, v74);

    v76 = (void *)sub_243141108();
    v77 = objc_msgSend(v75, sel_firstMatchInDocumentWithGlobalFallback_, v76);

    v78 = (void *)objc_opt_self();
    v79 = (void *)sub_243141108();
    v101 = (id)objc_opt_self();
    v80 = objc_msgSend(v101, sel_ICTintColor);
    v102 = v78;
    v81 = objc_msgSend(v78, sel_attributedStringWithMatchHighlighted_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v79, v77, v80, v75, 0.0, 0.0, 286.0, 20.0);

    if (v81)
    {
      v82 = (uint64_t)v103;
      sub_243140A90();

      v83 = sub_243140A84();
      v98 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v83 - 8) + 56);
      v99 = v83;
      v98(v82, 0, 1);
      swift_bridgeObjectRelease();
      v84 = v107 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet;
      swift_beginAccess();
      sub_24313EB0C(v82, v84, &qword_257286E30);
      swift_endAccess();
      v85 = objc_allocWithZone(MEMORY[0x24BE6DF28]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v86 = (void *)sub_243141108();
      swift_bridgeObjectRelease();
      v87 = objc_msgSend(v85, sel_initWithSearchString_, v86);

      v88 = (void *)sub_243141108();
      v89 = objc_msgSend(v87, sel_firstMatchInDocumentWithGlobalFallback_, v88);

      v90 = (void *)sub_243141108();
      v91 = objc_msgSend(v101, sel_ICTintColor);
      v92 = objc_msgSend(v102, sel_attributedStringWithMatchHighlighted_textCheckingResult_highlightColor_insideFrame_finishingUpRegexMatchFinder_, v90, v89, v91, v87, 0.0, 0.0, 286.0, 20.0);

      if (v92)
      {
        v93 = (uint64_t)v104;
        sub_243140A90();

        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v98)(v93, 0, 1, v99);
        swift_bridgeObjectRelease();
        v94 = v107 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle;
        swift_beginAccess();
        sub_24313EB0C(v93, v94, &qword_257286E30);
        swift_endAccess();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v95, v16);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v95, v16);
    swift_unknownObjectRelease();
  }
}

uint64_t NoteViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_noteUrl;
  v2 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_creationDate;
  v4 = sub_243140B2C();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_modificationDate, v4);
  swift_bridgeObjectRelease();
  sub_243136140(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail, &qword_257286668);
  sub_243136140(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedTitle, &qword_257286E30);
  sub_243136140(v0 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_highlightedSnippet, &qword_257286E30);
  return v0;
}

uint64_t NoteViewModel.__deallocating_deinit()
{
  NoteViewModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24313E5F8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_title);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24313E650@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC11NotesSiriUI13NoteViewModel_thumbnail;
  swift_beginAccess();
  return sub_243136270(v3, a2, &qword_257286668);
}

uint64_t sub_24313E6B0()
{
  return type metadata accessor for NoteViewModel();
}

uint64_t type metadata accessor for NoteViewModel()
{
  uint64_t result;

  result = qword_257286E60;
  if (!qword_257286E60)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24313E6F4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_243140AFC();
  if (v0 <= 0x3F)
  {
    sub_243140B2C();
    if (v1 <= 0x3F)
    {
      sub_24313E82C(319, (unint64_t *)&qword_257286E70, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      if (v2 <= 0x3F)
      {
        sub_24313E82C(319, qword_257286E78, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for NoteViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NoteViewModel.title.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of NoteViewModel.thumbnail.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of static NoteViewModel.models(with:modernContext:htmlContext:query:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 624))();
}

void sub_24313E82C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2431411EC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_24313E878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287120);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_243140B50();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243136270(a3, (uint64_t)v6, &qword_257287120);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_243140B44();
    sub_243136140((uint64_t)v6, &qword_257287120);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  }
  objc_msgSend((id)objc_opt_self(), sel_currentNoteListSortType);
  v11 = sub_243140B08();
  sub_243140B08();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_24313EA08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257287128;
  if (!qword_257287128)
  {
    v1 = sub_243140AFC();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_257287128);
  }
  return result;
}

void sub_24313EA50(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_24313C33C(*(_QWORD *)(v1 + 32), a1);
}

void sub_24313EA6C(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_24313C2C4(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_24313EA84()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24313EAB8()
{
  uint64_t v0;

  sub_24313DAEC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_24313EAC4()
{
  return swift_deallocObject();
}

uint64_t sub_24313EAD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_24313EB0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_24313EB50()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_24313EB8C()
{
  uint64_t v0;

  sub_24313C69C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_24313EB9C()
{
  return swift_deallocObject();
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

uint64_t NotesSiriListHeaderView.noteCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t NotesSiriListHeaderView.headerText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotesSiriListHeaderView.defaultFolderUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 28);
  v4 = sub_243140AFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for NotesSiriListHeaderView()
{
  uint64_t result;

  result = qword_2572872A8;
  if (!qword_2572872A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t NotesSiriListHeaderView.fetchLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 32));
}

uint64_t NotesSiriListHeaderView.aboveFetchLimit.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 36));
}

uint64_t NotesSiriListHeaderView.init(noteCount:headerText:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a4;
  v7 = type metadata accessor for NotesSiriListHeaderView();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v10 = 0;
  v10[1] = sub_243140C04();
  v10[2] = v11;
  sub_2431410CC();
  v12 = objc_msgSend((id)objc_opt_self(), sel_appURLForDefaultFolder);
  sub_243140AE4();

  *(uint64_t *)((char *)v10 + *(int *)(v7 + 32)) = 26;
  v13 = *(int *)(v7 + 36);
  *((_BYTE *)v10 + v13) = 0;
  if ((a2 & 1) == 0)
  {
    if (a1 >= 26)
    {
      *v10 = 25;
      *((_BYTE *)v10 + v13) = 1;
      if (!a3)
        goto LABEL_6;
      goto LABEL_5;
    }
    *v10 = a1;
  }
  if (a3)
  {
LABEL_5:
    v14 = (void *)sub_243141108();
    swift_bridgeObjectRelease();
    v15 = objc_msgSend(v14, sel_ic_quotedString);

    v16 = sub_243141114();
    v18 = v17;
    swift_bridgeObjectRelease();

    v10[1] = v16;
    v10[2] = v18;
  }
LABEL_6:
  v19 = v22;
  sub_24313EE98((uint64_t)v10, v22);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v19, 0, 1, v7);
  return sub_24313EEDC((uint64_t)v10);
}

uint64_t sub_24313EE98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24313EEDC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t NotesSiriListHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v2 = sub_243140DCC();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for NotesSiriListHeaderView();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B28);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287210);
  v28 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287218);
  v13 = MEMORY[0x24BDAC7A8](v27);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - v16;
  sub_24313F22C((uint64_t)v10);
  sub_24313EE98(v1, (uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v19 = swift_allocObject();
  sub_24313F5D8((uint64_t)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  v20 = sub_243136344(&qword_257287220, &qword_257286B28, sub_24313F648, MEMORY[0x24BDEDBB8]);
  sub_243140FA0();
  swift_release();
  sub_243136140((uint64_t)v10, &qword_257286B28);
  sub_243140DA8();
  v32 = v8;
  v33 = v20;
  swift_getOpaqueTypeConformance2();
  v21 = v26;
  sub_243140FE8();
  v22 = v30;
  v23 = *(void (**)(char *, uint64_t))(v29 + 8);
  v23(v4, v30);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v21);
  sub_243140DB4();
  sub_243140CAC();
  v23(v4, v22);
  sub_243136140((uint64_t)v15, &qword_257287218);
  v32 = sub_243140BD4();
  v33 = v24;
  sub_243135684();
  sub_243140CA0();
  swift_bridgeObjectRelease();
  return sub_243136140((uint64_t)v17, &qword_257287218);
}

uint64_t sub_24313F22C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v21 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287248);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287238);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286B20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_243140D54();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287320);
  sub_24313F708(v2, (uint64_t)&v5[*(int *)(v12 + 44)]);
  v13 = sub_243140F10();
  KeyPath = swift_getKeyPath();
  sub_243136270((uint64_t)v5, (uint64_t)v8, &qword_257287248);
  v15 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  *v15 = KeyPath;
  v15[1] = v13;
  sub_243136140((uint64_t)v5, &qword_257287248);
  LOBYTE(KeyPath) = sub_243140EE0();
  sub_243136270((uint64_t)v8, (uint64_t)v11, &qword_257287238);
  v16 = &v11[*(int *)(v9 + 36)];
  *v16 = KeyPath;
  *(_OWORD *)(v16 + 8) = 0u;
  *(_OWORD *)(v16 + 24) = 0u;
  v16[40] = 1;
  sub_243136140((uint64_t)v8, &qword_257287238);
  v17 = sub_243141084();
  sub_24312F8F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v21, 0.0, 1, 0.0, 1, v17, v18);
  return sub_243136140((uint64_t)v11, &qword_257286B20);
}

uint64_t sub_24313F430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;

  v0 = sub_2431410F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  type metadata accessor for NotesSiriListHeaderView();
  v5 = (void *)sub_243140AD8();
  objc_msgSend(v4, sel_setPunchOutUri_, v5);

  sub_2431410C0();
  v6 = v4;
  sub_2431410E4();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24313F528()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for NotesSiriListHeaderView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + *(int *)(v1 + 28);
  v7 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_24313F5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotesSiriListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24313F61C()
{
  type metadata accessor for NotesSiriListHeaderView();
  return sub_24313F430();
}

uint64_t sub_24313F648()
{
  return sub_243136344(&qword_257287228, &qword_257286B20, (uint64_t (*)(void))sub_24313F66C, MEMORY[0x24BDECC60]);
}

unint64_t sub_24313F66C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257287230;
  if (!qword_257287230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257287238);
    v2[0] = sub_243136430(&qword_257287240, &qword_257287248, MEMORY[0x24BDF4498]);
    v2[1] = sub_243136430(&qword_257286A20, &qword_257286A28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257287230);
  }
  return result;
}

uint64_t sub_24313F708@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
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
  char v78;

  v68 = a2;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287328);
  v65 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v62 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287330);
  MEMORY[0x24BDAC7A8](v64);
  v61 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287338);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v66 = (uint64_t)&v55 - v8;
  v59 = sub_243140DCC();
  v58 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287340);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287348);
  v14 = MEMORY[0x24BDAC7A8](v57);
  v69 = (uint64_t)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v70 = (uint64_t)&v55 - v16;
  v56 = a1;
  v17 = a1[1];
  v18 = a1[2];
  v71 = v17;
  v72 = v18;
  v60 = sub_243135684();
  swift_bridgeObjectRetain();
  v19 = sub_243140F64();
  v21 = v20;
  v23 = v22 & 1;
  v24 = sub_243140F34();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  sub_243135674(v19, v21, v23);
  swift_bridgeObjectRelease();
  v71 = v24;
  v72 = v26;
  LOBYTE(v73) = v28 & 1;
  v74 = v30;
  sub_243140DC0();
  sub_243140FDC();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v59);
  sub_243135674(v71, v72, v73);
  swift_bridgeObjectRelease();
  LODWORD(v10) = sub_243140E98();
  v31 = v69;
  sub_243136270((uint64_t)v13, v69, &qword_257287340);
  *(_DWORD *)(v31 + *(int *)(v57 + 36)) = (_DWORD)v10;
  sub_243136140((uint64_t)v13, &qword_257287340);
  sub_243135DC4(v31, v70, &qword_257287348);
  v32 = (uint64_t)v56;
  v33 = *v56;
  v34 = sub_243140D48();
  sub_24313FCA8(v32, v33, (uint64_t)&v71);
  v35 = v71;
  v36 = v72;
  v37 = v73;
  v38 = v74;
  LOBYTE(v13) = v75;
  v71 = v34;
  v72 = 0;
  LOBYTE(v73) = 0;
  v74 = v35;
  v75 = v36;
  v76 = v37;
  v77 = v38;
  v78 = (char)v13;
  sub_243140F04();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257287300);
  sub_243136430(&qword_2572872F8, &qword_257287300, MEMORY[0x24BDF4498]);
  v39 = v62;
  sub_243140F94();
  sub_24313577C(v35, v36, v37);
  LODWORD(v35) = sub_243140EA4();
  v40 = v65;
  v41 = (uint64_t)v61;
  v42 = v67;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v61, v39, v67);
  *(_DWORD *)(v41 + *(int *)(v64 + 36)) = v35;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v42);
  v71 = sub_243140B98();
  v72 = v43;
  sub_24314073C();
  v44 = v63;
  sub_243140FC4();
  swift_bridgeObjectRelease();
  sub_243136140(v41, &qword_257287330);
  v45 = (uint64_t)v44;
  v46 = (uint64_t)v44;
  v47 = v66;
  sub_243135DC4(v46, v66, &qword_257287338);
  v49 = v69;
  v48 = v70;
  sub_243136270(v70, v69, &qword_257287348);
  v50 = v45;
  sub_243136270(v47, v45, &qword_257287338);
  v51 = v68;
  sub_243136270(v49, v68, &qword_257287348);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287358);
  v53 = v51 + *(int *)(v52 + 48);
  *(_QWORD *)v53 = 0;
  *(_BYTE *)(v53 + 8) = 0;
  sub_243136270(v50, v51 + *(int *)(v52 + 64), &qword_257287338);
  sub_243136140(v47, &qword_257287338);
  sub_243136140(v48, &qword_257287348);
  sub_243136140(v50, &qword_257287338);
  return sub_243136140(v49, &qword_257287348);
}

__n128 NotesSiriListHeaderView.noteCountHelper(noteCount:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  __n128 result;
  __int128 v8;
  _OWORD v9[2];
  char v10;

  v5 = sub_243140D48();
  sub_24313FCA8(v2, a1, (uint64_t)v9);
  v6 = v10;
  result = (__n128)v9[0];
  v8 = v9[1];
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  *(__n128 *)(a2 + 24) = result;
  *(_OWORD *)(a2 + 40) = v8;
  *(_BYTE *)(a2 + 56) = v6;
  return result;
}

double sub_24313FCA8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  double result;
  __int128 v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  char v33;

  v6 = sub_243140B50();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257287308);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_243140D84();
  MEMORY[0x24BDAC7A8](v11);
  if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for NotesSiriListHeaderView() + 36)) == 1)
  {
    *(_QWORD *)&v31 = sub_243140BF8();
    *((_QWORD *)&v31 + 1) = v12;
    sub_243135684();
    v26 = sub_243140F64();
    v27 = v13;
    v28 = v14 & 1;
    v29 = v15;
    v30 = 0;
  }
  else
  {
    sub_243140D78();
    sub_243140D6C();
    *(_QWORD *)&v31 = a2;
    sub_243140B38();
    sub_2431406F0();
    sub_243140A9C();
    sub_243136430(&qword_257287318, &qword_257287308, MEMORY[0x24BDCC928]);
    sub_243140D60();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_243140D6C();
    sub_243140D90();
    v16 = (id)ICSharedFrameworkBundleIdentifier();
    sub_243141114();

    v17 = (void *)sub_243141108();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v17);

    v26 = sub_243140F4C();
    v27 = v19;
    v28 = v20 & 1;
    v29 = v21;
    v30 = 1;
  }
  sub_243140E80();
  result = *(double *)&v31;
  v23 = v32;
  v24 = v33;
  *(_OWORD *)a3 = v31;
  *(_OWORD *)(a3 + 16) = v23;
  *(_BYTE *)(a3 + 32) = v24;
  return result;
}

uint64_t sub_24313FF80()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for NotesSiriListHeaderView(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2431410D8();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    v12 = a3[7];
    v13 = (char *)v4 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_243140AFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[9];
    *(_QWORD *)((char *)v4 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
  }
  return v4;
}

uint64_t destroy for NotesSiriListHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  v7 = sub_243140AFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2431410D8();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  return a1;
}

_QWORD *assignWithCopy for NotesSiriListHeaderView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_243140AFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for NotesSiriListHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2431410D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_243140AFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesSiriListHeaderView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_243140410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2431410D8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = sub_243140AFC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NotesSiriListHeaderView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2431404BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = sub_2431410D8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = sub_243140AFC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_243140558()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2431410D8();
  if (v1 <= 0x3F)
  {
    result = sub_243140AFC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_243140608()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2572872F0;
  if (!qword_2572872F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257287218);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257286B28);
    v2[3] = sub_243136344(&qword_257287220, &qword_257286B28, sub_24313F648, MEMORY[0x24BDEDBB8]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_243135054();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2572872F0);
  }
  return result;
}

uint64_t sub_2431406C4()
{
  return sub_243136430(&qword_2572872F8, &qword_257287300, MEMORY[0x24BDF4498]);
}

unint64_t sub_2431406F0()
{
  unint64_t result;

  result = qword_257287310;
  if (!qword_257287310)
  {
    result = MEMORY[0x2494F3464](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_257287310);
  }
  return result;
}

unint64_t sub_24314073C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_257287350;
  if (!qword_257287350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257287330);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257287300);
    v2[3] = sub_243136430(&qword_2572872F8, &qword_257287300, MEMORY[0x24BDF4498]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_243136430(&qword_257286A08, &qword_257286A10, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257287350);
  }
  return result;
}

uint64_t NotesSiriSashView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_243140C1C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243140C10();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257287360) + 36)) = 0x3FF0000000000000;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2431408B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2431408C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_243140C1C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243140C10();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257287360) + 36)) = 0x3FF0000000000000;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for NotesSiriSashView()
{
  return &type metadata for NotesSiriSashView;
}

unint64_t sub_243140978()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257287368;
  if (!qword_257287368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257287360);
    v2[0] = sub_2431409E4();
    v2[1] = sub_243140A2C();
    result = MEMORY[0x2494F3464](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257287368);
  }
  return result;
}

unint64_t sub_2431409E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257287370;
  if (!qword_257287370)
  {
    v1 = sub_243140C1C();
    result = MEMORY[0x2494F3464](MEMORY[0x24BE6DF50], v1);
    atomic_store(result, (unint64_t *)&qword_257287370);
  }
  return result;
}

unint64_t sub_243140A2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257287378;
  if (!qword_257287378)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_257287380);
    result = MEMORY[0x2494F3464](MEMORY[0x24BDEFB48], v1);
    atomic_store(result, (unint64_t *)&qword_257287378);
  }
  return result;
}

uint64_t sub_243140A78()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_243140A84()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_243140A90()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_243140A9C()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_243140AA8()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_243140AB4()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_243140AC0()
{
  return MEMORY[0x24BE6DD08]();
}

uint64_t sub_243140ACC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_243140AD8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_243140AE4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_243140AF0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_243140AFC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_243140B08()
{
  return MEMORY[0x24BE6DE70]();
}

uint64_t sub_243140B14()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_243140B20()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_243140B2C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_243140B38()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_243140B44()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_243140B50()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_243140B5C()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_243140B68()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_243140B74()
{
  return MEMORY[0x24BE6DD10]();
}

uint64_t sub_243140B80()
{
  return MEMORY[0x24BE6DD18]();
}

uint64_t sub_243140B8C()
{
  return MEMORY[0x24BE6DD20]();
}

uint64_t sub_243140B98()
{
  return MEMORY[0x24BE6DD28]();
}

uint64_t sub_243140BA4()
{
  return MEMORY[0x24BE6DD30]();
}

uint64_t sub_243140BB0()
{
  return MEMORY[0x24BE6DD38]();
}

uint64_t sub_243140BBC()
{
  return MEMORY[0x24BE6DD40]();
}

uint64_t sub_243140BC8()
{
  return MEMORY[0x24BE6DD48]();
}

uint64_t sub_243140BD4()
{
  return MEMORY[0x24BE6DD50]();
}

uint64_t sub_243140BE0()
{
  return MEMORY[0x24BE6DD58]();
}

uint64_t sub_243140BEC()
{
  return MEMORY[0x24BE6DD60]();
}

uint64_t sub_243140BF8()
{
  return MEMORY[0x24BE6DD68]();
}

uint64_t sub_243140C04()
{
  return MEMORY[0x24BE6DD70]();
}

uint64_t sub_243140C10()
{
  return MEMORY[0x24BE6DF58]();
}

uint64_t sub_243140C1C()
{
  return MEMORY[0x24BE6DF60]();
}

uint64_t sub_243140C28()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_243140C34()
{
  return MEMORY[0x24BE6DD78]();
}

uint64_t sub_243140C40()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_243140C4C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_243140C58()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_243140C64()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_243140C70()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_243140C7C()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_243140C88()
{
  return MEMORY[0x24BDECC00]();
}

uint64_t sub_243140C94()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_243140CA0()
{
  return MEMORY[0x24BDED1C8]();
}

uint64_t sub_243140CAC()
{
  return MEMORY[0x24BDED248]();
}

uint64_t sub_243140CB8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_243140CC4()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_243140CD0()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_243140CDC()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_243140CE8()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_243140CF4()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_243140D00()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_243140D0C()
{
  return MEMORY[0x24BDEE3C8]();
}

uint64_t sub_243140D18()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_243140D24()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_243140D30()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_243140D3C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_243140D48()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_243140D54()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_243140D60()
{
  return MEMORY[0x24BDEE9D8]();
}

uint64_t sub_243140D6C()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_243140D78()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_243140D84()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_243140D90()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_243140D9C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_243140DA8()
{
  return MEMORY[0x24BDEED10]();
}

uint64_t sub_243140DB4()
{
  return MEMORY[0x24BDEED40]();
}

uint64_t sub_243140DC0()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_243140DCC()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_243140DD8()
{
  return MEMORY[0x24BEAD688]();
}

uint64_t sub_243140DE4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_243140DF0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_243140DFC()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_243140E08()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_243140E14()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_243140E20()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_243140E2C()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_243140E38()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_243140E44()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_243140E50()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_243140E5C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_243140E68()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_243140E74()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_243140E80()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_243140E8C()
{
  return MEMORY[0x24BDEFC98]();
}

uint64_t sub_243140E98()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_243140EA4()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_243140EB0()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_243140EBC()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_243140EC8()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_243140ED4()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_243140EE0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_243140EEC()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_243140EF8()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_243140F04()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_243140F10()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_243140F1C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_243140F28()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_243140F34()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_243140F40()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_243140F4C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_243140F58()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_243140F64()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_243140F70()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_243140F7C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_243140F88()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_243140F94()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_243140FA0()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_243140FAC()
{
  return MEMORY[0x24BDF2600]();
}

uint64_t sub_243140FB8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_243140FC4()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_243140FD0()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_243140FDC()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_243140FE8()
{
  return MEMORY[0x24BDF3280]();
}

uint64_t sub_243140FF4()
{
  return MEMORY[0x24BE6DF00]();
}

uint64_t sub_243141000()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_24314100C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_243141018()
{
  return MEMORY[0x24BE6DF08]();
}

uint64_t sub_243141024()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_243141030()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_24314103C()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_243141048()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_243141054()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_243141060()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_24314106C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_243141078()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_243141084()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_243141090()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_24314109C()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2431410A8()
{
  return MEMORY[0x24BEADDF8]();
}

uint64_t sub_2431410B4()
{
  return MEMORY[0x24BEADE00]();
}

uint64_t sub_2431410C0()
{
  return MEMORY[0x24BEADF40]();
}

uint64_t sub_2431410CC()
{
  return MEMORY[0x24BEADF48]();
}

uint64_t sub_2431410D8()
{
  return MEMORY[0x24BEADF50]();
}

uint64_t sub_2431410E4()
{
  return MEMORY[0x24BEAE338]();
}

uint64_t sub_2431410F0()
{
  return MEMORY[0x24BEAE350]();
}

uint64_t sub_2431410FC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_243141108()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_243141114()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_243141120()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24314112C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_243141138()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_243141144()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_243141150()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24314115C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_243141168()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_243141174()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_243141180()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_24314118C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_243141198()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2431411A4()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_2431411B0()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_2431411BC()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_2431411C8()
{
  return MEMORY[0x24BDD00F0]();
}

uint64_t sub_2431411D4()
{
  return MEMORY[0x24BDD0150]();
}

uint64_t sub_2431411E0()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_2431411EC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2431411F8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_243141204()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_243141210()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_24314121C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_243141228()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_243141234()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_243141240()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24314124C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_243141258()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_243141264()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_243141270()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24314127C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_243141288()
{
  return MEMORY[0x24BEE3A30]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ICSharedFrameworkBundleIdentifier()
{
  return MEMORY[0x24BE6DEA8]();
}

uint64_t NotesAppURLForNoteIdentifier()
{
  return MEMORY[0x24BE6DD90]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

