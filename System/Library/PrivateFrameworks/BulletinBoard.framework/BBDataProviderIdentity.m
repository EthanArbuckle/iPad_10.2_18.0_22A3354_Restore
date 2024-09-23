@implementation BBDataProviderIdentity

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSArray)defaultSubsectionInfos
{
  return self->_defaultSubsectionInfos;
}

- (NSDictionary)subsectionDisplayNames
{
  return self->_subsectionDisplayNames;
}

- ($EF6D9B9DCA8E297880FBE6E8665EEC65)traits
{
  return ($EF6D9B9DCA8E297880FBE6E8665EEC65)self->_traits;
}

- (BBSectionInfo)defaultSectionInfo
{
  return self->_defaultSectionInfo;
}

+ (id)identityForRemoteDataProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForDataProvider:forRemoteDataProvider:", v4, 1);

  return v5;
}

- (id)initForDataProvider:(id)a3 forRemoteDataProvider:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BBDataProviderIdentity *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  NSString *sectionIdentifier;
  $A68C08489CDB8DFD652923BB52B59B03 traits;
  void *v36;
  uint64_t v37;
  NSString *sectionDisplayName;
  void *v39;
  BBSectionIcon *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *universalSectionIdentifier;
  void *v45;
  uint64_t v46;
  BBSectionInfo *defaultSectionInfo;
  void *v48;
  uint64_t v49;
  NSString *parentSectionIdentifier;
  BBSectionIcon *sectionIcon;
  uint64_t v52;
  NSString *sectionBundlePath;
  void *v54;
  uint64_t v55;
  NSString *sortKey;
  NSObject *v57;
  NSString *v58;
  BBSectionParameters *v59;
  BBSectionParameters *v60;
  NSObject *v61;
  NSString *v62;
  uint64_t v63;
  BBSectionInfo *v64;
  NSObject *v65;
  NSString *v66;
  uint64_t v68;
  BBSectionParameters *sectionParameters;
  void *v70;
  uint64_t v71;
  NSArray *defaultSubsectionInfos;
  void *v73;
  NSArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  void *v80;
  uint64_t v81;
  NSDictionary *subsectionDisplayNames;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  NSString *v92;
  _BYTE v93[128];
  const __CFString *v94;
  _QWORD v95[2];

  v4 = a4;
  v95[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[BBDataProviderIdentity init](self, "init");
  if (!v7)
    goto LABEL_112;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 2;
  else
    v8 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFFD | v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 4;
  else
    v9 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFFB | v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 8;
  else
    v10 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFF7 | v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 16;
  else
    v11 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFEF | v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 32;
  else
    v12 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFDF | v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = 64;
  else
    v13 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFFBF | v13);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 128;
  else
    v14 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFF7F | v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = 256;
  else
    v15 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFEFF | v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = 4096;
  else
    v16 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFEFFF | v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = 512;
  else
    v17 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFDFF | v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = 1024;
  else
    v18 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFFBFF | v18);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = 2048;
  else
    v19 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFF7FF | v19);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = 0x2000;
  else
    v20 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFDFFF | v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = 0x4000;
  else
    v21 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFFBFFF | v21);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = 0x8000;
  else
    v22 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFF7FFF | v22);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v23 = 0x10000;
  else
    v23 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFEFFFF | v23);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = 0x20000;
  else
    v24 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFDFFFF | v24);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = 0x40000;
  else
    v25 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFFBFFFF | v25);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = 0x80000;
  else
    v26 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFF7FFFF | v26);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v27 = 0x100000;
  else
    v27 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFEFFFFF | v27);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v28 = 0x200000;
  else
    v28 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFDFFFFF | v28);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v29 = 0x400000;
  else
    v29 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFFBFFFFF | v29);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v30 = 0x800000;
  else
    v30 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFF7FFFFF | v30);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = 0x1000000;
  else
    v31 = 0;
  v7->_traits = ($A68C08489CDB8DFD652923BB52B59B03)(*(_DWORD *)&v7->_traits & 0xFEFFFFFF | v31);
  objc_msgSend(v6, "sectionIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "copy");
  sectionIdentifier = v7->_sectionIdentifier;
  v7->_sectionIdentifier = (NSString *)v33;

  if (!v7->_sectionIdentifier && v4)
  {
    v83 = (void *)MEMORY[0x24BDBCE88];
    v84 = *MEMORY[0x24BDBCAB8];
    v94 = CFSTR("dataProvider");
    v95[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "exceptionWithName:reason:userInfo:", v84, CFSTR("data providers must provide a valid sectionIdentifier"), v85);
    v86 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v86);
  }
  traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x400000) != 0)
  {
    objc_msgSend(v6, "universalSectionIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    universalSectionIdentifier = v7->_universalSectionIdentifier;
    v7->_universalSectionIdentifier = (NSString *)v43;

    traits = v7->_traits;
    if ((*(_WORD *)&traits & 0x200) == 0)
    {
LABEL_78:
      if ((*(_DWORD *)&traits & 0x800000) == 0)
        goto LABEL_79;
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&traits & 0x200) == 0)
  {
    goto LABEL_78;
  }
  objc_msgSend(v6, "defaultSectionInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "copy");
  defaultSectionInfo = v7->_defaultSectionInfo;
  v7->_defaultSectionInfo = (BBSectionInfo *)v46;

  traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x800000) == 0)
  {
LABEL_79:
    if ((*(_WORD *)&traits & 0x4000) == 0)
      goto LABEL_81;
    goto LABEL_80;
  }
