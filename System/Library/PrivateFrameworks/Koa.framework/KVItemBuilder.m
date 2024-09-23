@implementation KVItemBuilder

- (void).cxx_destruct
{
  void *begin;

  objc_storeStrong((id *)&self->_itemId, 0);
  begin = self->_fields.__begin_;
  if (begin)
  {
    self->_fields.__end_ = begin;
    operator delete(begin);
  }
  sub_1B70ED4B4(&self->_fbb.buf_.allocator_);
}

- (id)addFieldWithType:(int64_t)a3 value:(id)a4 error:(id *)a5
{
  objc_msgSend__addFieldWithType_localeType_label_value_error_(self, a2, a3, 0, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)setItemType:(int64_t)a3 itemId:(id)a4 error:(id *)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  KVItemBuilder *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  const char *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v13 = v9;
  if ((unsigned __int16)a3 - 1 >= 0x19)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2938];
    v18 = (void *)MEMORY[0x1E0CB3940];
    KVItemTypeDescription(a3, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("Cannot set invalid item type: %@"), v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v39, (uint64_t)&v38, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v25, (uint64_t)CFSTR("com.apple.koa.item.builder"), 1, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a5 && v26)
      *a5 = objc_retainAutorelease(v26);

    goto LABEL_8;
  }
  if (!objc_msgSend_length(v9, v10, v11, v12))
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("Cannot set invalid itemId: %@"), v15, v13, *MEMORY[0x1E0CB2938]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)&v37, (uint64_t)&v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("com.apple.koa.item.builder"), 2, v22);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v35;
    if (a5 && v35)
    {
      v24 = objc_retainAutorelease(v35);
      *a5 = v24;
    }
LABEL_8:

    objc_msgSend__reset(self, v28, v29, v30);
    v16 = 0;
    goto LABEL_9;
  }
  self->_itemType = a3;
  objc_storeStrong((id *)&self->_itemId, a4);
  v16 = self;
LABEL_9:

  return v16;
}

