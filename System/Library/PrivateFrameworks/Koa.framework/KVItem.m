@implementation KVItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (id)toCascadeItem:(id *)a3
{
  return (id)MEMORY[0x1E0DE7D20](KVItemConverter, sel_cascadeItemFromItem_error_, self, a3);
}

- (int64_t)itemType
{
  const Item *item;
  const Item *v3;
  uint64_t v4;

  item = self->_item;
  v3 = &item[-*(int *)item->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(unsigned __int16 *)item[v4].var0;
  else
    return 0;
}

- (KVItem)initWithBuffer:(id)a3 verify:(BOOL)a4 copy:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  unsigned int *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  char *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int *v60;
  uint64_t v61;
  unint64_t v62;
  unsigned int *v63;
  char *v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int *v70;
  char *v71;
  uint64_t v72;
  unsigned int *v73;
  char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL4 v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  KVItem *v87;
  void *v88;
  void *v89;
  const char *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  unsigned __int16 v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  void *v108;
  void *v109;
  unsigned int *v111;
  unsigned int *v112;
  char *v113;
  char *v114;
  unint64_t v115;
  __int128 v116;
  uint64_t v117;
  char v118;
  objc_super v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  const __CFString *v125;
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  _QWORD v131[3];

  v7 = a5;
  v8 = a4;
  v131[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v119.receiver = self;
  v119.super_class = (Class)KVItem;
  v13 = -[KVItem init](&v119, sel_init);
  if (!v13)
    goto LABEL_70;
  if (v8)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v128 = *MEMORY[0x1E0CB2D50];
        v40 = (void *)MEMORY[0x1E0CB3940];
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v40, v43, (uint64_t)CFSTR("Buffer has unexpected class: %@ expected: NSData"), v44, v42);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v45;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v46, (uint64_t)&v129, (uint64_t)&v128, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v39, v48, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (a6 && v49)
          *a6 = objc_retainAutorelease(v49);

        goto LABEL_83;
      }
      if (objc_msgSend_length(v10, v14, v15, v16))
        goto LABEL_6;
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v126 = *MEMORY[0x1E0CB2D50];
      v127 = CFSTR("Buffer has length of zero");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)&v127, (uint64_t)&v126, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v51, v52, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v35);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v53;
      if (a6 && v53)
        *a6 = objc_retainAutorelease(v53);
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v130 = *MEMORY[0x1E0CB2D50];
      v131[0] = CFSTR("Buffer is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v131, (uint64_t)&v130, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v34, v36, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (a6 && v37)
        *a6 = objc_retainAutorelease(v37);
    }

LABEL_83:
    v87 = 0;
    goto LABEL_84;
  }
