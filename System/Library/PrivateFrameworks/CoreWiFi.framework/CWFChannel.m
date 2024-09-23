@implementation CWFChannel

- (unint64_t)hash
{
  return self->_channel ^ self->_flags;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t channel;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  channel = self->_channel;
  v14 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v4, v6, channel, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v14, v10, (uint64_t)v9, (uint64_t)CFSTR("_channel"), v11);

  objc_msgSend_encodeInt_forKey_(v14, v12, self->_flags, (uint64_t)CFSTR("_flags"), v13);
}

- (CWFChannel)initWithCoder:(id)a3
{
  id v4;
  CWFChannel *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CWFChannel;
  v5 = -[CWFChannel init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_channel"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_channel = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    v5->_flags = objc_msgSend_decodeIntForKey_(v4, v14, (uint64_t)CFSTR("_flags"), v15, v16);
  }

  return v5;
}

- (BOOL)is6GHz
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  unsigned int v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend_band(self, a2, v2, v3, v4);
  sub_1B0631030(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_channel(self, v9, v10, v11, v12);
  v18 = objc_msgSend_width(self, v14, v15, v16, v17);
  objc_msgSend_stringWithFormat_(v6, v19, (uint64_t)CFSTR("%@%ld/%d"), v20, v21, v8, v13, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (BOOL)isEqual:(id)a3
{
  CWFChannel *v4;
  CWFChannel *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToChannel;

  v4 = (CWFChannel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToChannel = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToChannel = objc_msgSend_isEqualToChannel_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToChannel = 0;
  }

  return isEqualToChannel;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4;
  unint64_t channel;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int flags;
  BOOL v15;

  v4 = a3;
  channel = self->_channel;
  if (channel == objc_msgSend_channel(v4, v6, v7, v8, v9))
  {
    flags = self->_flags;
    v15 = flags == objc_msgSend_flags(v4, v10, v11, v12, v13);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (unsigned)flags
{
  return self->_flags;
}

- (int)width
{
  unsigned int flags;
  int v3;

  flags = self->_flags;
  if ((flags & 0x800) != 0)
    return 160;
  if ((flags & 4) != 0)
    v3 = 40;
  else
    v3 = ((int)(flags << 30) >> 31) & 0x14;
  if ((flags & 0x400) != 0)
    return 80;
  else
    return v3;
}

- (unsigned)band
{
  unsigned int flags;
  unsigned int v3;

  flags = self->_flags;
  if ((flags & 0x10) != 0)
    v3 = 2;
  else
    v3 = ((int)(flags << 18) >> 31) & 3;
  if ((flags & 8) != 0)
    return 1;
  else
    return v3;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isDFS
{
  return BYTE1(self->_flags) & 1;
}

- (BOOL)is2GHz
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)is5GHz
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)is6GHzPSC
{
  unint64_t v2;
  int channel;
  int v4;
  BOOL result;

  if ((~self->_flags & 0x2002) != 0)
    return 0;
  v2 = 0;
  channel = self->_channel;
  do
  {
    v4 = dword_1B07114E8[v2];
    result = v4 == channel;
    if (v2 > 0xD)
      break;
    ++v2;
  }
  while (v4 != channel);
  return result;
}

+ (CWFChannel)channelWithNumber:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5
{
  CWFChannel *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;

  v8 = objc_alloc_init(CWFChannel);
  objc_msgSend_setChannel_(v8, v9, a3, v10, v11);
  if (a4 - 1 > 2)
    v15 = 0;
  else
    v15 = dword_1B0711524[a4 - 1];
  v16 = v15 | 0x400;
  v17 = v15 | 0x800;
  if (a5 != 160)
    v17 = v15;
  if (a5 != 80)
    v16 = v17;
  v18 = v15 | 2;
  if (a5 == 40)
    v15 |= 4u;
  if (a5 == 20)
    v15 = v18;
  if (a5 <= 79)
    objc_msgSend_setFlags_(v8, v12, v15, v13, v14);
  else
    objc_msgSend_setFlags_(v8, v12, v16, v13, v14);
  return v8;
}

- (NSString)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  unsigned int v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend_band(self, a2, v2, v3, v4);
  sub_1B0631030(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_channel(self, v9, v10, v11, v12);
  v18 = objc_msgSend_width(self, v14, v15, v16, v17);
  v23 = objc_msgSend_flags(self, v19, v20, v21, v22);
  objc_msgSend_stringWithFormat_(v6, v24, (uint64_t)CFSTR("%@%ld/%d (0x%x)"), v25, v26, v8, v13, v18, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFChannel, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setChannel_(v11, v12, self->_channel, v13, v14);
  objc_msgSend_setFlags_(v11, v15, self->_flags, v16, v17);
  return v11;
}

- (BOOL)extAbove
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (objc_msgSend_flags(self, a2, v2, v3, v4) >> 9) & 1;
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t isDFS;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_channel(self, v8, v9, v10, v11);
  objc_msgSend_numberWithUnsignedInteger_(v7, v13, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("channel"), v18);

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_flags(self, v20, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInt_(v19, v25, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v29, (uint64_t)v28, (uint64_t)CFSTR("flags"), v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  isDFS = objc_msgSend_isDFS(self, v32, v33, v34, v35);
  objc_msgSend_numberWithBool_(v31, v37, isDFS, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v41, (uint64_t)v40, (uint64_t)CFSTR("dfs"), v42);

  v43 = (void *)MEMORY[0x1E0CB37E8];
  v48 = objc_msgSend_extAbove(self, v44, v45, v46, v47);
  objc_msgSend_numberWithBool_(v43, v49, v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, (uint64_t)CFSTR("ext_above"), v54);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_flags(self, v60, v61, v62, v63) & 2) != 0)
    objc_msgSend_addObject_(v59, v64, (uint64_t)&unk_1E615F618, v66, v67);
  if ((objc_msgSend_flags(self, v64, v65, v66, v67) & 4) != 0)
    objc_msgSend_addObject_(v59, v68, (uint64_t)&unk_1E615F630, v70, v71);
  if ((objc_msgSend_flags(self, v68, v69, v70, v71) & 0x400) != 0)
    objc_msgSend_addObject_(v59, v72, (uint64_t)&unk_1E615F648, v74, v75);
  if ((objc_msgSend_flags(self, v72, v73, v74, v75) & 0x800) != 0)
    objc_msgSend_addObject_(v59, v76, (uint64_t)&unk_1E615F660, v77, v78);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v59, (uint64_t)CFSTR("widths"), v78);
  if ((objc_msgSend_flags(self, v79, v80, v81, v82) & 0x2000) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v83, (uint64_t)&unk_1E615F678, (uint64_t)CFSTR("band"), v86);
  }
  else if ((objc_msgSend_flags(self, v83, v84, v85, v86) & 0x10) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v87, (uint64_t)&unk_1E615F690, (uint64_t)CFSTR("band"), v90);
  }
  else if ((objc_msgSend_flags(self, v87, v88, v89, v90) & 8) != 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v91, (uint64_t)&unk_1E615F6A8, (uint64_t)CFSTR("band"), v92);
  }
  sub_1B06475A8(v6, 0, 1u);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v93, (uint64_t)v96, v94, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v97 = 0;
  }

  return v97;
}

@end