- (id)buildItemWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  KVItem *v6;
  const char *v7;
  void *v8;

  objc_msgSend_buildBufferWithError_(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [KVItem alloc];
    v8 = (void *)objc_msgSend_initWithBuffer_verify_copy_error_(v6, v7, (uint64_t)v5, 0, 0, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildBufferWithError:(id *)a3
{
  uint64_t v3;
  NSString *itemId;
  const char *v7;
  size_t v8;
  unsigned int v9;
  _BYTE *begin;
  _BYTE *end;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v27;
  int reserved;
  int cur;
  int buf;
  int v31;
  unsigned int v32;
  id v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  if (self->_itemType && (itemId = self->_itemId) != 0)
  {
    v7 = (const char *)objc_msgSend_UTF8String(itemId, a2, (uint64_t)a3, v3);
    v8 = strlen(v7);
    v9 = sub_1B70EB0A0((uint64_t)&self->_fbb, v7, v8);
    begin = self->_fields.__begin_;
    end = self->_fields.__end_;
    v12 = end - begin;
    if (end == begin)
      v13 = (char *)&unk_1B7111978;
    else
      v13 = (char *)self->_fields.__begin_;
    v14 = v12 >> 2;
    sub_1B70EBFE0((uint64_t)&self->_fbb, v12 >> 2, 4uLL);
    if (begin == end)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      v15 = v13 - 4;
      v16 = v14;
      do
      {
        v17 = sub_1B70EB1A4(&self->_fbb, *(_DWORD *)&v15[4 * v16]);
        sub_1B70EB210((uint64_t)&self->_fbb, v17);
        --v16;
      }
      while (v16);
    }
    v27 = sub_1B70EC098((uint64_t)&self->_fbb, v14);
    sub_1B70EB144((uint64_t)&self->_fbb);
    self->_fbb.nested = 1;
    reserved = self->_fbb.buf_.reserved_;
    cur = (int)self->_fbb.buf_.cur_;
    buf = (int)self->_fbb.buf_.buf_;
    sub_1B70EBF34((unint64_t)&self->_fbb, 6, LOWORD(self->_itemType));
    sub_1B70EBC60(&self->_fbb, 4, v9);
    if (v27)
    {
      v31 = sub_1B70EB1A4(&self->_fbb, v27);
      sub_1B70EB018((unint64_t)&self->_fbb, 8, v31);
    }
    v32 = sub_1B70EBC9C((uint64_t)&self->_fbb, reserved - cur + buf);
    sub_1B70EC0D4((uint64_t)&self->_fbb, v32, 0, 0);
    v33 = objc_alloc(MEMORY[0x1E0C99D50]);
    v34 = sub_1B70EC038((uint64_t)&self->_fbb);
    v36 = (void *)objc_msgSend_initWithBytes_length_(v33, v35, v34, (LODWORD(self->_fbb.buf_.reserved_)- LODWORD(self->_fbb.buf_.cur_)+ LODWORD(self->_fbb.buf_.buf_)));
    objc_msgSend__reset(self, v37, v38, v39);
    if ((unint64_t)objc_msgSend_length(v36, v40, v41, v42) < 0xC801)
    {
      v59 = v36;
    }
    else
    {
      v46 = (void *)MEMORY[0x1E0CB35C8];
      v60 = *MEMORY[0x1E0CB2938];
      v47 = (void *)MEMORY[0x1E0CB3940];
      v48 = objc_msgSend_length(v36, v43, v44, v45);
      KVItemTypeDescription(self->_itemType, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v47, v51, (uint64_t)CFSTR("Cannot build item with size: %lu exceeding the maximum allowed size: %lu. itemType: %@ itemId: %@"), v52, v48, 51200, v50, self->_itemId);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v53;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)&v61, (uint64_t)&v60, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v46, v56, (uint64_t)CFSTR("com.apple.koa.item.builder"), 7, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (a3)
      {
        if (v57)
          *a3 = objc_retainAutorelease(v57);
      }

      v59 = 0;
    }

    return v59;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v62 = *MEMORY[0x1E0CB2938];
    v63[0] = CFSTR("required properties \"itemType\" and \"itemId\" are not set.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v63, (uint64_t)&v62, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("com.apple.koa.item.builder"), 8, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a3 && v21)
      *a3 = objc_retainAutorelease(v21);

    objc_msgSend__reset(self, v23, v24, v25);
    return 0;
  }
}

- (id)_addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7
{
  id v12;
  const char *v13;
  id v14;
  int64_t itemType;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  size_t v34;
  unsigned int v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  id v50;
  void *v51;
  void *v52;
  objc_class *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_class *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  KVItemBuilder *v77;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  size_t v83;
  unsigned int v84;
  int cur;
  int buf;
  char *v87;
  char *v88;
  char *v89;
  unint64_t v90;
  unsigned int max_voffset;
  int v92;
  int v93;
  int v94;
  char *value;
  char *end;
  void *v97;
  char *begin;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  BOOL v102;
  unint64_t v103;
  uint64_t v104;
  _DWORD *v105;
  void *v106;
  int v107;
  int reserved;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  _QWORD v120[2];

  v120[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v14 = a6;
  itemType = self->_itemType;
  if (!itemType || !self->_itemId)
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v119 = *MEMORY[0x1E0CB2938];
    v120[0] = CFSTR("Cannot add field before setting required fields item type and itemId.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v120, (uint64_t)&v119, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v36, v38, (uint64_t)CFSTR("com.apple.koa.item.builder"), 8, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (a7 && v39)
    {
      v40 = objc_retainAutorelease(v39);
      *a7 = v40;
    }
    goto LABEL_27;
  }
  if (KVItemTypeFromFieldType(a3) != itemType)
  {
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v117 = *MEMORY[0x1E0CB2938];
    v42 = (void *)MEMORY[0x1E0CB3940];
    KVFieldTypeDescription(a3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    KVItemTypeDescription(self->_itemType, v43);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v42, v44, (uint64_t)CFSTR("Cannot add field with invalid type: %@ to item of type: %@ itemId: %@"), v45, v37, v40, self->_itemId);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v46;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)&v118, (uint64_t)&v117, 1);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v49, (uint64_t)CFSTR("com.apple.koa.item.builder"), 4, v48);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v115 = *MEMORY[0x1E0CB2938];
      v52 = (void *)MEMORY[0x1E0CB3940];
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      KVItemTypeDescription(self->_itemType, v54);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v52, v55, (uint64_t)CFSTR("Cannot add field label of unsupported class: %@ to item of type: %@ with itemId: %@"), v56, v37, v40, self->_itemId);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v46;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)&v116, (uint64_t)&v115, 1);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v51, v58, (uint64_t)CFSTR("com.apple.koa.item.builder"), 3, v48);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v66 = (void *)MEMORY[0x1E0CB35C8];
      v113 = *MEMORY[0x1E0CB2938];
      v67 = (void *)MEMORY[0x1E0CB3940];
      v68 = (objc_class *)objc_opt_class();
      NSStringFromClass(v68);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      KVItemTypeDescription(self->_itemType, v69);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v67, v70, (uint64_t)CFSTR("Cannot add field value of unsupported class: %@ to item of type: %@ with itemId: %@"), v71, v37, v40, self->_itemId);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v46;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v72, (uint64_t)&v114, (uint64_t)&v113, 1);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v66, v73, (uint64_t)CFSTR("com.apple.koa.item.builder"), 3, v48);
      v50 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      if (a7 && v50)
      {
        v50 = objc_retainAutorelease(v50);
        *a7 = v50;
      }

      goto LABEL_26;
    }
  }
  if ((unint64_t)a4 >= 0x2D)
  {
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v111 = *MEMORY[0x1E0CB2938];
    v60 = (void *)MEMORY[0x1E0CB3940];
    KVLocaleTypeDescription(a4, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v60, v61, (uint64_t)CFSTR("Cannot add field with invalid locale type: %@ itemId: %@"), v62, v37, self->_itemId);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v112 = v40;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)&v112, (uint64_t)&v111, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v59, v64, (uint64_t)CFSTR("com.apple.koa.item.builder"), 9, v46);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v65;
    if (a7 && v65)
    {
      v48 = objc_retainAutorelease(v65);
      *a7 = v48;
    }
