@implementation LNSpotlightAppEntityMapper

+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 displayTitle:(id)a6 displaySubtitle:(id)a7 displaySynonyms:(id)a8 typeDisplayName:(id)a9 typeDisplaySynonyms:(id)a10 propertyDictionary:(id)a11 priority:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v46 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v45 = a11;
  v24 = a12;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightAppEntityMapper.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightAppEntityMapper.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceIdentifier"));

LABEL_3:
  if (v46)
  {
    if (v19)
      goto LABEL_5;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightAppEntityMapper.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (v24)
      goto LABEL_6;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightAppEntityMapper.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeIdentifier"));

  if (!v19)
    goto LABEL_27;
LABEL_5:
  if (v24)
    goto LABEL_6;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpotlightAppEntityMapper.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("priority"));

LABEL_6:
  objc_msgSend(v17, "setAttribute:forKey:", v18, CFSTR("_kMDItemAppEntityInstanceIdentifier"));
  objc_msgSend(v17, "setAttribute:forKey:", v46, CFSTR("_kMDItemAppEntityTypeIdentifier"));
  objc_msgSend(v17, "setAttribute:forKey:", v19, CFSTR("kMDItemAppEntityTitle"));
  if (v20)
    objc_msgSend(v17, "setAttribute:forKey:", v20, CFSTR("kMDItemAppEntitySubtitle"));
  if (v21 && objc_msgSend(v21, "count"))
    objc_msgSend(v17, "setAttribute:forKey:", v21, CFSTR("kMDItemAppEntityDisplayRepresentationSynonyms"));
  v42 = v19;
  if (v22)
    objc_msgSend(v17, "setAttribute:forKey:", v22, CFSTR("_kMDItemAppEntityTypeDisplayRepresentationName"));
  v39 = v21;
  v40 = v20;
  v44 = v18;
  if (v23 && objc_msgSend(v23, "count"))
    objc_msgSend(v17, "setAttribute:forKey:", v23, CFSTR("_kMDItemAppEntityTypeDisplayRepresentationSynonyms"));
  v38 = v23;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v45, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v48 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("kMDItemAppEntity"), v46, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKey:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAttribute:forKey:", v32, v31);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v27);
  }

  objc_msgSend(v17, "setAttribute:forKey:", v24, CFSTR("_kMDItemAppEntityPriority"));
}

@end