LABEL_87:
  objc_msgSend(v6, "parentSectionIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "copy");
  parentSectionIdentifier = v7->_parentSectionIdentifier;
  v7->_parentSectionIdentifier = (NSString *)v49;

  traits = v7->_traits;
  if ((*(_WORD *)&traits & 0x4000) != 0)
  {
LABEL_80:
    objc_msgSend(v6, "sectionDisplayName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    sectionDisplayName = v7->_sectionDisplayName;
    v7->_sectionDisplayName = (NSString *)v37;

    traits = v7->_traits;
  }
LABEL_81:
  if ((*(_DWORD *)&traits & 0x18000) != 0)
  {
    if ((*(_WORD *)&traits & 0x8000) != 0)
    {
      objc_msgSend(v6, "sectionIcon");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (BBSectionIcon *)objc_msgSend(v39, "copy");
    }
    else
    {
      objc_msgSend(v6, "sectionIconData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "length"))
      {
        v40 = objc_alloc_init(BBSectionIcon);
        +[BBSectionIconVariant variantWithFormat:imageData:](BBSectionIconVariant, "variantWithFormat:imageData:", 0, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBSectionIcon addVariant:](v40, "addVariant:", v41);

      }
      else
      {
        v40 = 0;
      }
    }

    sectionIcon = v7->_sectionIcon;
    v7->_sectionIcon = v40;

    traits = v7->_traits;
  }
  if ((*(_WORD *)&traits & 0x1000) != 0)
  {
    objc_msgSend(v6, "sectionParameters");
    v68 = objc_claimAutoreleasedReturnValue();
    sectionParameters = v7->_sectionParameters;
    v7->_sectionParameters = (BBSectionParameters *)v68;

    traits = v7->_traits;
    if ((*(_WORD *)&traits & 0x400) == 0)
    {
LABEL_94:
      if ((*(_WORD *)&traits & 0x800) == 0)
        goto LABEL_95;
      goto LABEL_115;
    }
  }
  else if ((*(_WORD *)&traits & 0x400) == 0)
  {
    goto LABEL_94;
  }
  objc_msgSend(v6, "defaultSubsectionInfos");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "copy");
  defaultSubsectionInfos = v7->_defaultSubsectionInfos;
  v7->_defaultSubsectionInfos = (NSArray *)v71;

  traits = v7->_traits;
  if ((*(_WORD *)&traits & 0x800) == 0)
  {
LABEL_95:
    if ((*(_DWORD *)&traits & 0x80000) == 0)
      goto LABEL_96;
LABEL_129:
    v7->_syncsBulletinDismissal = objc_msgSend(v6, "syncsBulletinDismissal", (_QWORD)v87);
    if ((*(_DWORD *)&v7->_traits & 0x1000000) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v74 = v7->_defaultSubsectionInfos;
  v75 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v88 != v77)
          objc_enumerationMutation(v74);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "subsectionID", (_QWORD)v87);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          objc_msgSend(v6, "displayNameForSubsectionID:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80)
            objc_msgSend(v73, "setObject:forKey:", v80, v79);

        }
      }
      v76 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v76);
  }

  if (objc_msgSend(v73, "count"))
  {
    v81 = objc_msgSend(v73, "copy");
    subsectionDisplayNames = v7->_subsectionDisplayNames;
    v7->_subsectionDisplayNames = (NSDictionary *)v81;

  }
  traits = v7->_traits;
  if ((*(_DWORD *)&traits & 0x80000) != 0)
    goto LABEL_129;
