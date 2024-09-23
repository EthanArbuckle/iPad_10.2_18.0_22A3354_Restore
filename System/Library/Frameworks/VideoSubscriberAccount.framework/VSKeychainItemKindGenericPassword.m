@implementation VSKeychainItemKindGenericPassword

void __VSKeychainItemKindGenericPassword_block_invoke()
{
  uint64_t v0;
  void *v1;

  __VSKeychainItemKindGenericPassword_block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)VSKeychainItemKindGenericPassword___vs_lazy_init_variable;
  VSKeychainItemKindGenericPassword___vs_lazy_init_variable = v0;

}

VSKeychainItemKind *__VSKeychainItemKindGenericPassword_block_invoke_2()
{
  objc_class *v0;
  void *v1;
  id v2;
  VSKeychainItemAttribute *v3;
  objc_class *v4;
  void *v5;
  VSKeychainItemAttribute *v6;
  objc_class *v7;
  void *v8;
  VSKeychainItemAttribute *v9;
  objc_class *v10;
  void *v11;
  VSKeychainItemAttribute *v12;
  objc_class *v13;
  void *v14;
  VSKeychainItemAttribute *v15;
  objc_class *v16;
  void *v17;
  VSKeychainItemAttribute *v18;
  objc_class *v19;
  void *v20;
  VSKeychainItemAttribute *v21;
  objc_class *v22;
  void *v23;
  VSKeychainItemAttribute *v24;
  objc_class *v25;
  void *v26;
  VSKeychainItemAttribute *v27;
  objc_class *v28;
  void *v29;
  VSKeychainItemAttribute *v30;
  objc_class *v31;
  void *v32;
  VSKeychainItemAttribute *v33;
  objc_class *v34;
  void *v35;
  VSKeychainItemAttribute *v36;
  objc_class *v37;
  void *v38;
  VSKeychainItemAttribute *v39;
  objc_class *v40;
  void *v41;
  VSKeychainItemAttribute *v42;
  objc_class *v43;
  void *v44;
  VSKeychainItemAttribute *v45;
  objc_class *v46;
  void *v47;
  VSKeychainItemAttribute *v48;
  objc_class *v49;
  void *v50;
  VSKeychainItemAttribute *v52;
  VSKeychainItemAttribute *v53;
  VSKeychainItemAttribute *v54;
  VSKeychainItemAttribute *v55;
  VSKeychainItemAttribute *v56;
  VSKeychainItemAttribute *v57;
  VSKeychainItemAttribute *v58;
  VSKeychainItemKind *v59;
  VSKeychainItemAttribute *v60;

  v59 = objc_alloc_init(VSKeychainItemKind);
  -[VSKeychainItemKind setSecItemClass:](v59, "setSecItemClass:", *MEMORY[0x1E0CD6CA8]);
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemKind setItemClassName:](v59, "setItemClassName:", v1);

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v3, "setName:", CFSTR("accessGroup"));
  v60 = v3;
  -[VSKeychainItemAttribute setAttributeType:](v3, "setAttributeType:", 3);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v3, "setAttributeValueClassName:", v5);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v3, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6898]);
  objc_msgSend(v2, "addObject:", v3);
  v6 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v6, "setName:", CFSTR("creationDate"));
  v58 = v6;
  -[VSKeychainItemAttribute setAttributeType:](v6, "setAttributeType:", 3);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v6, "setAttributeValueClassName:", v8);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v6, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6990]);
  objc_msgSend(v2, "addObject:", v6);
  v9 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v9, "setName:", CFSTR("modificationDate"));
  v57 = v9;
  -[VSKeychainItemAttribute setAttributeType:](v9, "setAttributeType:", 3);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v9, "setAttributeValueClassName:", v11);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v9, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6A98]);
  objc_msgSend(v2, "addObject:", v9);
  v12 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v12, "setName:", CFSTR("itemDescription"));
  v56 = v12;
  -[VSKeychainItemAttribute setAttributeType:](v12, "setAttributeType:", 1);
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v12, "setAttributeValueClassName:", v14);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v12, "setSecItemAttributeKey:", *MEMORY[0x1E0CD69A0]);
  objc_msgSend(v2, "addObject:", v12);
  v15 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v15, "setName:", CFSTR("comment"));
  v55 = v15;
  -[VSKeychainItemAttribute setAttributeType:](v15, "setAttributeType:", 1);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v15, "setAttributeValueClassName:", v17);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v15, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6988]);
  objc_msgSend(v2, "addObject:", v15);
  v18 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v18, "setName:", CFSTR("creatorCode"));
  v54 = v18;
  -[VSKeychainItemAttribute setAttributeType:](v18, "setAttributeType:", 0);
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v18, "setAttributeValueClassName:", v20);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v18, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6998]);
  objc_msgSend(v2, "addObject:", v18);
  v21 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v21, "setName:", CFSTR("typeCode"));
  v53 = v21;
  -[VSKeychainItemAttribute setAttributeType:](v21, "setAttributeType:", 0);
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v21, "setAttributeValueClassName:", v23);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v21, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6BC8]);
  objc_msgSend(v2, "addObject:", v21);
  v24 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v24, "setName:", CFSTR("label"));
  v52 = v24;
  -[VSKeychainItemAttribute setAttributeType:](v24, "setAttributeType:", 1);
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v24, "setAttributeValueClassName:", v26);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v24, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6A90]);
  objc_msgSend(v2, "addObject:", v24);
  v27 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v27, "setName:", CFSTR("invisible"));
  -[VSKeychainItemAttribute setAttributeType:](v27, "setAttributeType:", 2);
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v27, "setAttributeValueClassName:", v29);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v27, "setSecItemAttributeKey:", *MEMORY[0x1E0CD69C0]);
  objc_msgSend(v2, "addObject:", v27);
  v30 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v30, "setName:", CFSTR("negative"));
  -[VSKeychainItemAttribute setAttributeType:](v30, "setAttributeType:", 2);
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v30, "setAttributeValueClassName:", v32);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v30, "setSecItemAttributeKey:", *MEMORY[0x1E0CD69D0]);
  objc_msgSend(v2, "addObject:", v30);
  v33 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v33, "setName:", CFSTR("account"));
  -[VSKeychainItemAttribute setAttributeType:](v33, "setAttributeType:", 1);
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v33, "setAttributeValueClassName:", v35);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v33, "setSecItemAttributeKey:", *MEMORY[0x1E0CD68F8]);
  -[VSKeychainItemAttribute setDefaultValue:](v33, "setDefaultValue:", &stru_1E93A8CC0);
  objc_msgSend(v2, "addObject:", v33);
  v36 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v36, "setName:", CFSTR("service"));
  -[VSKeychainItemAttribute setAttributeType:](v36, "setAttributeType:", 1);
  v37 = (objc_class *)objc_opt_class();
  NSStringFromClass(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v36, "setAttributeValueClassName:", v38);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v36, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v2, "addObject:", v36);
  v39 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v39, "setName:", CFSTR("generic"));
  -[VSKeychainItemAttribute setAttributeType:](v39, "setAttributeType:", 1);
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v39, "setAttributeValueClassName:", v41);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v39, "setSecItemAttributeKey:", *MEMORY[0x1E0CD69B0]);
  objc_msgSend(v2, "addObject:", v39);
  v42 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v42, "setName:", CFSTR("synchronizable"));
  -[VSKeychainItemAttribute setAttributeType:](v42, "setAttributeType:", 2);
  v43 = (objc_class *)objc_opt_class();
  NSStringFromClass(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v42, "setAttributeValueClassName:", v44);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v42, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6B80]);
  objc_msgSend(v2, "addObject:", v42);
  v45 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v45, "setName:", CFSTR("viewHint"));
  -[VSKeychainItemAttribute setAttributeType:](v45, "setAttributeType:", 1);
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v45, "setAttributeValueClassName:", v47);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v45, "setSecItemAttributeKey:", *MEMORY[0x1E0CD6B78]);
  objc_msgSend(v2, "addObject:", v45);
  v48 = objc_alloc_init(VSKeychainItemAttribute);
  -[VSKeychainItemAttribute setName:](v48, "setName:", CFSTR("data"));
  -[VSKeychainItemAttribute setAttributeType:](v48, "setAttributeType:", 4);
  v49 = (objc_class *)objc_opt_class();
  NSStringFromClass(v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v48, "setAttributeValueClassName:", v50);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v48, "setSecItemAttributeKey:", *MEMORY[0x1E0CD70D8]);
  objc_msgSend(v2, "addObject:", v48);
  -[VSKeychainItemKind setProperties:](v59, "setProperties:", v2);

  return v59;
}

@end
