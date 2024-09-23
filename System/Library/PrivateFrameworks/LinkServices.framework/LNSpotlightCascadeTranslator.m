@implementation LNSpotlightCascadeTranslator

+ (id)sourceItemIdentifierFromInstanceIdentifier:(id)a3 typeIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), a4, a3);
}

+ (id)translateItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  objc_class *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  float v38;
  float v39;
  id v40;
  double v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *CCItemInstanceClass;
  NSObject *v46;
  void *v48;
  uint64_t v49;
  objc_class *CCAppIntentsIndexedEntityMetaContentClass;
  Class v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 buf;
  void (*v65)(uint64_t);
  void *v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeForKey:", CFSTR("_kMDItemAppEntityInstanceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributeForKey:", CFSTR("_kMDItemAppEntityTypeIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v18 = 0;
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(v3, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeForKey:", CFSTR("kMDItemAppEntityTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v18 = 0;
LABEL_64:

      goto LABEL_65;
    }
    objc_msgSend(v3, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributeForKey:", CFSTR("kMDItemAppEntitySubtitle"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeForKey:", CFSTR("kMDItemAppEntityDisplayRepresentationSynonyms"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0;
    v61 = &v60;
    v62 = 0x2050000000;
    v12 = (void *)getCCAppEntityDisplayRepresentationClass_softClass;
    v63 = getCCAppEntityDisplayRepresentationClass_softClass;
    if (!getCCAppEntityDisplayRepresentationClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v65 = __getCCAppEntityDisplayRepresentationClass_block_invoke;
      v66 = &unk_1E45DDB30;
      v67 = &v60;
      __getCCAppEntityDisplayRepresentationClass_block_invoke((uint64_t)&buf);
      v12 = (void *)v61[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v60, 8);
    if (!v13)
    {
      getLNLogCategoryVocabulary();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_ERROR, "Cannot load class CCAppEntityDisplayRepresentation", (uint8_t *)&buf, 2u);
      }
      v18 = 0;
      goto LABEL_63;
    }
    v59 = 0;
    v14 = objc_msgSend([v13 alloc], "initWithTitle:subtitle:synonyms:error:", v9, v54, v53, &v59);
    v15 = v59;
    if (v15)
    {
      v16 = v15;
      getLNLogCategoryVocabulary();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_ERROR, "Cannot create CCAppEntityDisplayRepresentation. Error: %@", (uint8_t *)&buf, 0xCu);
      }

LABEL_11:
      v18 = 0;
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    v60 = 0;
    v61 = &v60;
    v62 = 0x2050000000;
    v19 = (void *)getCCAppEntityTypeDisplayRepresentationClass_softClass;
    v63 = getCCAppEntityTypeDisplayRepresentationClass_softClass;
    if (!getCCAppEntityTypeDisplayRepresentationClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v65 = __getCCAppEntityTypeDisplayRepresentationClass_block_invoke;
      v66 = &unk_1E45DDB30;
      v67 = &v60;
      __getCCAppEntityTypeDisplayRepresentationClass_block_invoke((uint64_t)&buf);
      v19 = (void *)v61[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v60, 8);
    if (!v20)
    {
      getLNLogCategoryVocabulary();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "Cannot load class CCAppEntityTypeDisplayRepresentationClass", (uint8_t *)&buf, 2u);
      }
      goto LABEL_11;
    }
    objc_msgSend(v3, "attributeSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributeForKey:", CFSTR("_kMDItemAppEntityTypeDisplayRepresentationName"));
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v3, "attributeSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "attributeForKey:", CFSTR("_kMDItemAppEntityTypeDisplayRepresentationSynonyms"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = 0;
      v52 = (void *)objc_msgSend([v20 alloc], "initWithName:synonyms:error:", v16, v23, &v58);
      v24 = v58;

      if (v24)
      {
        getLNLogCategoryVocabulary();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_1A18F6000, v25, OS_LOG_TYPE_ERROR, "Cannot create CCAppEntityTypeDisplayRepresentation. Error: %@", (uint8_t *)&buf, 0xCu);
        }

