@implementation MontrealNNDescription

- (MontrealNNDescription)descriptionWithIndent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend_indentByFactor_(v4, v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("\r %@ {"), v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v11, v15, (uint64_t)v14, v16);

  if (objc_msgSend_conformsToProtocol_(self, v17, (uint64_t)&unk_1EE41B6B8, v18))
    objc_msgSend_description_indent_(self, v19, (uint64_t)v11, (uint64_t)v7);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("\r %@ }"), v20, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v11, v22, (uint64_t)v21, v23);

  return (MontrealNNDescription *)v11;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_indentWithLevel_(MontrealLogIndent, a2, (uint64_t)CFSTR("    "), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionWithIndent_(self, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)checkForValidity:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v48;
    v10 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v3);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend_objectAtIndexedSubscript_(v19, v6, 0, v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v19, v21, 1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!objc_msgSend_count(v23, v24, v25, v26))
            sub_19C09C77C(CFSTR("%@ %@ has 0 elements"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)self);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v23)
              sub_19C09C77C(CFSTR("%@ %@ is nil"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)self);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = v10;
              v35 = v23;
              if (!objc_msgSend_unsignedIntegerValue(v35, v36, v37, v38))
                sub_19C09C77C(CFSTR("%@ %@: %@ is invalid"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)self);

              v10 = v34;
            }
          }
        }

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v8);
  }

}

@end
