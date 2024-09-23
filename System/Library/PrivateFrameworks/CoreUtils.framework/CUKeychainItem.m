@implementation CUKeychainItem

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setSyncType:(int)a3
{
  self->_syncType = a3;
}

- (NSData)persistentRef
{
  return self->_persistentRef;
}

- (id)_attributesDictionaryWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v7;
  NSString *accessGroup;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  id v16;
  NSString *identifier;
  NSDictionary *v18;
  NSDictionary *v19;
  CFMutableDataRef DataMutable;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFMutableDataRef v27;
  NSString *name;
  NSData *persistentRef;
  NSDictionary *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *v37;
  CFMutableDataRef v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFMutableDataRef v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *type;
  NSString *userDescription;
  NSString *viewHint;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v7;
  if ((a3 & 0x80000) == 0)
  {
    accessGroup = self->_accessGroup;
    if (accessGroup)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", accessGroup, *MEMORY[0x1E0CD6898]);
  }
  v15 = (_QWORD *)MEMORY[0x1E0CD68E8];
  switch(self->_accessibleType)
  {
    case 0:
      goto LABEL_14;
    case 1:
      goto LABEL_13;
    case 2:
      v15 = (_QWORD *)MEMORY[0x1E0CD68A8];
      goto LABEL_13;
    case 3:
      v15 = (_QWORD *)MEMORY[0x1E0CD68C0];
      goto LABEL_13;
    case 4:
      v15 = (_QWORD *)MEMORY[0x1E0CD68E0];
      goto LABEL_13;
    case 5:
      v15 = (_QWORD *)MEMORY[0x1E0CD68F0];
      goto LABEL_13;
    case 6:
      v15 = (_QWORD *)MEMORY[0x1E0CD68B0];
      goto LABEL_13;
    case 7:
      v15 = (_QWORD *)MEMORY[0x1E0CD68D0];
LABEL_13:
      objc_msgSend(v14, "setObject:forKeyedSubscript:", *v15, *MEMORY[0x1E0CD68A0]);
LABEL_14:
      if ((a3 & 0x80000) == 0)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
      identifier = self->_identifier;
      if (identifier)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", identifier, *MEMORY[0x1E0CD68F8]);
      if (self->_invisible)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD69C0]);
      v18 = self->_metadata;
      v19 = v18;
      if (!v18)
        goto LABEL_23;
      v55 = 0;
      DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)v18, 8, (int *)&v55);
      if (DataMutable)
      {
        v27 = DataMutable;
        objc_msgSend(v14, "setObject:forKeyedSubscript:", DataMutable, *MEMORY[0x1E0CD69B0]);

LABEL_23:
        name = self->_name;
        if (name)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", name, *MEMORY[0x1E0CD6A90]);
        persistentRef = self->_persistentRef;
        if (persistentRef)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", persistentRef, *MEMORY[0x1E0CD70E0]);
        v30 = self->_secrets;
        v37 = v30;
        if (v30)
        {
          v54 = 0;
          v38 = OPACKEncoderCreateDataMutable((const __CFString *)v30, 8, (int *)&v54);
          if (!v38)
          {
            if (a4)
            {
              if (v54)
                v48 = v54;
              else
                v48 = 4294960596;
              NSErrorWithOSStatusF(v48, (uint64_t)"Encode secrets failed", v39, v40, v41, v42, v43, v44, v53);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_44:
            v16 = 0;
            goto LABEL_64;
          }
          v45 = v38;
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0CD70D8]);

        }
        if ((a3 & 0x80000) == 0)
        {
          v46 = (_QWORD *)MEMORY[0x1E0C9AE40];
          switch(self->_syncType)
          {
            case 0:
              break;
            case 1:
              goto LABEL_48;
            case 2:
              v46 = (_QWORD *)MEMORY[0x1E0C9AE50];
              goto LABEL_48;
            case 3:
              v46 = (_QWORD *)MEMORY[0x1E0CD6B88];
LABEL_48:
              objc_msgSend(v14, "setObject:forKeyedSubscript:", *v46, *MEMORY[0x1E0CD6B80]);
              break;
            default:
              if (!a4)
                goto LABEL_44;
              NSErrorWithOSStatusF(4294960591, (uint64_t)"Unknown SyncType (%d)", v31, v32, v33, v34, v35, v36, self->_syncType);
              v16 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_64;
          }
        }
        if ((a3 & 0x20) != 0)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C0]);
        type = self->_type;
        if (type)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", type, *MEMORY[0x1E0CD6B58]);
        userDescription = self->_userDescription;
        if (userDescription)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", userDescription, *MEMORY[0x1E0CD69A0]);
        if ((a3 & 0x80000) == 0)
        {
          viewHint = self->_viewHint;
          if (viewHint)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", viewHint, *MEMORY[0x1E0CD6B78]);
        }
        if ((a3 & 0x40000) != 0)
        {
          objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
          if ((a3 & 8) == 0)
          {
LABEL_60:
            if ((a3 & 0x10000) == 0)
              goto LABEL_61;
            goto LABEL_69;
          }
        }
        else if ((a3 & 8) == 0)
        {
          goto LABEL_60;
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7020]);
        if ((a3 & 0x10000) == 0)
        {
LABEL_61:
          if ((a3 & 0x20000) == 0)
          {
LABEL_63:
            v16 = v14;
LABEL_64:

            goto LABEL_65;
          }
LABEL_62:
          objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
          goto LABEL_63;
        }