LABEL_38:
        v18 = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {
      v52 = 0;
    }
    v60 = 0;
    v61 = &v60;
    v62 = 0x2050000000;
    v26 = (void *)getCCAppIntentsIndexedEntityContentClass_softClass;
    v63 = getCCAppIntentsIndexedEntityContentClass_softClass;
    if (!getCCAppIntentsIndexedEntityContentClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v65 = __getCCAppIntentsIndexedEntityContentClass_block_invoke;
      v66 = &unk_1E45DDB30;
      v67 = &v60;
      __getCCAppIntentsIndexedEntityContentClass_block_invoke((uint64_t)&buf);
      v26 = (void *)v61[3];
    }
    v27 = v26;
    _Block_object_dispose(&v60, 8);
    v28 = (objc_class *)v27;
    if (!v28)
    {
      getLNLogCategoryVocabulary();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v24, OS_LOG_TYPE_ERROR, "Cannot load class CCAppIntentsIndexedEntityContent", (uint8_t *)&buf, 2u);
      }
      goto LABEL_38;
    }
    v57 = 0;
    v24 = objc_msgSend([v28 alloc], "initWithTypeIdentifier:displayRepresentation:typeDisplayRepresentation:error:", v7, v14, v52, &v57);
    v29 = v57;
    if (v29)
    {
      v30 = v29;
      getLNLogCategoryVocabulary();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1A18F6000, v31, OS_LOG_TYPE_ERROR, "Cannot create CCAppIntentsIndexedEntityContent. Error: %@", (uint8_t *)&buf, 0xCu);
      }

      v18 = 0;
      v32 = v30;
      goto LABEL_60;
    }
    CCAppIntentsIndexedEntityMetaContentClass = (objc_class *)getCCAppIntentsIndexedEntityMetaContentClass();
    if (!CCAppIntentsIndexedEntityMetaContentClass)
    {
      getLNLogCategoryVocabulary();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v32, OS_LOG_TYPE_ERROR, "Cannot load class CCAppIntentsIndexedEntityMetaContent", (uint8_t *)&buf, 2u);
      }
      v18 = 0;
      goto LABEL_60;
    }
    objc_msgSend((id)objc_opt_class(), "sourceItemIdentifierFromInstanceIdentifier:typeIdentifier:", v5, v7);
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "attributeForKey:", CFSTR("_kMDItemAppEntityPriority"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    v36 = &unk_1E45FA5C8;
    if (v34)
      v36 = (void *)v34;
    v37 = v36;

    objc_msgSend(v37, "floatValue");
    v39 = v38;

    v40 = [CCAppIntentsIndexedEntityMetaContentClass alloc];
    v41 = v39 + 0.00001;
    *(float *)&v41 = v41;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v51 = (Class)objc_msgSend(v40, "initWithSourceItemIdentifier:saliency:error:", v49, v42, &v56);
    v43 = v56;

    if (v43)
    {
      getLNLogCategoryVocabulary();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v43;
        _os_log_impl(&dword_1A18F6000, v44, OS_LOG_TYPE_ERROR, "Cannot create CCAppIntentsIndexedEntityMetaContent. Error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      CCItemInstanceClass = (objc_class *)getCCItemInstanceClass();
      if (CCItemInstanceClass)
      {
        v55 = 0;
        v48 = (void *)objc_msgSend([CCItemInstanceClass alloc], "initWithContent:metaContent:error:", v24, v51, &v55);
        v43 = v55;
        if (v43)
        {
          getLNLogCategoryVocabulary();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v43;
            _os_log_impl(&dword_1A18F6000, v46, OS_LOG_TYPE_ERROR, "Cannot create CCItemInstance. Error: %@", (uint8_t *)&buf, 0xCu);
          }

          v18 = 0;
        }
        else
        {
          v18 = v48;
        }

        goto LABEL_59;
      }
      getLNLogCategoryVocabulary();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v43, OS_LOG_TYPE_ERROR, "Cannot load class CCItemInstance", (uint8_t *)&buf, 2u);
      }
    }
    v18 = 0;
LABEL_59:

    v32 = v49;
LABEL_60:

    goto LABEL_61;
  }
  v18 = 0;
LABEL_66:

  return v18;
}

@end