LABEL_6:
  if (v7)
  {
    objc_msgSend_dataWithData_(MEMORY[0x1E0C99D50], v11, (uint64_t)v10, v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v10;
  }
  v18 = (void *)*((_QWORD *)v13 + 2);
  *((_QWORD *)v13 + 2) = v17;

  v25 = (char *)objc_msgSend_bytes(*((void **)v13 + 2), v19, v20, v21);
  *((_QWORD *)v13 + 1) = &v25[*(unsigned int *)v25];
  if (!v8)
    goto LABEL_70;
  v26 = objc_msgSend_length(*((void **)v13 + 2), v22, v23, v24);
  v114 = v25;
  v115 = v26;
  v116 = xmmword_1B7111350;
  v117 = 0;
  v118 = 1;
  if (v26 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v30 = (int *)*((_QWORD *)v13 + 1);
  if (v30)
  {
    if (sub_1B70EEC48((uint64_t *)&v114, *((int **)v13 + 1)) && sub_1B70EED00(v30, &v114, 4u))
    {
      v31 = (unsigned __int16 *)((char *)v30 - *v30);
      if (*v31 >= 5u && (v32 = v31[2]) != 0)
        v33 = (unsigned int *)((char *)v30 + v32 + *(unsigned int *)((char *)v30 + v32));
      else
        v33 = 0;
      if (sub_1B70EED54(&v114, v33))
      {
        v54 = *v30;
        v55 = (char *)v30 - v54;
        v56 = *(unsigned __int16 *)((char *)v30 - v54);
        if ((v56 < 7
           || !*((_WORD *)v55 + 3)
           || v115 >= 3 && v115 - 2 >= (char *)v30 + *((unsigned __int16 *)v55 + 3) - v114)
          && sub_1B70EED00(v30, &v114, 8u))
        {
          if (v56 < 9)
            goto LABEL_67;
          if (!*((_WORD *)v55 + 4))
          {
            v58 = -v54;
            goto LABEL_42;
          }
          if (sub_1B70EEDC8((uint64_t)&v114, (unsigned int *)((char *)v30+ *((unsigned __int16 *)v55 + 4)+ *(unsigned int *)((char *)v30 + *((unsigned __int16 *)v55 + 4))), 4uLL, 0))
          {
            v57 = *v30;
            if (*(unsigned __int16 *)((char *)v30 - v57) >= 9u)
            {
              v58 = -v57;
LABEL_42:
              v59 = *(unsigned __int16 *)((char *)v30 + v58 + 8);
              if (v59)
              {
                v60 = (unsigned int *)((char *)v30 + v59);
                v61 = *v60;
                v111 = v60;
                if (*(unsigned int *)((char *)v60 + v61))
                {
                  v62 = 0;
                  v63 = v60;
                  v112 = v60 + 1;
                  do
                  {
                    v64 = (char *)v63 + v61;
                    v65 = *(unsigned int *)((char *)v63 + v61 + 4);
                    v66 = (int *)((char *)v63 + v61 + v65 + 4);
                    if (!sub_1B70EEC48((uint64_t *)&v114, v66))
                      goto LABEL_71;
                    v113 = &v64[v65];
                    v67 = v65 - *(int *)&v64[v65 + 4];
                    v68 = *(unsigned __int16 *)&v64[v67 + 4];
                    if (v68 >= 5
                      && *(_WORD *)((char *)v63 + v61 + v67 + 8)
                      && (v115 < 3
                       || v115 - 2 < (unint64_t)v112
                                   + v61
                                   + v65
                                   + *(unsigned __int16 *)((char *)v63 + v61 + v67 + 8)
                                   - (_QWORD)v114))
                    {
                      goto LABEL_71;
                    }
                    if (!sub_1B70EED00(v66, &v114, 6u))
                      goto LABEL_71;
                    if (v68 >= 7 && *(_WORD *)((char *)v63 + v61 + v67 + 10))
                    {
                      v69 = v65 + *(unsigned __int16 *)((char *)v63 + v61 + v67 + 10);
                      v70 = (unsigned int *)((char *)v63 + v61
                                                         + v69
                                                         + *(unsigned int *)((char *)v63 + v61 + v69 + 4)
                                                         + 4);
                    }
                    else
                    {
                      v70 = 0;
                    }
                    if (!sub_1B70EED54(&v114, v70) || !sub_1B70EED00(v66, &v114, 8u))
                      goto LABEL_71;
                    v71 = (char *)v63 + v61 + v65 - *((int *)v113 + 1);
                    if (*((unsigned __int16 *)v71 + 2) >= 9u && (v72 = *((unsigned __int16 *)v71 + 6)) != 0)
                      v73 = (unsigned int *)((char *)v63
                                           + v61
                                           + v65
                                           + v72
                                           + *(unsigned int *)((char *)v63 + v61 + v65 + v72 + 4)
                                           + 4);
                    else
                      v73 = 0;
                    if (!sub_1B70EED54(&v114, v73))
                      goto LABEL_71;
                    v74 = (char *)v63 + v61 + v65 - *((int *)v113 + 1);
                    if (*((unsigned __int16 *)v74 + 2) >= 0xBu)
                    {
                      v75 = *((unsigned __int16 *)v74 + 7);
                      if (v75)
                      {
                        if (v115 < 2 || v115 - 1 < (unint64_t)v112 + v61 + v65 + v75 - (_QWORD)v114)
                          goto LABEL_71;
                      }
                    }
                    LODWORD(v116) = v116 - 1;
                    ++v62;
                    ++v112;
                    ++v63;
                  }
                  while (v62 < *(unsigned int *)((char *)v111 + v61));
                }
              }
            }
LABEL_67:
            LODWORD(v116) = v116 - 1;
            goto LABEL_68;
          }
        }
      }
    }
LABEL_71:
    v88 = (void *)MEMORY[0x1E0CB35C8];
    v124 = *MEMORY[0x1E0CB2D50];
    v125 = CFSTR("Buffer failed validation");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)&v125, (uint64_t)&v124, 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v88, v90, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if (a6 && v91)
    {
      v92 = objc_retainAutorelease(v91);
      *a6 = v92;
    }
    goto LABEL_82;
  }
LABEL_68:
  if ((unsigned __int16)objc_msgSend_itemType(v13, v27, v28, v29) - 1 >= 0x19)
  {
    v93 = (void *)MEMORY[0x1E0CB35C8];
    v122 = *MEMORY[0x1E0CB2D50];
    v94 = (void *)MEMORY[0x1E0CB3940];
    v95 = objc_msgSend_itemType(v13, v76, v77, v78);
    objc_msgSend_stringWithFormat_(v94, v96, (uint64_t)CFSTR("Buffer has invalid itemType: %u"), v97, v95);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v89;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v98, (uint64_t)&v123, (uint64_t)&v122, 1);
    v92 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v93, v99, (uint64_t)CFSTR("com.apple.koa.item.builder"), 1, v92);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (a6 && v100)
    {
      v101 = objc_retainAutorelease(v100);
      *a6 = v101;
    }
    goto LABEL_81;
  }
  objc_msgSend_itemId(v13, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend_length(v79, v80, v81, v82) == 0;

  if (v83)
  {
    v102 = (void *)MEMORY[0x1E0CB35C8];
    v120 = *MEMORY[0x1E0CB2D50];
    v103 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_itemId(v13, v84, v85, v86);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v103, v104, (uint64_t)CFSTR("Buffer has invalid itemId: %@"), v105, v89);
    v92 = (id)objc_claimAutoreleasedReturnValue();
    v121 = v92;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v106, (uint64_t)&v121, (uint64_t)&v120, 1);
    v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v102, v107, (uint64_t)CFSTR("com.apple.koa.item.builder"), 2, v101);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (a6 && v108)
      *a6 = objc_retainAutorelease(v108);