LABEL_26:

LABEL_27:
    objc_msgSend__reset(self, v74, v75, v76);
    v77 = 0;
    goto LABEL_28;
  }
  v19 = (void *)objc_msgSend_copy(v12, v16, v17, v18);
  v23 = (void *)objc_msgSend_copy(v14, v20, v21, v22);
  if (objc_msgSend_length(v19, v24, v25, v26) || objc_msgSend_length(v23, v27, v28, v29))
  {
    v109 = v23;
    v110 = v19;
    if (objc_msgSend_length(v23, v27, v28, v29))
    {
      v33 = (const char *)objc_msgSend_UTF8String(v23, v30, v31, v32);
      v34 = strlen(v33);
      v35 = sub_1B70EB0A0((uint64_t)&self->_fbb, v33, v34);
    }
    else
    {
      v35 = 0;
    }
    if (objc_msgSend_length(v19, v30, v31, v32))
    {
      v82 = (const char *)objc_msgSend_UTF8String(v19, v79, v80, v81);
      v83 = strlen(v82);
      v84 = sub_1B70EB0A0((uint64_t)&self->_fbb, v82, v83);
    }
    else
    {
      v84 = 0;
    }
    sub_1B70EB144((uint64_t)&self->_fbb);
    self->_fbb.nested = 1;
    reserved = self->_fbb.buf_.reserved_;
    cur = (int)self->_fbb.buf_.cur_;
    buf = (int)self->_fbb.buf_.buf_;
    sub_1B70EBF34((unint64_t)&self->_fbb, 4, (unsigned __int16)a3);
    sub_1B70EBC60(&self->_fbb, 6, v35);
    sub_1B70EBC60(&self->_fbb, 8, v84);
    if ((_BYTE)a4 || self->_fbb.force_defaults_)
    {
      sub_1B70EB41C((uint64_t)&self->_fbb, 1uLL);
      sub_1B70EB2AC((uint64_t *)&self->_fbb, 1uLL);
      v87 = self->_fbb.buf_.cur_;
      self->_fbb.buf_.cur_ = v87 - 1;
      *(v87 - 1) = a4;
      v88 = self->_fbb.buf_.buf_;
      v89 = self->_fbb.buf_.cur_;
      v90 = self->_fbb.buf_.reserved_;
      sub_1B70EB2AC((uint64_t *)&self->_fbb, 8uLL);
      *(_QWORD *)self->_fbb.buf_.scratch_ = (v90 - (_DWORD)v89 + (_DWORD)v88) | 0xA00000000;
      self->_fbb.buf_.scratch_ += 8;
      ++self->_fbb.num_field_loc;
      max_voffset = self->_fbb.max_voffset_;
      if (max_voffset <= 0xA)
        LOWORD(max_voffset) = 10;
      self->_fbb.max_voffset_ = max_voffset;
    }
    v92 = reserved - cur + buf;
    v23 = v109;
    v19 = v110;
    v93 = sub_1B70EBC9C((uint64_t)&self->_fbb, v92);
    v94 = v93;
    end = (char *)self->_fields.__end_;
    value = (char *)self->_fields.__end_cap_.__value_;
    if (end >= value)
    {
      begin = (char *)self->_fields.__begin_;
      v99 = (end - begin) >> 2;
      v100 = v99 + 1;
      if ((unint64_t)(v99 + 1) >> 62)
        sub_1B70F2EF4();
      v101 = value - begin;
      if (v101 >> 1 > v100)
        v100 = v101 >> 1;
      v102 = (unint64_t)v101 >= 0x7FFFFFFFFFFFFFFCLL;
      v103 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v102)
        v103 = v100;
      if (v103)
      {
        v103 = (unint64_t)sub_1B70F2F08(v103);
        begin = (char *)self->_fields.__begin_;
        end = (char *)self->_fields.__end_;
      }
      else
      {
        v104 = 0;
      }
      v105 = (_DWORD *)(v103 + 4 * v99);
      v106 = (void *)(v103 + 4 * v104);
      *v105 = v94;
      v97 = v105 + 1;
      while (end != begin)
      {
        v107 = *((_DWORD *)end - 1);
        end -= 4;
        *--v105 = v107;
      }
      self->_fields.__begin_ = v105;
      self->_fields.__end_ = v97;
      self->_fields.__end_cap_.__value_ = v106;
      if (begin)
        operator delete(begin);
    }
    else
    {
      *(_DWORD *)end = v93;
      v97 = end + 4;
    }
    self->_fields.__end_ = v97;
  }
  v77 = self;