LABEL_69:
        objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
        if ((a3 & 0x20000) == 0)
          goto LABEL_63;
        goto LABEL_62;
      }
      if (a4)
      {
        if (v55)
          v47 = v55;
        else
          v47 = 4294960596;
        NSErrorWithOSStatusF(v47, (uint64_t)"Encode metadata failed", v21, v22, v23, v24, v25, v26, v53);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = 0;
LABEL_65:

LABEL_66:
      return v16;
    default:
      if (a4)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"Unknown AccessibleType (%d)", (uint64_t)accessGroup, v9, v10, v11, v12, v13, self->_accessibleType);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_66;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_secrets, 0);
  objc_storeStrong((id *)&self->_persistentRef, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_removedMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

- (id)description
{
  return -[CUKeychainItem descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;
  CFMutableStringRef *v11;
  __CFString *v12;
  NSString *type;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  CFMutableStringRef *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  NSDate *dateCreated;
  NSDate *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  NSDate *dateModified;
  NSDate *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __CFString *v56;
  uint64_t v57;
  NSDictionary *v58;
  NSDictionary *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __CFString *v67;
  NSData *v68;
  NSData *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __CFString *v77;
  NSDictionary *secrets;
  NSDictionary *v79;
  CFMutableStringRef *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSDictionary *metadata;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __CFString *v94;
  NSData *persistentRef;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __CFString *v102;
  NSDictionary *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __CFString *v116;
  NSString *viewHint;
  NSString *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  __CFString *v125;
  __CFString *v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  NSDictionary *v132;
  NSData *v133;
  CFMutableStringRef v134;
  CFMutableStringRef v135;
  CFMutableStringRef v136;
  CFMutableStringRef v137;
  CFMutableStringRef v138;
  CFMutableStringRef v139;
  CFMutableStringRef v140;
  CFMutableStringRef v141;
  CFMutableStringRef v142;
  CFMutableStringRef v143;
  CFMutableStringRef v144;
  CFMutableStringRef v145;
  CFMutableStringRef v146;
  CFMutableStringRef v147;
  CFMutableStringRef v148;
  CFMutableStringRef v149;
  CFMutableStringRef v150;

  if ((a3 & 0x8000000) != 0)
  {
    v10 = 0;
    if ((a3 & 0x800000) != 0)
      goto LABEL_3;
  }
  else
  {
    v150 = 0;
    NSAppendPrintF(&v150, (uint64_t)"CUKeychainItem ", *(uint64_t *)&a3, v3, v4, v5, v6, v7, v128);
    v10 = v150;
    if ((a3 & 0x800000) != 0)
    {
LABEL_3:
      v149 = v10;
      v11 = &v149;
      NSAppendPrintF(&v149, (uint64_t)"ID '%@'", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
      goto LABEL_6;
    }
  }
  v148 = v10;
  v11 = &v148;
  NSAppendPrintF(&v148, (uint64_t)"ID '%{mask}'", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
LABEL_6:
  v12 = *v11;

  type = self->_type;
  if (type)
  {
    v147 = v12;
    v14 = type;
    NSAppendPrintF(&v147, (uint64_t)", Type '%@'", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    v21 = v147;

    v12 = v21;
  }
  v22 = self->_name;
  v29 = v22;
  if (v22)
  {
    if ((a3 & 0x800000) != 0)
    {
      v146 = v12;
      v30 = &v146;
      NSAppendPrintF(&v146, (uint64_t)", Name '%@'", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    }
    else
    {
      v145 = v12;
      v30 = &v145;
      NSAppendPrintF(&v145, (uint64_t)", Name '%{mask}'", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    }
    v31 = *v30;

    v12 = v31;
  }

  v38 = a3;
  if (a3 < 0x1Fu)
  {
    dateCreated = self->_dateCreated;
    if (dateCreated)
    {
      v144 = v12;
      v40 = dateCreated;
      NSAppendPrintF(&v144, (uint64_t)", Created %@", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
      v47 = v144;

      v12 = v47;
    }
    dateModified = self->_dateModified;
    if (dateModified)
    {
      v143 = v12;
      v49 = dateModified;
      NSAppendPrintF(&v143, (uint64_t)", Modified %@", v50, v51, v52, v53, v54, v55, (uint64_t)v49);
      v56 = v143;

      v57 = 100;
      v12 = v56;
    }
    else
    {
      v57 = 100;
    }
    goto LABEL_27;
  }
  if (a3 < 0x29u)
  {
    v57 = 16;
LABEL_27:
    metadata = self->_metadata;
    if (metadata)
    {
      v142 = v12;
      v132 = metadata;
      NSAppendPrintF(&v142, (uint64_t)", Metadata %##.*@", v88, v89, v90, v91, v92, v93, v57);
      v94 = v142;

      v12 = v94;
    }
    persistentRef = self->_persistentRef;
    if (persistentRef)
    {
      v141 = v12;
      v133 = persistentRef;
      NSAppendPrintF(&v141, (uint64_t)", PersistentRef <%.*@>", v96, v97, v98, v99, v100, v101, v57);
      v102 = v141;

      v12 = v102;
    }
    v103 = self->_secrets;
    v79 = v103;
    if (!v103)
      goto LABEL_36;
    if ((a3 & 0x800000) != 0)
    {
      v140 = v12;
      v80 = &v140;
      NSAppendPrintF(&v140, (uint64_t)", Secrets %##.*@", v104, v105, v106, v107, v108, v109, v57);
    }
    else
    {
      v139 = v12;
      v131 = -[NSDictionary count](v103, "count");
      v80 = &v139;
      NSAppendPrintF(&v139, (uint64_t)", Secrets (%d)", v110, v111, v112, v113, v114, v115, v131);
    }
LABEL_35:
    v116 = *v80;

    v12 = v116;
LABEL_36:

    goto LABEL_37;
  }
  v58 = self->_metadata;
  if (v58)
  {
    v138 = v12;
    v59 = v58;
    v60 = -[NSDictionary count](v59, "count");
    NSAppendPrintF(&v138, (uint64_t)", Metadata (%d)", v61, v62, v63, v64, v65, v66, v60);
    v67 = v138;

    v12 = v67;
  }
  v68 = self->_persistentRef;
  if (v68)
  {
    v137 = v12;
    v69 = v68;
    v70 = -[NSData length](v69, "length");
    NSAppendPrintF(&v137, (uint64_t)", PersistentRef %d bytes", v71, v72, v73, v74, v75, v76, v70);
    v77 = v137;

    v12 = v77;
  }
  secrets = self->_secrets;
  if (secrets)
  {
    v136 = v12;
    v79 = secrets;
    v130 = -[NSDictionary count](v79, "count");
    v80 = &v136;
    NSAppendPrintF(&v136, (uint64_t)", Secrets (%d)", v81, v82, v83, v84, v85, v86, v130);
    goto LABEL_35;
  }
LABEL_37:
  viewHint = self->_viewHint;
  if (viewHint)
  {
    v135 = v12;
    v118 = viewHint;
    NSAppendPrintF(&v135, (uint64_t)", View '%@'", v119, v120, v121, v122, v123, v124, (uint64_t)v118);
    v125 = v135;

    v12 = v125;
  }
  if (v38 < 0x15)
  {
    v134 = v12;
    NSAppendPrintF(&v134, (uint64_t)"\n", v32, v33, v34, v35, v36, v37, v129);
    v126 = v134;

    v12 = v126;
  }
  return v12;
}

- (BOOL)isEqualToKeychainItem:(id)a3 flags:(unsigned int)a4
{
  char v4;
  id v6;
  NSString *identifier;
  void *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  int v12;
  int invisible;
  NSString *type;
  void *v15;
  NSDictionary *v16;
  int v17;
  NSString *name;
  void *v19;
  NSDictionary *v20;
  int v21;
  NSDictionary *metadata;
  void *v23;
  NSDictionary *v24;
  int v25;
  NSString *userDescription;
  void *v27;
  NSDictionary *v28;
  int v29;
  char v30;
  NSDictionary *secrets;
  void *v32;
  NSDictionary *v33;

  v4 = a4;
  v6 = a3;
  identifier = self->_identifier;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = identifier;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if ((v9 == 0) == (v10 != 0))
      goto LABEL_32;
    v12 = -[NSDictionary isEqual:](v9, "isEqual:", v10);

    if (!v12)
      goto LABEL_25;
  }
  invisible = self->_invisible;
  if (invisible == objc_msgSend(v6, "invisible"))
  {
    type = self->_type;
    objc_msgSend(v6, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = type;
    v16 = v15;
    if (v9 == v16)
    {

    }
    else
    {
      v11 = v16;
      if ((v9 == 0) == (v16 != 0))
        goto LABEL_32;
      v17 = -[NSDictionary isEqual:](v9, "isEqual:", v16);

      if (!v17)
        goto LABEL_25;
    }
    name = self->_name;
    objc_msgSend(v6, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = name;
    v20 = v19;
    if (v9 == v20)
    {

    }
    else
    {
      v11 = v20;
      if ((v9 == 0) == (v20 != 0))
        goto LABEL_32;
      v21 = -[NSDictionary isEqual:](v9, "isEqual:", v20);

      if (!v21)
        goto LABEL_25;
    }
    metadata = self->_metadata;
    objc_msgSend(v6, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = metadata;
    v24 = v23;
    if (v9 == v24)
    {

    }
    else
    {
      v11 = v24;
      if ((v9 == 0) == (v24 != 0))
        goto LABEL_32;
      v25 = -[NSDictionary isEqual:](v9, "isEqual:", v24);

      if (!v25)
        goto LABEL_25;
    }
    userDescription = self->_userDescription;
    objc_msgSend(v6, "userDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = userDescription;
    v28 = v27;
    if (v9 == v28)
    {

    }
    else
    {
      v11 = v28;
      if ((v9 == 0) == (v28 != 0))
        goto LABEL_32;
      v29 = -[NSDictionary isEqual:](v9, "isEqual:", v28);

      if (!v29)
        goto LABEL_25;
    }
    if ((v4 & 1) == 0)
    {
      v30 = 1;
      goto LABEL_34;
    }
    secrets = self->_secrets;
    objc_msgSend(v6, "secrets");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = secrets;
    v33 = v32;
    if (v9 == v33)
    {
      v30 = 1;
      v11 = v9;
      goto LABEL_33;
    }
    v11 = v33;
    if ((v9 == 0) != (v33 != 0))
    {
      v30 = -[NSDictionary isEqual:](v9, "isEqual:", v33);
LABEL_33:

      goto LABEL_34;
    }
LABEL_32:
    v30 = 0;
    goto LABEL_33;
  }
LABEL_25:
  v30 = 0;
LABEL_34:

  return v30;
}

- (void)_mergeItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *metadata;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSDictionary *v22;
  NSDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *secrets;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_accessGroup, v5);

  v6 = objc_msgSend(v4, "accessibleType");
  if (v6)
    self->_accessibleType = v6;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_storeStrong((id *)&self->_identifier, v7);

  self->_invisible = objc_msgSend(v4, "invisible");
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)-[NSDictionary mutableCopy](self->_metadata, "mutableCopy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = v11;

    objc_msgSend(v12, "addEntriesFromDictionary:", v8);
    v13 = (NSDictionary *)objc_msgSend(v12, "copy");
    metadata = self->_metadata;
    self->_metadata = v13;

  }
  objc_msgSend(v4, "removedMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)-[NSDictionary mutableCopy](self->_metadata, "mutableCopy");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), (_QWORD)v36);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v19);
    }

    v22 = (NSDictionary *)objc_msgSend(v16, "copy");
    v23 = self->_metadata;
    self->_metadata = v22;

  }
  objc_msgSend(v4, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_storeStrong((id *)&self->_name, v24);

  objc_msgSend(v4, "secrets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)-[NSDictionary mutableCopy](self->_secrets, "mutableCopy");
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = v28;

    objc_msgSend(v29, "addEntriesFromDictionary:", v25);
    v30 = (NSDictionary *)objc_msgSend(v29, "copy");
    secrets = self->_secrets;
    self->_secrets = v30;

  }
  v32 = objc_msgSend(v4, "syncType", (_QWORD)v36);
  if (v32)
    self->_syncType = v32;
  objc_msgSend(v4, "type");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_storeStrong((id *)&self->_type, v33);

  objc_msgSend(v4, "userDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_storeStrong((id *)&self->_userDescription, v34);

  objc_msgSend(v4, "viewHint");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_storeStrong((id *)&self->_viewHint, v35);

}

- (BOOL)_updateWithAttributesDictionary:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  char v6;
  const __CFDictionary *v8;
  const void *v9;
  CFTypeID TypeID;
  void *v11;
  const void *v12;
  CFTypeID v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  CFTypeID v24;
  void *v25;
  const void *v26;
  CFTypeID v27;
  void *v28;
  const void *v29;
  CFTypeID v30;
  void *v31;
  const void *v32;
  CFTypeID v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSDictionary *v41;
  uint64_t v42;
  const char *v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSDictionary *metadata;
  const void *v54;
  CFTypeID v55;
  void *v56;
  const void *v57;
  CFTypeID v58;
  void *v59;
  const void *v60;
  CFTypeID v61;
  void *v62;
  void *v63;
  void *v64;
  void **v65;
  const __CFString **v66;
  NSDictionary *v67;
  objc_class *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  NSDictionary *secrets;
  const void *v78;
  CFTypeID v79;
  void *v80;
  const void *v81;
  CFTypeID v82;
  void *v83;
  const void *v84;
  CFTypeID v85;
  void *v86;
  uint64_t v88;
  unsigned int v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  _QWORD v99[2];

  v6 = a4;
  v99[1] = *MEMORY[0x1E0C80C00];
  v8 = (const __CFDictionary *)a3;
  v9 = (const void *)*MEMORY[0x1E0CD6898];
  TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v9, TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_storeStrong((id *)&self->_accessGroup, v11);

  v12 = (const void *)*MEMORY[0x1E0CD68A0];
  v13 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CD68E8]) & 1) != 0)
    {
      v16 = 1;
    }
    else if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68A8]) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68C0]) & 1) != 0)
    {
      v16 = 3;
    }
    else if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68E0]) & 1) != 0)
    {
      v16 = 4;
    }
    else if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68F0]) & 1) != 0)
    {
      v16 = 5;
    }
    else if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68B0]) & 1) != 0)
    {
      v16 = 6;
    }
    else
    {
      if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD68D0]) & 1) == 0)
      {
        if (a5)
        {
          NSErrorWithOSStatusF(4294960561, (uint64_t)"Unsupported kSecAttrAccessible (%@)", v17, v18, v19, v20, v21, v22, (uint64_t)v15);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_69;
      }
      v16 = 7;
    }
    self->_accessibleType = v16;
  }

  v23 = (const void *)*MEMORY[0x1E0CD6990];
  v24 = CFDateGetTypeID();
  CFDictionaryGetTypedValue(v8, v23, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_storeStrong((id *)&self->_dateCreated, v25);

  v26 = (const void *)*MEMORY[0x1E0CD6A98];
  v27 = CFDateGetTypeID();
  CFDictionaryGetTypedValue(v8, v26, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_storeStrong((id *)&self->_dateModified, v28);

  v29 = (const void *)*MEMORY[0x1E0CD68F8];
  v30 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v29, v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_storeStrong((id *)&self->_identifier, v31);

  self->_invisible = CFDictionaryGetInt64(v8, (const void *)*MEMORY[0x1E0CD69C0], 0) != 0;
  v32 = (const void *)*MEMORY[0x1E0CD69B0];
  v33 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, v32, v33, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
  if (v34 && objc_msgSend(v34, "length"))
  {
    v89 = 0;
    v41 = (NSDictionary *)OPACKDecodeData((const __CFData *)v15, 8u, &v89);
    if (!v41)
    {
      if ((v6 & 4) == 0)
      {
        if (a5)
        {
          if (v89)
            v42 = v89;
          else
            v42 = 4294960534;
          v43 = "Decode metadata failed";
LABEL_54:
          NSErrorWithOSStatusF(v42, (uint64_t)v43, v35, v36, v37, v38, v39, v40, v88);
          v41 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_68;
        }
        goto LABEL_59;
      }
      v98 = CFSTR("_legacyData");
      v99[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
      v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((v6 & 4) == 0)
      {
        if (!a5)
        {
LABEL_68:

LABEL_69:
          v75 = 0;
          goto LABEL_79;
        }
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF(4294960540, (uint64_t)"Decoded metadata non-dictionary (%@)", v46, v47, v48, v49, v50, v51, (uint64_t)v45);
LABEL_67:
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
      v96 = CFSTR("_legacyData");
      v97 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v52 = objc_claimAutoreleasedReturnValue();

      v41 = (NSDictionary *)v52;
    }
    metadata = self->_metadata;
    self->_metadata = v41;

  }
  v54 = (const void *)*MEMORY[0x1E0CD6A90];
  v55 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v54, v55, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
    objc_storeStrong((id *)&self->_name, v56);

  v57 = (const void *)*MEMORY[0x1E0CD70E0];
  v58 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, v57, v58, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    objc_storeStrong((id *)&self->_persistentRef, v59);

  v60 = (const void *)*MEMORY[0x1E0CD70D8];
  v61 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, v60, v61, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v62;
  if (v62 && objc_msgSend(v62, "length"))
  {
    v89 = 0;
    v41 = (NSDictionary *)OPACKDecodeData((const __CFData *)v15, 8u, &v89);
    if (v41)
    {
LABEL_63:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((v6 & 4) == 0)
        {
          if (!a5)
            goto LABEL_68;
          v68 = (objc_class *)objc_opt_class();
          NSStringFromClass(v68);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          NSErrorWithOSStatusF(4294960540, (uint64_t)"Decoded secrets non-dictionary (%@)", v69, v70, v71, v72, v73, v74, (uint64_t)v45);
          goto LABEL_67;
        }
        v90 = CFSTR("_legacyData");
        v91 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v76 = objc_claimAutoreleasedReturnValue();

        v41 = (NSDictionary *)v76;
      }
      secrets = self->_secrets;
      self->_secrets = v41;

      goto LABEL_72;
    }
    if ((v6 & 4) == 0)
    {
      if (a5)
      {
        if (v89)
          v42 = v89;
        else
          v42 = 4294960534;
        v43 = "Decode secrets failed";
        goto LABEL_54;
      }
LABEL_59:
      v41 = 0;
      goto LABEL_68;
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v15, 0, 0, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((v6 & 0x10) != 0)
      {
        v67 = v63;
        goto LABEL_62;
      }
      v94 = CFSTR("_legacyPlist");
      v95 = v63;
      v64 = (void *)MEMORY[0x1E0C99D80];
      v65 = &v95;
      v66 = &v94;
    }
    else
    {
      v92 = CFSTR("_legacyData");
      v93 = v15;
      v64 = (void *)MEMORY[0x1E0C99D80];
      v65 = &v93;
      v66 = &v92;
    }
    objc_msgSend(v64, "dictionaryWithObjects:forKeys:count:", v65, v66, 1);
    v67 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_62:
    v41 = v67;

    goto LABEL_63;
  }
LABEL_72:

  v78 = (const void *)*MEMORY[0x1E0CD6B58];
  v79 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v78, v79, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
    objc_storeStrong((id *)&self->_type, v80);

  v81 = (const void *)*MEMORY[0x1E0CD69A0];
  v82 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v81, v82, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
    objc_storeStrong((id *)&self->_userDescription, v83);

  v84 = (const void *)*MEMORY[0x1E0CD6B78];
  v85 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v84, v85, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
    objc_storeStrong((id *)&self->_viewHint, v86);

  v75 = 1;
LABEL_79:

  return v75;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (int)accessibleType
{
  return self->_accessibleType;
}

- (void)setAccessibleType:(int)a3
{
  self->_accessibleType = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)invisible
{
  return self->_invisible;
}

- (void)setInvisible:(BOOL)a3
{
  self->_invisible = a3;
}

- (BOOL)legacy
{
  return self->_legacy;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)removedMetadata
{
  return self->_removedMetadata;
}

- (void)setRemovedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPersistentRef:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)secrets
{
  return self->_secrets;
}

- (void)setSecrets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)syncType
{
  return self->_syncType;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setUserDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setViewHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

@end