LABEL_81:
LABEL_82:

    goto LABEL_83;
  }
LABEL_70:
  v87 = (KVItem *)v13;
LABEL_84:

  return v87;
}

- (id)itemId
{
  const Item *v2;
  id v4;
  const char *v5;
  const Item *item;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const Item *v10;
  __CFString *v11;

  v2 = &self->_item[-*(int *)self->_item];
  if (*(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    item = self->_item;
    v7 = *(int *)item->var0;
    v8 = *(unsigned __int16 *)item[-v7 + 4].var0;
    if (*(_WORD *)item[-v7 + 4].var0)
    {
      v9 = *(unsigned int *)item[v8].var0;
      v10 = &item[v8 + v9];
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = *(unsigned int *)item->var0;
    }
    v11 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)item[v8 + v9].var0, 4, 0);
  }
  else
  {
    v11 = &stru_1E6B7B918;
  }
  return v11;
}

- (void)enumerateFieldsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, char *);
  const Item *v5;
  uint64_t v6;
  uint64_t v7;
  const Item *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  KVField *v12;
  const char *v13;
  void *v14;
  char v15;

  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  v15 = 0;
  v5 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v6 = *(unsigned int *)v5->var0;
  v8 = &v5[v6 + 4];
  v7 = *(unsigned int *)v5[v6].var0;
  if ((_DWORD)v7)
  {
    v9 = 0;
    v10 = 4 * v7;
    do
    {
      if (v15)
        break;
      v11 = *(unsigned int *)v8->var0;
      v12 = [KVField alloc];
      v14 = (void *)objc_msgSend_initWithBuffer_root_(v12, v13, (uint64_t)self->_buffer, (uint64_t)&v8[v11]);
      v4[2](v4, v14, v9++, &v15);

      v8 += 4;
      v10 -= 4;
    }
    while (v10);
  }

}

