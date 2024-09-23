@implementation CKXAtomBindingImplementationFormatVersionORC

- (CKXAtomBindingImplementationFormatVersionORC)init
{
  CKXAtomBindingImplementationFormatVersionORC *v2;
  const char *v3;
  uint64_t v4;
  CKXAtomBindingImplementationFormatVersionORC *v5;
  _QWORD *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  const char *v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  _QWORD *v20;
  const char *v21;
  uint64_t v22;
  _QWORD *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  _QWORD *v28;
  const char *v29;
  uint64_t v30;
  _QWORD *v31;
  const char *v32;
  uint64_t v33;
  _QWORD *v34;
  const char *v35;
  uint64_t v36;
  _QWORD *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  _QWORD *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  _QWORD *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  _QWORD *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  _QWORD *v68;
  const char *v69;
  uint64_t v70;
  _QWORD *v71;
  const char *v72;
  uint64_t v73;
  _QWORD *v74;
  const char *v75;
  uint64_t v76;
  _QWORD *v77;
  const char *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  objc_super v86;

  v86.receiver = self;
  v86.super_class = (Class)CKXAtomBindingImplementationFormatVersionORC;
  v2 = -[CKXAtomBindingImplementation init](&v86, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend_schema(v2, v3, v4);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp = sub_1D4BB4C78(v6, v7, v8);

    objc_msgSend_schema(v5, v9, v10);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_identifier = sub_1D4BB54D0(v11, (const char *)2, v5->super.tokens.timestamp);

    objc_msgSend_schema(v5, v12, v13);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_modifier = sub_1D4BB5134(v14, v5->super.tokens.timestamp, (uint64_t)"C", 0);

    objc_msgSend_schema(v5, v15, v16);
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_clock = sub_1D4BB5134(v17, v5->super.tokens.timestamp, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v18, v19);
    v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_unordered = sub_1D4BB5134(v20, v5->super.tokens.timestamp, (uint64_t)"C", 0);

    objc_msgSend_schema(v5, v21, v22);
    v23 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location = sub_1D4BB4C78(v23, v24, v25);

    objc_msgSend_schema(v5, v26, v27);
    v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location_identifier = sub_1D4BB54D0(v28, (const char *)2, v5->super.tokens.location);

    objc_msgSend_schema(v5, v29, v30);
    v31 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location_zone_name = sub_1D4BB54D0(v31, (const char *)1, v5->super.tokens.location);

    objc_msgSend_schema(v5, v32, v33);
    v34 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location_zone_owner_name = sub_1D4BB54D0(v34, (const char *)1, v5->super.tokens.location);

    objc_msgSend_schema(v5, v35, v36);
    v37 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference = sub_1D4BB4C78(v37, v38, v39);

    objc_msgSend_schema(v5, v40, v41);
    v42 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference_type = sub_1D4BB5134(v42, v5->super.tokens.reference, (uint64_t)"C", 0);

    objc_msgSend_schema(v5, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference_location = sub_1D4BB52BC((uint64_t)v45, (const char *)v5->super.tokens.location, v5->super.tokens.reference);

    objc_msgSend_schema(v5, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference_timestamp = sub_1D4BB52BC((uint64_t)v48, (const char *)v5->super.tokens.timestamp, v5->super.tokens.reference);

    objc_msgSend_schema(v5, v49, v50);
    v51 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom = sub_1D4BB4C78(v51, v52, v53);

    objc_msgSend_schema(v5, v54, v55);
    v56 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_version = sub_1D4BB5134(v56, v5->super.tokens.atom, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_location = sub_1D4BB52BC((uint64_t)v59, (const char *)v5->super.tokens.location, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_timestamp = sub_1D4BB52BC((uint64_t)v62, (const char *)v5->super.tokens.timestamp, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_references = sub_1D4BB53D8((uint64_t)v65, (const char *)v5->super.tokens.reference, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v66, v67);
    v68 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_atom_behavior = sub_1D4BB5134(v68, v5->super.tokens.atom, (uint64_t)"C", 0);

    objc_msgSend_schema(v5, v69, v70);
    v71 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_atom_type = sub_1D4BB5134(v71, v5->super.tokens.atom, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v72, v73);
    v74 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_value = sub_1D4BB54D0(v74, (const char *)2, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v75, v76);
    v77 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v80 = v77;
    if (v77)
    {
      v81 = sub_1D4BB4C78(v77, v78, v79);
      *(_BYTE *)(v80[4] + 2 * v81 + 1) = 1;
    }
    else
    {
      v81 = 0;
    }
    v5->super.tokens.topLevelContainer = v81;

    objc_msgSend_schema(v5, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.topLevelContainer_atoms = sub_1D4BB53D8((uint64_t)v84, (const char *)v5->super.tokens.atom, v5->super.tokens.topLevelContainer);

  }
  return v5;
}

- (id)orcHelpers
{
  CKXAtomORCSchema *v3;
  const char *v4;

  v3 = [CKXAtomORCSchema alloc];
  return (id)objc_msgSend_initWithBinding_formatVersion_(v3, v4, (uint64_t)self, 2);
}

@end