LABEL_28:
  return v77;
}

- (void)_reset
{
  char *buf;
  char *v4;
  char *string_pool;
  NSString *itemId;

  self->_fbb.num_field_loc = 0;
  self->_fbb.max_voffset_ = 0;
  buf = self->_fbb.buf_.buf_;
  if (buf)
  {
    v4 = &buf[self->_fbb.buf_.reserved_];
  }
  else
  {
    v4 = 0;
    self->_fbb.buf_.reserved_ = 0;
  }
  self->_fbb.buf_.cur_ = v4;
  self->_fbb.buf_.scratch_ = buf;
  *(_WORD *)&self->_fbb.nested = 0;
  self->_fbb.minalign_ = 1;
  string_pool = (char *)self->_fbb.string_pool;
  if (string_pool)
  {
    sub_1B70EEE38(*((_QWORD **)string_pool + 1));
    *(_QWORD *)string_pool = string_pool + 8;
    *((_QWORD *)string_pool + 2) = 0;
    *((_QWORD *)string_pool + 1) = 0;
  }
  self->_fields.__end_ = self->_fields.__begin_;
  itemId = self->_itemId;
  self->_itemType = 0;
  self->_itemId = 0;

}

- (KVItemBuilder)init
{
  KVItemBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KVItemBuilder;
  result = -[KVItemBuilder init](&v3, sel_init);
  if (result)
    result->_itemType = 0;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = xmmword_1B7111340;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 1;
  *((_WORD *)self + 44) = 256;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 value:(id)a5 error:(id *)a6
{
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (a4)
  {
    objc_msgSend__addFieldWithType_localeType_label_value_error_(self, v10, a3, a4, 0, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    v14 = (void *)MEMORY[0x1E0CB3940];
    KVLocaleTypeDescription(0, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("Cannot add field with invalid locale type: %@ itemId: %@"), v17, v15, self->_itemId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v29, (uint64_t)&v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v21, (uint64_t)CFSTR("com.apple.koa.item.builder"), 9, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a6 && v22)
      *a6 = objc_retainAutorelease(v22);

    objc_msgSend__reset(self, v24, v25, v26);
    v12 = 0;
  }

  return v12;
}

- (id)addFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6
{
  objc_msgSend__addFieldWithType_localeType_label_value_error_(self, a2, a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7
{
  id v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v14 = a6;
  if (a4)
  {
    objc_msgSend__addFieldWithType_localeType_label_value_error_(self, v13, a3, a4, v12, v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2938];
    v17 = (void *)MEMORY[0x1E0CB3940];
    KVLocaleTypeDescription(0, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("Cannot add field with invalid locale type: %@ itemId: %@"), v20, v18, self->_itemId);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v32, (uint64_t)&v31, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v24, (uint64_t)CFSTR("com.apple.koa.item.builder"), 9, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a7 && v25)
      *a7 = objc_retainAutorelease(v25);

    objc_msgSend__reset(self, v27, v28, v29);
    v15 = 0;
  }

  return v15;
}

+ (id)buildFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  size_t v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  unsigned int v70;
  id v71;
  uint64_t v72;
  const char *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int *v78;
  const char *v79;
  uint64_t v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  _QWORD v95[2];

  v95[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!KVItemTypeFromFieldType(a3))
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v94 = *MEMORY[0x1E0CB2938];
    v25 = (void *)MEMORY[0x1E0CB3940];
    KVFieldTypeDescription(a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("Cannot build field with invalid type: %@"), v28, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v95, (uint64_t)&v94, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v32, (uint64_t)CFSTR("com.apple.koa.item.builder"), 4, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a6 && v33)
      *a6 = objc_retainAutorelease(v33);

    goto LABEL_20;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v92 = *MEMORY[0x1E0CB2938];
      v36 = (void *)MEMORY[0x1E0CB3940];
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v36, v39, (uint64_t)CFSTR("Cannot build field with label of unsupported class: %@"), v40, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v41;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)&v93, (uint64_t)&v92, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v35, v44, (uint64_t)CFSTR("com.apple.koa.item.builder"), 3, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (a6 && v45)
        *a6 = objc_retainAutorelease(v45);

      goto LABEL_20;
    }
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v90 = *MEMORY[0x1E0CB2938];
      v48 = (void *)MEMORY[0x1E0CB3940];
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v48, v51, (uint64_t)CFSTR("Cannot build field with value of unsupported class: %@"), v52, v50);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v53;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)&v91, (uint64_t)&v90, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v47, v56, (uint64_t)CFSTR("com.apple.koa.item.builder"), 3, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (a6 && v57)
        *a6 = objc_retainAutorelease(v57);