- (KVItem)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)description
{
  uint64_t v2;

  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2);
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  _QWORD v35[4];
  id v36;
  unsigned __int8 v37;

  sub_1B7103470(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B7103470(a3 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v7, v8, (uint64_t)CFSTR("%@{\n"), v9, v5);
  v13 = objc_msgSend_itemType(self, v10, v11, v12);
  if (v13 - 1 >= 0x19)
    v15 = 0;
  else
    v15 = v13;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v14, (uint64_t)off_1E6B7ADF0[v15], 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v17, (uint64_t)CFSTR("%@\"%@\": \"%@\",\n"), v18, v6, CFSTR("itemType"), v16);

  objc_msgSend_itemId(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B71034E4((uint64_t)v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v25, (uint64_t)CFSTR("%@\"%@\": %@,\n"), v26, v6, CFSTR("itemId"), v24);

  objc_msgSend_appendFormat_(v7, v27, (uint64_t)CFSTR("%@\"%@\": [\n"), v28, v6, CFSTR("fields"));
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1B70F9D18;
  v35[3] = &unk_1E6B7B098;
  v29 = v7;
  v36 = v29;
  v37 = a3;
  objc_msgSend_enumerateFieldsUsingBlock_(self, v30, (uint64_t)v35, v31);
  objc_msgSend_appendFormat_(v29, v32, (uint64_t)CFSTR("\n%@]\n%@}"), v33, v6, v5);

  return v29;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  void *v59;
  void *v60;
  KVItem *v62;
  void *v63;
  void *v64;
  id obj;
  id v66;
  KVItemBuilder *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;
  _QWORD v76[3];

  v62 = self;
  v76[1] = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v67 = objc_alloc_init(KVItemBuilder);
  objc_msgSend_objectForKey_(v66, v5, (uint64_t)CFSTR("itemType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = KVItemTypeFromName(v7);

  objc_msgSend_objectForKey_(v66, v9, (uint64_t)CFSTR("itemId"), v10);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setItemType_itemId_error_(v67, v11, v8, (uint64_t)v63, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_objectForKey_(v66, v13, (uint64_t)CFSTR("fields"), v14);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v64;
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v68, (uint64_t)v74, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v69;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v69 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v56 = (void *)MEMORY[0x1E0CB35C8];
              v72 = *MEMORY[0x1E0CB2D50];
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("Unexpected field dictionary: %@ in item: %@"), v23, v21, v66, v62);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v26;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)&v73, (uint64_t)&v72, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v56, v58, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v55);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v59;
              if (a4 && v59)
                *a4 = objc_retainAutorelease(v59);

              goto LABEL_23;
            }
            objc_msgSend_objectForKey_(v21, v22, (uint64_t)CFSTR("localeType"), v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend_objectForKey_(v21, v24, (uint64_t)CFSTR("fieldType"), v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = KVFieldTypeFromName(v27);
              v29 = KVLocaleTypeFromName(v26);
              objc_msgSend_objectForKey_(v21, v30, (uint64_t)CFSTR("label"), v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v21, v33, (uint64_t)CFSTR("value"), v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addFieldWithType_localeType_label_value_error_(v67, v36, v28, v29, v32, v35, a4);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v28) = v37 == 0;

              if ((v28 & 1) != 0)
                goto LABEL_24;
            }
            else
            {
              objc_msgSend_objectForKey_(v21, v24, (uint64_t)CFSTR("fieldType"), v25);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = KVFieldTypeFromName(v38);
              objc_msgSend_objectForKey_(v21, v40, (uint64_t)CFSTR("label"), v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v21, v43, (uint64_t)CFSTR("value"), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addFieldWithType_label_value_error_(v67, v46, v39, (uint64_t)v42, v45, a4);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v39) = v47 == 0;

              if ((v39 & 1) != 0)
              {
                v26 = 0;
                goto LABEL_24;
              }
            }

          }
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v68, (uint64_t)v74, 16);
          if (v18)
            continue;
          break;
        }
      }

      objc_msgSend_buildItemWithError_(v67, v49, (uint64_t)a4, v50);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("Unexpected fields array in item: %@"), v16, v66);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v76[0] = obj;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v52, (uint64_t)v76, (uint64_t)&v75, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v51, v53, (uint64_t)CFSTR("com.apple.koa.item.builder"), 6, v26);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (a4 && v54)
        *a4 = objc_retainAutorelease(v54);