LABEL_96:
  if ((*(_DWORD *)&traits & 0x1000000) != 0)
  {
LABEL_97:
    objc_msgSend(v6, "sectionBundlePath", (_QWORD)v87);
    v52 = objc_claimAutoreleasedReturnValue();
    sectionBundlePath = v7->_sectionBundlePath;
    v7->_sectionBundlePath = (NSString *)v52;

  }
LABEL_98:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_sortKey");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "copy");
    sortKey = v7->_sortKey;
    v7->_sortKey = (NSString *)v55;

  }
  if (!v7->_sectionParameters)
  {
    v57 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v58;
      _os_log_impl(&dword_20CCB9000, v57, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> provided no section parameters. Using default parameters.", buf, 0xCu);
    }
    v59 = objc_alloc_init(BBSectionParameters);
    v60 = v7->_sectionParameters;
    v7->_sectionParameters = v59;

  }
  if (!v7->_defaultSectionInfo)
  {
    v61 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v62 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v62;
      _os_log_impl(&dword_20CCB9000, v61, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> provided no default section info. Using defaults.", buf, 0xCu);
    }
    +[BBSectionInfo defaultSectionInfoForType:](BBSectionInfo, "defaultSectionInfoForType:", 0, (_QWORD)v87);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v7->_defaultSectionInfo;
    v7->_defaultSectionInfo = (BBSectionInfo *)v63;

  }
  if (!v7->_sortDescriptors)
  {
    v65 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v7->_sectionIdentifier;
      *(_DWORD *)buf = 138543362;
      v92 = v66;
      _os_log_impl(&dword_20CCB9000, v65, OS_LOG_TYPE_DEFAULT, "BBDataProvider: Data provider <%{public}@> is missing sort descriptors -- section will not be sorted!", buf, 0xCu);
    }
  }
  -[BBSectionInfo setSectionID:](v7->_defaultSectionInfo, "setSectionID:", v7->_sectionIdentifier, (_QWORD)v87);
  -[BBSectionInfo setDisplayName:](v7->_defaultSectionInfo, "setDisplayName:", v7->_sectionDisplayName);
  -[BBSectionInfo setIcon:](v7->_defaultSectionInfo, "setIcon:", v7->_sectionIcon);
  -[BBSectionParameters setDisplayName:](v7->_sectionParameters, "setDisplayName:", v7->_sectionDisplayName);
  -[BBSectionParameters setIcon:](v7->_sectionParameters, "setIcon:", v7->_sectionIcon);
LABEL_112:

  return v7;
}

