@implementation CKXAtomBindingImplementationFormatVersionORCv2

- (CKXAtomBindingImplementationFormatVersionORCv2)init
{
  CKXAtomBindingImplementationFormatVersionORCv2 *v2;
  const char *v3;
  uint64_t v4;
  CKXAtomBindingImplementationFormatVersionORCv2 *v5;
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
  const char *v17;
  uint64_t v18;
  _QWORD *v19;
  const char *v20;
  uint64_t v21;
  _QWORD *v22;
  const char *v23;
  uint64_t v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  _QWORD *v33;
  const char *v34;
  uint64_t v35;
  _QWORD *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  _QWORD *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  _QWORD *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  _QWORD *v61;
  const char *v62;
  uint64_t v63;
  _QWORD *v64;
  const char *v65;
  uint64_t v66;
  _QWORD *v67;
  const char *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)CKXAtomBindingImplementationFormatVersionORCv2;
  v2 = -[CKXAtomBindingImplementation init](&v76, sel_init);
  v5 = v2;
  if (v2)
  {
    objc_msgSend_schema(v2, v3, v4);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location = sub_1D4BB4C78(v6, v7, v8);

    objc_msgSend_schema(v5, v9, v10);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.location_identifier = sub_1D4BB54D0(v11, (const char *)2, v5->super.tokens.location);

    objc_msgSend_schema(v5, v12, v13);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.siteIdentifier = sub_1D4BB4C78(v14, v15, v16);

    objc_msgSend_schema(v5, v17, v18);
    v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.siteIdentifier_identifier = sub_1D4BB54D0(v19, (const char *)2, v5->super.tokens.siteIdentifier);

    objc_msgSend_schema(v5, v20, v21);
    v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.siteIdentifier_modifier = sub_1D4BB54D0(v22, (const char *)1, v5->super.tokens.siteIdentifier);

    objc_msgSend_schema(v5, v23, v24);
    v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp = sub_1D4BB4C78(v25, v26, v27);

    objc_msgSend_schema(v5, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_siteIdentifier = sub_1D4BB52BC((uint64_t)v30, (const char *)v5->super.tokens.siteIdentifier, v5->super.tokens.timestamp);

    objc_msgSend_schema(v5, v31, v32);
    v33 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.timestamp_clock = sub_1D4BB5134(v33, v5->super.tokens.timestamp, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v34, v35);
    v36 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference = sub_1D4BB4C78(v36, v37, v38);

    objc_msgSend_schema(v5, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference_timestamp = sub_1D4BB52BC((uint64_t)v41, (const char *)v5->super.tokens.timestamp, v5->super.tokens.reference);

    objc_msgSend_schema(v5, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.reference_location = sub_1D4BB52BC((uint64_t)v44, (const char *)v5->super.tokens.location, v5->super.tokens.reference);

    objc_msgSend_schema(v5, v45, v46);
    v47 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom = sub_1D4BB4C78(v47, v48, v49);

    objc_msgSend_schema(v5, v50, v51);
    v52 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_version = sub_1D4BB5134(v52, v5->super.tokens.atom, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_timestamp = sub_1D4BB52BC((uint64_t)v55, (const char *)v5->super.tokens.timestamp, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_references = sub_1D4BB53D8((uint64_t)v58, (const char *)v5->super.tokens.reference, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v59, v60);
    v61 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_atom_type = sub_1D4BB5134(v61, v5->super.tokens.atom, (uint64_t)"Q", 0);

    objc_msgSend_schema(v5, v62, v63);
    v64 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.atom_value = sub_1D4BB54D0(v64, (const char *)2, v5->super.tokens.atom);

    objc_msgSend_schema(v5, v65, v66);
    v67 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v70 = v67;
    if (v67)
    {
      v71 = sub_1D4BB4C78(v67, v68, v69);
      *(_BYTE *)(v70[4] + 2 * v71 + 1) = 1;
    }
    else
    {
      v71 = 0;
    }
    v5->super.tokens.topLevelContainer = v71;

    objc_msgSend_schema(v5, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v5->super.tokens.topLevelContainer_atoms = sub_1D4BB53D8((uint64_t)v74, (const char *)v5->super.tokens.atom, v5->super.tokens.topLevelContainer);

  }
  return v5;
}

- (id)orcHelpers
{
  CKXAtomORCSchema *v3;
  const char *v4;

  v3 = [CKXAtomORCSchema alloc];
  return (id)objc_msgSend_initWithBinding_formatVersion_(v3, v4, (uint64_t)self, 3);
}

@end