LABEL_23:

LABEL_24:
      v12 = 0;
    }

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  KVItem *v4;
  KVItem *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToItem;

  v4 = (KVItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToItem = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToItem = objc_msgSend_isEqualToItem_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToItem = 0;
  }

  return isEqualToItem;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSData *buffer;
  void *v10;
  const char *v11;
  uint64_t v12;
  char isEqual;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    buffer = self->_buffer;
    objc_msgSend_buffer(v4, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(buffer, v11, (uint64_t)v10, v12);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_buffer, a2, v2, v3);
}

- (void)enumerateFieldsWithLocaleType:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v6 = a4;
  v10 = v6;
  if (a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B70F9C98;
    v11[3] = &unk_1E6B7B0C0;
    v13 = a3;
    v12 = v6;
    objc_msgSend_enumerateFieldsUsingBlock_(self, v8, (uint64_t)v11, v9);

  }
  else
  {
    objc_msgSend_enumerateFieldsUsingBlock_(self, (const char *)v6, (uint64_t)v6, v7);
  }

}

- (id)fieldsWithType:(int64_t)a3
{
  id v5;
  const Item *v6;
  const Item *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const Item *v12;
  const Item *v13;
  uint64_t v14;
  uint64_t v15;
  KVField *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v7 = &v6[*(unsigned int *)v6->var0];
  v8 = *(unsigned int *)v7->var0;
  if ((_DWORD)v8)
  {
    v9 = 0;
    v10 = 4 * v8;
    do
    {
      v11 = *(unsigned int *)v7[v9 + 4].var0;
      v12 = &v7[v9 + v11];
      v13 = &v7[v9 + v11 - *(int *)v12[4].var0];
      if (*(unsigned __int16 *)v13[4].var0 >= 5u && (v14 = *(unsigned __int16 *)v13[8].var0) != 0)
        v15 = *(unsigned __int16 *)v7[v9 + 4 + v11 + v14].var0;
      else
        v15 = 0;
      if (v15 == a3)
      {
        v16 = [KVField alloc];
        v18 = (void *)objc_msgSend_initWithBuffer_root_(v16, v17, (uint64_t)self->_buffer, (uint64_t)&v12[4]);
        objc_msgSend_addObject_(v5, v19, (uint64_t)v18, v20);

      }
      v9 += 4;
    }
    while (v10 != v9);
  }
  return v5;
}