- (BBSectionParameters)sectionParameters
{
  return self->_sectionParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterDisplayNames, 0);
  objc_storeStrong((id *)&self->_sectionBundlePath, 0);
  objc_storeStrong((id *)&self->_parentSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_subsectionDisplayNames, 0);
  objc_storeStrong((id *)&self->_defaultSubsectionInfos, 0);
  objc_storeStrong((id *)&self->_sectionParameters, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionIcon, 0);
  objc_storeStrong((id *)&self->_sectionDisplayName, 0);
  objc_storeStrong((id *)&self->_defaultSectionInfo, 0);
  objc_storeStrong((id *)&self->_universalSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  $A68C08489CDB8DFD652923BB52B59B03 *p_traits;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCE50];
  p_traits = &self->_traits;
  v6 = a3;
  objc_msgSend(v4, "dataWithBytes:length:", p_traits, 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_traits"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sortKey, CFSTR("_sortKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionIdentifier, CFSTR("_sectionIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_universalSectionIdentifier, CFSTR("_universalSectionIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultSectionInfo, CFSTR("_defaultSectionInfo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionDisplayName, CFSTR("_sectionDisplayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionIcon, CFSTR("_sectionIcon"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("_sortDescriptors"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionParameters, CFSTR("_sectionParameters"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_defaultSubsectionInfos, CFSTR("_defaultSubsectionInfos"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subsectionDisplayNames, CFSTR("_subsectionDisplayNames"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_syncsBulletinDismissal, CFSTR("_syncsBulletinDismissal"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_parentSectionIdentifier, CFSTR("_parentSectionIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectionBundlePath, CFSTR("_sectionBundlePath"));

}

- (BBDataProviderIdentity)initWithCoder:(id)a3
{
  id v4;
  BBDataProviderIdentity *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *sortKey;
  uint64_t v10;
  NSString *sectionIdentifier;
  uint64_t v12;
  NSString *universalSectionIdentifier;
  uint64_t v14;
  BBSectionInfo *defaultSectionInfo;
  uint64_t v16;
  NSString *sectionDisplayName;
  uint64_t v18;
  BBSectionIcon *sectionIcon;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *sortDescriptors;
  uint64_t v26;
  BBSectionParameters *sectionParameters;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *defaultSubsectionInfos;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *subsectionDisplayNames;
  uint64_t v38;
  NSString *parentSectionIdentifier;
  uint64_t v40;
  NSString *sectionBundlePath;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[BBDataProviderIdentity init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traits"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "getBytes:length:", &v5->_traits, 4);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sortKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    sortKey = v5->_sortKey;
    v5->_sortKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_universalSectionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    universalSectionIdentifier = v5->_universalSectionIdentifier;
    v5->_universalSectionIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultSectionInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    defaultSectionInfo = v5->_defaultSectionInfo;
    v5->_defaultSectionInfo = (BBSectionInfo *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionDisplayName"));
    v16 = objc_claimAutoreleasedReturnValue();
    sectionDisplayName = v5->_sectionDisplayName;
    v5->_sectionDisplayName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionIcon"));
    v18 = objc_claimAutoreleasedReturnValue();
    sectionIcon = v5->_sectionIcon;
    v5->_sectionIcon = (BBSectionIcon *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_sortDescriptors"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[BBBulletin validSortDescriptorsFromSortDescriptors:](BBBulletin, "validSortDescriptorsFromSortDescriptors:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionParameters"));
    v26 = objc_claimAutoreleasedReturnValue();
    sectionParameters = v5->_sectionParameters;
    v5->_sectionParameters = (BBSectionParameters *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("_defaultSubsectionInfos"));
    v31 = objc_claimAutoreleasedReturnValue();
    defaultSubsectionInfos = v5->_defaultSubsectionInfos;
    v5->_defaultSubsectionInfos = (NSArray *)v31;

    v33 = (void *)MEMORY[0x24BDBCF20];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithArray:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("_subsectionDisplayNames"));
    v36 = objc_claimAutoreleasedReturnValue();
    subsectionDisplayNames = v5->_subsectionDisplayNames;
    v5->_subsectionDisplayNames = (NSDictionary *)v36;

    v5->_syncsBulletinDismissal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_syncsBulletinDismissal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_parentSectionIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    parentSectionIdentifier = v5->_parentSectionIdentifier;
    v5->_parentSectionIdentifier = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionBundlePath"));
    v40 = objc_claimAutoreleasedReturnValue();
    sectionBundlePath = v5->_sectionBundlePath;
    v5->_sectionBundlePath = (NSString *)v40;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p; %@>"),
               objc_opt_class(),
               self,
               self->_sectionIdentifier);
}

+ (id)identityForDataProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForDataProvider:forRemoteDataProvider:", v4, 0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)universalSectionIdentifier
{
  return self->_universalSectionIdentifier;
}

- (void)setUniversalSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDefaultSectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sectionDisplayName
{
  return self->_sectionDisplayName;
}

- (void)setSectionDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BBSectionIcon)sectionIcon
{
  return self->_sectionIcon;
}

- (void)setSectionIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSectionParameters:(id)a3
{
  objc_storeStrong((id *)&self->_sectionParameters, a3);
}

- (void)setDefaultSubsectionInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSubsectionDisplayNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)parentSectionIdentifier
{
  return self->_parentSectionIdentifier;
}

- (void)setParentSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)sectionBundlePath
{
  return self->_sectionBundlePath;
}

- (void)setSectionBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)syncsBulletinDismissal
{
  return self->_syncsBulletinDismissal;
}

- (NSDictionary)filterDisplayNames
{
  return self->_filterDisplayNames;
}

- (void)setFilterDisplayNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

@end