LABEL_20:
      v59 = 0;
      goto LABEL_26;
    }
  }
  v81 = 0;
  v82 = 0;
  v83 = xmmword_1B7111340;
  v84 = 0u;
  v85 = 0u;
  v86 = 0;
  v87 = 1;
  v88 = 256;
  v89 = 0;
  if (objc_msgSend_length(v10, v11, v12, v13))
  {
    v17 = objc_retainAutorelease(v10);
    v21 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    v22 = strlen(v21);
    v23 = sub_1B70EB0A0((uint64_t)&v81, v21, v22);
  }
  else
  {
    v23 = 0;
  }
  if (objc_msgSend_length(v9, v14, v15, v16))
  {
    v60 = objc_retainAutorelease(v9);
    v64 = (const char *)objc_msgSend_UTF8String(v60, v61, v62, v63);
    v65 = strlen(v64);
    v66 = sub_1B70EB0A0((uint64_t)&v81, v64, v65);
  }
  else
  {
    v66 = 0;
  }
  sub_1B70EB144((uint64_t)&v81);
  BYTE6(v86) = 1;
  v67 = v85;
  v68 = v84;
  v69 = DWORD2(v84);
  sub_1B70EBF34((unint64_t)&v81, 4, (unsigned __int16)a3);
  sub_1B70EBC60(&v81, 6, v23);
  sub_1B70EBC60(&v81, 8, v66);
  v70 = sub_1B70EBC9C((uint64_t)&v81, v68 - v67 + v69);
  sub_1B70EC0D4((uint64_t)&v81, v70, 0, 0);
  v71 = objc_alloc(MEMORY[0x1E0C99D50]);
  v72 = sub_1B70EC038((uint64_t)&v81);
  v74 = objc_retainAutorelease((id)objc_msgSend_initWithBytes_length_(v71, v73, v72, (v84 - v85 + DWORD2(v84))));
  v78 = (unsigned int *)objc_msgSend_bytes(v74, v75, v76, v77);
  objc_msgSend_fieldWithBuffer_root_(KVField, v79, (uint64_t)v74, (uint64_t)v78 + *v78);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1B70ED4B4(&v81);
LABEL_26:

  return v59;
}

@end