- (id)firstFieldWithType:(int64_t)a3
{
  const Item *v3;
  const Item *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const Item *v10;
  const Item *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  KVField *v16;
  const char *v17;

  v3 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v4 = &v3[*(unsigned int *)v3->var0];
  v5 = *(unsigned int *)v4->var0;
  if ((_DWORD)v5)
  {
    v7 = 0;
    v8 = 4 * v5;
    while (1)
    {
      v9 = *(unsigned int *)v4[v7 + 4].var0;
      v10 = &v4[v7 + v9];
      v11 = &v4[v7 + v9 - *(int *)v10[4].var0];
      if (*(unsigned __int16 *)v11[4].var0 >= 5u && (v12 = *(unsigned __int16 *)v11[8].var0) != 0)
        v13 = *(unsigned __int16 *)v4[v7 + 4 + v9 + v12].var0;
      else
        v13 = 0;
      if (v13 == a3)
        break;
      v7 += 4;
      if (v8 == v7)
        goto LABEL_9;
    }
    v15 = (uint64_t)&v10[4];
    v16 = [KVField alloc];
    v14 = (void *)objc_msgSend_initWithBuffer_root_(v16, v17, (uint64_t)self->_buffer, v15);
  }
  else
  {
LABEL_9:
    v14 = 0;
  }
  return v14;
}

- (unint64_t)fieldCount
{
  const Item *v2;

  v2 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  return *(unsigned int *)v2[*(unsigned int *)v2->var0].var0;
}

- (BOOL)hasFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5
{
  void *v5;
  id v9;
  const Item *v10;
  const Item *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const Item *v16;
  const Item *v17;
  uint64_t v18;
  uint64_t v19;
  KVField *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  char isEqual;
  BOOL v34;
  void *v36;
  KVItem *v37;
  id v38;
  void *v39;
  id v40;

  v40 = a4;
  v9 = a5;
  v37 = self;
  v10 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v11 = &v10[*(unsigned int *)v10->var0];
  v12 = *(unsigned int *)v11->var0;
  if (!(_DWORD)v12)
  {
    v34 = 0;
    goto LABEL_33;
  }
  v38 = v9;
  v13 = 0;
  v14 = 4 * v12;
  while (1)
  {
    v15 = *(unsigned int *)v11[v13 + 4].var0;
    v16 = &v11[v13 + v15];
    v17 = &v11[v13 + v15 - *(int *)v16[4].var0];
    if (*(unsigned __int16 *)v17[4].var0 >= 5u && (v18 = *(unsigned __int16 *)v17[8].var0) != 0)
      v19 = *(unsigned __int16 *)v11[v13 + 4 + v15 + v18].var0;
    else
      v19 = 0;
    if (v19 != a3)
      goto LABEL_24;
    v20 = [KVField alloc];
    v22 = (void *)objc_msgSend_initWithBuffer_root_(v20, v21, (uint64_t)v37->_buffer, (uint64_t)&v16[4]);
    v26 = v22;
    v27 = (uint64_t)v39;
    if (v40 || (objc_msgSend_label(v22, v23, v24, v25), (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v39 = (void *)v27;
      objc_msgSend_label(v26, v23, v24, v25);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v40, v28, (uint64_t)v5, v29) & 1) == 0)
      {

        if (!v40)
        goto LABEL_24;
      }
      LODWORD(v27) = 1;
    }
    else
    {
      v39 = 0;
    }
    if (v38 || (objc_msgSend_value(v26, v23, v24, v25), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_value(v26, v23, v24, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v38, v31, (uint64_t)v30, v32);

      if (v38)
      {
        if (!(_DWORD)v27)
          goto LABEL_21;
LABEL_20:

        goto LABEL_21;
      }

      if ((v27 & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      v36 = 0;
      isEqual = 1;
      if ((v27 & 1) != 0)
        goto LABEL_20;
    }
LABEL_21:
    if (!v40)

    if ((isEqual & 1) != 0)
      break;
LABEL_24:
    v13 += 4;
    if (v14 == v13)
    {
      v34 = 0;
      goto LABEL_32;
    }
  }
  v34 = 1;
LABEL_32:
  v9 = v38;
LABEL_33:

  return v34;
}

- (NSData)buffer
{
  return self->_buffer;
}

+ (id)itemFromBuffer:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithBuffer_verify_copy_error_(v6, v7, (uint64_t)v5, 1, 1, a4);

  return v8;
}

+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4
{
  objc_msgSend_itemFromCascadeItem_error_(KVItemConverter, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
