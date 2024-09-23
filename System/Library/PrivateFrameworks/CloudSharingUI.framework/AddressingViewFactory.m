@implementation AddressingViewFactory

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController));
}

- (_TtC14CloudSharingUI21AddressingViewFactory)initWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9 userDidClickPrimaryButton:(id)a10 userDidClickSecondaryButton:(id)a11 userDidClickShowContactPicker:(id)a12 userDidChangeAddresses:(id)a13
{
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t (*v37)();
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t (*v44)();
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)();
  uint64_t v49;
  uint64_t (*v50)();
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _TtC14CloudSharingUI21AddressingViewFactory *v57;
  void *v59;
  unint64_t v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  unint64_t v69;
  void *v70;
  uint64_t (*v71)();
  void *v72;
  unint64_t v73;
  uint64_t v74;

  v66 = _Block_copy(a10);
  v71 = (uint64_t (*)())_Block_copy(a11);
  v19 = (uint64_t)_Block_copy(a12);
  v65 = _Block_copy(a13);
  if (a3)
  {
    v20 = a4;
    v21 = a5;
    v22 = a6;
    v23 = a7;
    v24 = a8;
    v25 = a9;
    v26 = a9;
    v27 = a3;
    v28 = sub_20D634B24();
    v73 = v29;
    v74 = v28;

    v30 = v66;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v51 = a4;
    v52 = a5;
    v53 = a6;
    v54 = a7;
    v55 = a8;
    v25 = a9;
    v56 = a9;
    v73 = 0xF000000000000000;
    v74 = 0;
    v30 = v66;
    if (a4)
    {
LABEL_3:
      v31 = sub_20D635190();
      v69 = v32;
      v70 = (void *)v31;

      if (a5)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  v69 = 0;
  v70 = 0;
  if (a5)
  {
LABEL_4:
    v33 = sub_20D635190();
    v67 = v34;
    v68 = (void *)v33;

    if (a6)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v67 = 0;
  v68 = 0;
  if (a6)
  {
LABEL_5:
    v35 = sub_20D635190();
    v63 = v36;
    v64 = (void *)v35;

    v37 = v71;
    if (a7)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v63 = 0;
  v64 = 0;
  v37 = v71;
  if (a7)
  {
LABEL_6:
    v72 = (void *)sub_20D635190();
    v62 = v38;

    if (a8)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v72 = 0;
  v62 = 0;
  if (a8)
  {
LABEL_7:
    v39 = sub_20D635190();
    v60 = v40;
    v61 = (void *)v39;

    if (v25)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v60 = 0;
  v61 = 0;
  if (v25)
  {
LABEL_8:
    v59 = (void *)sub_20D635190();
    v42 = v41;

    if (v30)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v59 = 0;
  v42 = 0;
  if (v30)
  {
LABEL_9:
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = v30;
    v44 = sub_20D63491C;
    v45 = v65;
    if (v37)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v44 = 0;
  v43 = 0;
  v45 = v65;
  if (v37)
  {
LABEL_10:
    v46 = swift_allocObject();
    *(_QWORD *)(v46 + 16) = v37;
    v37 = sub_20D63491C;
    if (v19)
      goto LABEL_11;
LABEL_22:
    v48 = 0;
    if (v45)
      goto LABEL_12;
LABEL_23:
    v50 = 0;
    v49 = 0;
    goto LABEL_24;
  }
LABEL_21:
  v46 = 0;
  if (!v19)
    goto LABEL_22;
LABEL_11:
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = v19;
  v19 = v47;
  v48 = sub_20D63491C;
  if (!v45)
    goto LABEL_23;
LABEL_12:
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v45;
  v50 = sub_20D63491C;
LABEL_24:
  v57 = (_TtC14CloudSharingUI21AddressingViewFactory *)sub_20D634688(v74, v73, v70, v69, v68, v67, v64, v63, v72, v62, v61, v60, v59, v42, (uint64_t)v44, v43, (uint64_t)v37, v46, (uint64_t)v48,
                                                         v19,
                                                         (uint64_t)v50,
                                                         v49);
  sub_20D618880((uint64_t)v50);
  sub_20D618880((uint64_t)v48);
  sub_20D618880((uint64_t)v37);
  sub_20D618880((uint64_t)v44);
  sub_20D62FC54(v74, v73);
  return v57;
}

- (void)updateWithHeaderImageData:(id)a3 headerTitle:(id)a4 loadingText:(id)a5 supplementaryText:(id)a6 userInfoText:(id)a7 primaryButtonText:(id)a8 secondaryButtonText:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _TtC14CloudSharingUI21AddressingViewFactory *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _TtC14CloudSharingUI21AddressingViewFactory *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;

  if (a3)
  {
    v15 = a4;
    v16 = a5;
    v17 = a6;
    v18 = a7;
    v19 = a8;
    v20 = a9;
    v21 = self;
    v22 = a3;
    v23 = sub_20D634B24();
    v50 = v24;
    v51 = v23;

    if (a4)
      goto LABEL_3;
  }
  else
  {
    v39 = a4;
    v40 = a5;
    v41 = a6;
    v42 = a7;
    v43 = a8;
    v44 = a9;
    v45 = self;
    v50 = 0xF000000000000000;
    v51 = 0;
    if (a4)
    {
LABEL_3:
      v48 = (void *)sub_20D635190();
      v49 = v25;

      if (a5)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  v48 = 0;
  v49 = 0;
  if (a5)
  {
LABEL_4:
    v47 = (void *)sub_20D635190();
    v27 = v26;

    if (a6)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v47 = 0;
  v27 = 0;
  if (a6)
  {
LABEL_5:
    v46 = (void *)sub_20D635190();
    v29 = v28;

    if (a7)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v46 = 0;
  v29 = 0;
  if (a7)
  {
LABEL_6:
    v30 = (void *)sub_20D635190();
    v32 = v31;

    if (a8)
      goto LABEL_7;
LABEL_14:
    v33 = 0;
    v35 = 0;
    if (a9)
      goto LABEL_8;
LABEL_15:
    v36 = 0;
    v38 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v30 = 0;
  v32 = 0;
  if (!a8)
    goto LABEL_14;
LABEL_7:
  v33 = (void *)sub_20D635190();
  v35 = v34;

  if (!a9)
    goto LABEL_15;
LABEL_8:
  v36 = (void *)sub_20D635190();
  v38 = v37;

LABEL_16:
  sub_20D630468(v51, v50, v48, v49, v47, v27, v46, v29, v30, v32, v33, v35, v36, v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D62FC54(v51, v50);

}

- (void)addAddressFrom:(id)a3 contactProperty:(id)a4
{
  id v7;
  id v8;
  _TtC14CloudSharingUI21AddressingViewFactory *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_20D62FCF0(a3, a4);

}

- (_TtC14CloudSharingUI21AddressingViewFactory)init
{
  _TtC14CloudSharingUI21AddressingViewFactory *result;

  result = (_TtC14CloudSharingUI21AddressingViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
